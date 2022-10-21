#include<math.h>
#include "dft.h"
#include"coefficients1024.h"

void dft(DTYPE real_sample[SIZE], DTYPE imag_sample[SIZE], DTYPE real_output[SIZE], DTYPE imag_output[SIZE])
{
	#pragma HLS ARRAY_PARTITION dim=1 factor=64 type=block variable=real_sample
	#pragma HLS ARRAY_PARTITION dim=1 factor=64 type=block variable=imag_sample
	#pragma HLS ARRAY_PARTITION dim=1 factor=64 type=block variable=real_output
	#pragma HLS ARRAY_PARTITION dim=1 factor=64 type=block variable=imag_output

	int k, n;
	int index;
	float temp[SIZE];
	float sum_r, sum_i;
	#pragma HLS ARRAY_PARTITION dim=1 factor=64 type=block variable=temp

	for (n = 0; n < SIZE; n++){
		temp[n] = real_sample[n];
	}

//	#pragma HLS DATAFLOW
	for (k = 0; k < SIZE; k++){
//		#pragma HLS PIPELINE
		sum_r = 0;
		sum_i = 0;

		for (n = 0; n < SIZE; n++){
			#pragma HLS UNROLL

			index = k * n % SIZE;
			sum_r	+= temp[n] * cos_coefficients_table[index];
			sum_i 	+= temp[n] * sin_coefficients_table[index];
		}

		real_output[k] = sum_r;
		imag_output[k] = sum_i;
	}
}
