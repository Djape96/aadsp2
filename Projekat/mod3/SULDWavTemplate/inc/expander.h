#ifndef EXPANDER_H
#define EXPANDER_H

#include "common.h"

typedef struct __AudioExpander {
	DSPfract threshold;
	DSPfract ratio;
} AudioExpander_t;

extern void audio_expander_init(__memY AudioExpander_t * expander, DSPfract r, DSPfract tr);

extern void gst_audio_dynamic_transform_expander_double(__memY AudioExpander_t * expander,
		__memX DSPfract * data);

#endif //EXPANDER_H
