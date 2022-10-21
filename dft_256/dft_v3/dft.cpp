#include<math.h>
#include "dft.h"
#include"coefficients256.h"
#include<hls_stream.h>


const int c_size = SIZE;

static void read_input(float* in, hls::stream<float>& inStream) {
mem_rd:
    for (int i = 0; i < SIZE; i++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        inStream << in[i];
    }
}


static void computation(hls::stream<float>& inStream, hls::stream<float>& outStream1, hls::stream<float>& outStream2) {
execute:
	for (int k = 0; k < SIZE; k++){
		float sum_r = 0;
		float sum_i = 0;
		for (int n = 0; n < SIZE; n++){
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
			int index = k * n % SIZE;
			sum_r	+= inStream.read() * cos_coefficients_table[index];
			sum_i 	+= inStream.read() * sin_coefficients_table[index];
		}
		outStream1 << sum_r;
		outStream2 << sum_i;
	}

}


static void write_result(float* out, hls::stream<float>& outStream) {
mem_wr:
    for (int i = 0; i < SIZE; i++) {
#pragma HLS LOOP_TRIPCOUNT min = c_size max = c_size
        out[i] = outStream.read();
    }
}


extern "C" {

void dft(float* real_sample, float* imag_sample, float* real_output, float* imag_output){
    static hls::stream<float> inStream("input_stream");
    static hls::stream<float> outStream1("output_stream1");
    static hls::stream<float> outStream2("output_stream2");

#pragma HLS STREAM variable = inStream depth = 32
#pragma HLS STREAM variable = outStream depth = 32

#pragma HLS dataflow
    read_input(real_sample, inStream);
    computation(inStream, outStream1, outStream2);
    write_result(real_output, outStream1);
    write_result(imag_output, outStream2);
	}
}
