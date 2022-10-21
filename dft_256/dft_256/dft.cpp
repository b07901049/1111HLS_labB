#include<math.h>
#include "dft.h"
#include"coefficients256.h"

void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_output[SIZE], DTYPE imag_output[SIZE])
{
	int k, n;
	int index;
	float temp[SIZE];

	for (n = 0; n < SIZE; n++){
		temp[n] = real_sample[n];
	}

	for (k = 0; k < SIZE; k++)
	{
		for (n = 0; n < SIZE; n++){
			#pragma HLS UNROLL
			index = k * n % SIZE;
			real_output[k]	+= temp[n] * cos_coefficients_table[index];
			imag_output[k] 	+= temp[n] * sin_coefficients_table[index];
		}
	}
}
