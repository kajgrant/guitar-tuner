
// Includes
#include <stdio.h>
#include "cplx_data.h"
#include <math.h>
#include "fft.h"

// Public functions
void cplx_data_get_string(char *c, cplx_data_t data)
{
	sprintf(c, "%d + j*%d", data.data_re, data.data_im);
}

void cplx_data_get_normalized_string(char *c, cplx_data_t data)
{
	short re_part = data.data_re;
	short im_part = data.data_im;
	int norm = SCALE_FACTOR * sqrt((re_part  * re_part ) + (im_part * im_part));
	sprintf(c, "%d", norm);
}
