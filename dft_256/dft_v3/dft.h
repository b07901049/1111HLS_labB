#include <ap_int.h>

struct DTYPE
{
	float data;
	ap_uint<1> last;
};

//typedef float DTYPE;
//#define SIZE 256 		/* SIZE OF DFT */
//void dft(DTYPE XX_R[SIZE], DTYPE XX_I[SIZE], DTYPE YY_R[SIZE], DTYPE YY_I[SIZE]);

#define SIZE 256
void dft(DTYPE *, DTYPE *,DTYPE *, DTYPE *);

