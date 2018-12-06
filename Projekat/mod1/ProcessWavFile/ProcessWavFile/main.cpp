#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "expander.h"
#include <cmath>
#include "common.h"

double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];



AudioExpander_t expander;
double input_gain;
int mode;

int i;
const double tap_gain_minus6db = 0.25;
const double tap_gain_5db = 0.79;
const double tap_gain_minus16db = 0.025;
const double tap_gain_3db = 0.995;
const double tap_gain_minus1db = -1.00;


void processing()
{
	double* pChannel0 = sampleBuffer[0];
	double* pChannel1 = sampleBuffer[1];
	double* pChannel2 = sampleBuffer[2];
	double* pChannel3 = sampleBuffer[3];
	double* pChannel4 = sampleBuffer[4];

	double* tmp_channel0 = pChannel0;
	double* tmp_channel1 = pChannel1;

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*tmp_channel0++ = *tmp_channel0 * input_gain;
		*tmp_channel1++ = *tmp_channel1 * input_gain;
	}

	tmp_channel0 -= BLOCK_SIZE;
	tmp_channel1 -= BLOCK_SIZE;

	for (i = 0; i < BLOCK_SIZE; i++) {
		*pChannel3++ = *tmp_channel1++ * tap_gain_minus1db;
	}

	tmp_channel1 -= BLOCK_SIZE;

	if (mode == 1)
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*pChannel0 = *tmp_channel0 * tap_gain_minus6db;
			*pChannel2 = *tmp_channel0 * tap_gain_3db;
			*pChannel2 = *(pChannel2) * 2;
			pChannel0++;
			pChannel2++;
			tmp_channel0++;
		}
	}
	else 
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*pChannel0++ = *tmp_channel0 * tap_gain_minus16db;
			*pChannel2 = *tmp_channel0 * tap_gain_5db;
			*pChannel2 = *(pChannel2) * 4;
			pChannel2++;
			tmp_channel0++;

		}
	}
	tmp_channel0 -= BLOCK_SIZE;


	gst_audio_dynamic_transform_expander_double(&expander, tmp_channel0);
	gst_audio_dynamic_transform_expander_double(&expander, tmp_channel1);

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*pChannel1++ = *tmp_channel0++;
		*pChannel4++ = *tmp_channel1++;
	}
}

int main(int argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;
	int enable_processing = 1;
	output_mode mode_o = mode1;

	if (argc == 7)
	{
		enable_processing = atoi(argv[3]);
		input_gain = atoi(argv[4]);
		mode = atoi(argv[5]);
		mode_o = (output_mode)atoi(argv[6]);
		input_gain = pow(10, input_gain / 10);
	}

	// Init channel buffers
	for (int i = 0; i < MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, "wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);
	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = NUM_OF_CHANNELS; // change number of channels

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	//Init audio expander
	audio_expander_init(&expander);


	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (int i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}
			if (enable_processing)
				processing();

			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = sampleBuffer[k][j] * SAMPLE_SCALE;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);

					if ((mode_o == mode1) && (k != 0 && k != 3 )) {
						sample = 0;
					}

					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
				}
			}
		}
	}

	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}