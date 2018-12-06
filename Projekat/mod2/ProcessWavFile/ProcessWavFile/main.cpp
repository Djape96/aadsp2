#include <stdlib.h>
#include <string.h>
#include <cmath>
#include "WAVheader.h"
#include "expander.h"
#include "common.h"
#include "stdfix_emu.h"
#include "fixed_point_math.h"

DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

output_mode mode_o;
AudioExpander_t expander;
DSPfract input_gain = FRACT_NUM(0.25);;
const DSPfract tap_gain_minus6db = FRACT_NUM(0.25);
const DSPfract tap_gain_5db = FRACT_NUM(0.79);
const DSPfract tap_gain_minus16db = FRACT_NUM(0.025);
const DSPfract tap_gain_3db = FRACT_NUM(0.995);
const DSPfract tap_gain_minus1db = FRACT_NUM(-1.00);
DSPint enable_processing;
DSPint mode;

void processing()
{
	DSPint i;
	DSPfract* pChannel0 = sampleBuffer[0];
	DSPfract* pChannel1 = sampleBuffer[1];
	DSPfract* pChannel2 = sampleBuffer[2];
	DSPfract* pChannel3 = sampleBuffer[3];
	DSPfract* pChannel4 = sampleBuffer[4];

	DSPfract* tmp_channel0 = pChannel0;
	DSPfract* tmp_channel1 = pChannel1;

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*tmp_channel0 = *tmp_channel0 * input_gain;
		*tmp_channel1 = *tmp_channel1 * input_gain;
		tmp_channel0++;
		tmp_channel1++;
	}

	tmp_channel0 -= BLOCK_SIZE;
	tmp_channel1 -= BLOCK_SIZE;

	for (i = 0; i < BLOCK_SIZE; i++) {
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
			*pChannel2 = *(pChannel2) << 1;
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

DSPint main(DSPint argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;
	double ratio = 1;
	DSPfract treshold = FRACT_NUM(0.0);
	
	double input_gain_tmp;
	
	if (argc == 7)
	{
		enable_processing = atoi(argv[3]);
		input_gain_tmp = atof(argv[4]);
		mode = atoi(argv[5]);
		mode_o = (output_mode)atoi(argv[6]);
		input_gain = pow(10, (input_gain_tmp / 10));
	}


	// Init channel buffers
	for (DSPint i = 0; i<MAX_NUM_CHANNEL; i++)
		for (DSPint j = 0; j<BLOCK_SIZE; j++)
			sampleBuffer[i][j] = FRACT_NUM(0.0);

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

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);

	//Init audio expander
	audio_expander_init(&expander,FRACT_NUM(ratio),treshold);


	// Processing loop
	//-------------------------------------------------	
	{
		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (DSPint i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (DSPint j = 0; j<BLOCK_SIZE; j++)
			{
				for (DSPint k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = DSPfract(sample / SAMPLE_SCALE);				// scale sample to 1.0/-1.0 range		
				}
			}
			if (enable_processing)
				processing();

			for (DSPint j = 0; j<BLOCK_SIZE; j++)
			{
				for (DSPint k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = sampleBuffer[k][j].toLong();	// crude, non-rounding 			
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