#include <stdio.h>
#include <stdlib.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "common.h"
#include "expander.h"
#include "stdfix_emu.h"


__memX DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
__memX DSPfract* __memX tmp_channel0;
__memX DSPfract* __memX tmp_channel1;

AudioExpander_t expander;
__memY DSPfract input_gain = FRACT_NUM(0.25);
__memY const DSPfract tap_gain_minus6db = FRACT_NUM(0.25);
__memY const DSPfract tap_gain_5db = FRACT_NUM(0.79);
__memY const DSPfract tap_gain_minus16db = FRACT_NUM(0.025);
__memY const DSPfract tap_gain_3db = FRACT_NUM(0.995);
__memY const DSPint tap_gain_minus1db = -1;
__memY DSPfract ratio = FRACT_NUM(1.0);
__memY DSPfract treshold = FRACT_NUM(0.0);
enum output_mode mode_o = mode1;
DSPint mode = 1;
DSPint enable_processing = 1;

void processing()
{
	 DSPint i;
	__memX DSPfract* pChannel0 = sampleBuffer[0];
	__memX DSPfract* pChannel1 = sampleBuffer[1];
	__memX DSPfract* pChannel2 = sampleBuffer[2];
	__memX DSPfract* pChannel3 = sampleBuffer[3];
	__memX DSPfract* pChannel4 = sampleBuffer[4];

	__memX DSPfract* tmp_channel0 = pChannel0;
	__memX DSPfract* tmp_channel1 = pChannel1;

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*tmp_channel0 = *tmp_channel0 * input_gain;
		*tmp_channel1 = *tmp_channel1 * input_gain;
		tmp_channel0++;
		tmp_channel1++;
	}

	tmp_channel0 -= BLOCK_SIZE;
	tmp_channel1 -= BLOCK_SIZE;

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*pChannel3 = *tmp_channel1 * tap_gain_minus1db;
		pChannel3++;
		tmp_channel1++;
	}

	tmp_channel1 -= BLOCK_SIZE;

	if (mode == 1)
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*pChannel0 = *tmp_channel0 * tap_gain_minus6db;
			*pChannel2 = *tmp_channel0 * tap_gain_3db;
			*pChannel2 = *pChannel2 << 1;
			pChannel0++;
			pChannel2++;
			tmp_channel0++;
		}
	}
	else
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*pChannel0 = *tmp_channel0 * tap_gain_minus16db;
			*pChannel2 = *tmp_channel0 * tap_gain_5db;
			*pChannel2 = *pChannel2 << 2;
			pChannel0++;
			pChannel2++;
			tmp_channel0++;
		}
	}

	tmp_channel0 -= BLOCK_SIZE;

	gst_audio_dynamic_transform_expander_double(&expander, tmp_channel0);
	gst_audio_dynamic_transform_expander_double(&expander, tmp_channel1);

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*pChannel1 = *tmp_channel0;
		*pChannel4 = *tmp_channel1;
		pChannel1++;
		pChannel4++;
		tmp_channel0++;
		tmp_channel1++;
	}
}

int main(DSPint argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;

	char WavInputName[256];
	char WavOutputName[256];

    int nChannels;
    int nChannels_out;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
	// Init channel buffers
	//for(i=0; i<MAX_NUM_CHANNEL; i++)
		//memset(&sampleBuffer[i],0,BLOCK_SIZE);

	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	 if(wav_in == NULL)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	nChannels = cl_wavread_getnchannels(wav_in);
	nChannels_out = NUM_OF_CHANNELS;
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------

	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName,argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nChannels_out, sampleRate);
	if(!wav_out)
    {
       printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	audio_expander_init(&expander, ratio, treshold);

	// Processing loop
	//-------------------------------------------------	
    {
		int i;
		int j;
		int k;
		int sample;

		// exact file length should be handled correctly...
		for(i=0; i<iNumSamples /BLOCK_SIZE; i++)
		{
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}

			if(enable_processing)
				processing();

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels_out; k++)
				{
					sample = bitsr(sampleBuffer[k][j]);

					if ((mode_o == mode1 )&& (k != 0 && k != 3 )) {
						sample = 0;
					}
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}
		}
	}

	// Close files
	//-------------------------------------------------	
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------	

    return 0;
 }
