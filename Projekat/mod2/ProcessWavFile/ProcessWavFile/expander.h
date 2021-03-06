#ifndef EXPANDER_H
#define EXPANDER_H

#include "common.h"

typedef struct __AudioExpander {
	double threshold;
	double ratio;
} AudioExpander_t;


void gst_audio_dynamic_transform_expander_double(AudioExpander_t * expander,
	DSPfract * data);

void audio_expander_init(AudioExpander_t * expander, DSPfract r, DSPfract tr);

#endif