/*
 *
 * This element can act as a dynamic range expander. A expander changes the
 * amplitude of all samples below a specific threshold with a specific ratio
 * If soft-knee mode is selected the ratio is applied smoothly.
 *
 * parameters: ratio [0.0, 8.0)
 *             threshold [0.0, 1.0)
 */

#define BLOCK_SIZE 16

#include "expander.h"

void audio_expander_init(AudioExpander_t * expander) {
	expander->ratio = 1.0;
	expander->threshold = 0.0;
}

void gst_audio_dynamic_transform_expander_double(AudioExpander_t * expander,
		double * data) {
	double val, threshold = expander->threshold, zero;
	int i;

	/* Nothing to do for us here if threshold equals 0.0
	 * or ratio equals 1.0 */
	if (expander->threshold == 0.0 || expander->ratio == 1.0)
		return;

	/* zero crossing of our function */
	if (expander->ratio != 0.0)
		zero = threshold - threshold / expander->ratio;
	else
		zero = 0.0;

	if (zero < 0.0)
		zero = 0.0;

	for (i = 0; i < BLOCK_SIZE; i++) {
		val = *data;

		if (val < threshold && val > zero) {
			val = expander->ratio * val + threshold * (1.0 - expander->ratio);
		} else if ((val <= zero && val > 0.0) || (val >= -zero && val < 0.0)) {
			val = 0.0;
		} else if (val > -threshold && val < -zero) {
			val = expander->ratio * val - threshold * (1.0 - expander->ratio);
		}
		*data++ = val;
	}
}
