
//////////////////////////////////////////////////////////////////////////////////
//
// Company:        n/a
// Engineer:       Kaj Grant-Mathiasen
// Create Date:    1 April, 2023
// App Name:       Guitar Tuner
// File Name:      helloworld.c
// Target Devices: Zedboard
// Tool Versions:  2020.2
// Description:    Implementation of FFT guitar tuner using an FFT, DMA, HPS.
// Dependencies:
// Revision History:
// Additional Comments:
//
//
//////////////////////////////////////////////////////////////////////////////////

// Includes
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "xuartps_hw.h"
#include "xbasic_types.h"

#include "fft.h"
#include "cplx_data.h"
#include "audio.h"
#include "hps.h"

#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR
#define NUM_POINTS FFT_MAX_NUM_PTS
#define NUM_HPS_POINTS NUM_POINTS / HIGHEST_BIN
#define FREQ_SCALE_FACTOR 0.960
#define SHARED_ADDRESS 0x0F000000
#define SAMPLE_SYNC 21
#define SAMPLE_SCALE 6
#define SAMPLE_RATE SAMPLE_SYNC * SAMPLE_SCALE
#define AMPLITUDE_SCALE 2
#define FREQ_FLOOR 10

int * shared_pointer = (int *)SHARED_ADDRESS; //Global shared pointer with Video core


/* ---------------------------------------------------------------------------- *
 * 									fill_input()								*
 * ---------------------------------------------------------------------------- *
 * Fills the input buffer with samples from the audio codec
 * ---------------------------------------------------------------------------- */
void fill_input(cplx_data_t *stim_buf){

	u32 in_left, in_right;
	int16_t left_16, right_16;

	for (int i = 0; i < NUM_POINTS; i++){
		in_left = Xil_In32(I2S_DATA_RX_L_REG);
		in_right = Xil_In32(I2S_DATA_RX_R_REG);

		in_left = in_left >> 8;
		in_right = in_right >> 8;

		left_16 = in_left;
		right_16 = in_right;

		stim_buf[i].data_re = (left_16 + right_16) * AMPLITUDE_SCALE;
		stim_buf[i].data_im = 0;
		usleep(SAMPLE_RATE);
	}

}

/* ---------------------------------------------------------------------------- *
 * 									init_uart()								    *
 * ---------------------------------------------------------------------------- *
 * Initializes the uart
 * ---------------------------------------------------------------------------- */
void init_uart()
{
	u32 CntrlRegister;
	CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
					 ((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
					  XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
}

// Main entry point
int main()
{

	// Local variables
	int status = 0;
	fft_t *p_fft_inst;
	cplx_data_t *stim_buf;
	cplx_data_t *result_buf;
	XIicPs *Iic;
	short *convert_buf;
	long *final_out_buf;
	int *input_data;

	// Create FFT object
	p_fft_inst = fft_create(
		XPAR_GPIO_1_DEVICE_ID,
		XPAR_AXIDMA_0_DEVICE_ID,
		XPAR_PS7_SCUGIC_0_DEVICE_ID,
		XPAR_FABRIC_CTRL_AXI_DMA_0_S2MM_INTROUT_INTR,
		XPAR_FABRIC_CTRL_AXI_DMA_0_MM2S_INTROUT_INTR);
	if (p_fft_inst == NULL)
	{
		xil_printf("ERROR! Failed to create FFT instance.\n\r");
		return -1;
	}

	fft_set_num_pts(p_fft_inst, NUM_POINTS);

	// Allocate data buffers
	stim_buf = (cplx_data_t *)malloc(sizeof(cplx_data_t) * FFT_MAX_NUM_PTS);
	if (stim_buf == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the stimulus buffer.\n\r");
		return -1;
	}

	result_buf = (cplx_data_t *)malloc(sizeof(cplx_data_t) * FFT_MAX_NUM_PTS);
	if (result_buf == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the result buffer.\n\r");
		return -1;
	}

	convert_buf = (short *)malloc(sizeof(short) * FFT_MAX_NUM_PTS);
	if (convert_buf == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the convert buffer.\n\r");
		return -1;
	}

	input_data = (int *)malloc(sizeof(int) * FFT_MAX_NUM_PTS);
	if (input_data == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the input buffer.\n\r");
		return -1;
	}

	final_out_buf = (long *)malloc(sizeof(long) * FFT_MAX_NUM_PTS);
	if (final_out_buf == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the final output buffer.\n\r");
		return -1;
	}

	Iic = (XIicPs *)malloc(sizeof(XIicPs));
	if (Iic == NULL)
	{
		xil_printf("ERROR! Failed to allocate memory for the Iic.\n\r");
		return -1;
	}

	//Configure the Iic
	IicConfig(XPAR_XIICPS_0_DEVICE_ID, Iic);

	//Configure the Audio Codec's PLL
	AudioPllConfig(Iic);

	//Configure the Line in and Line out ports.
	AudioConfigureJacks(Iic);

	//audio_stream();

	//Main tuning loop
	while (1){

		fill_input(stim_buf); //Fill the input buffer with some data

		//Perform the FFT
		status = fft(p_fft_inst, (cplx_data_t *)stim_buf, (cplx_data_t *)result_buf);
		if (status != FFT_SUCCESS)
		{
			xil_printf("ERROR! FFT failed.\n\r");
			return -1;
		}

		//Convert the fft output from real + complex to magnitude
		fft_convert_normalized(p_fft_inst, convert_buf);

		//Apply the HPS algorithm to the output of the FFT
		hps(convert_buf, final_out_buf, NUM_HPS_POINTS);

		//Detect the fundamental frequency
		int fund_freq = detect_fundamental_freq(final_out_buf, NUM_HPS_POINTS);
		float fl_fund_freq = fund_freq * FREQ_SCALE_FACTOR;

		//Output the fundamental frequency if an appropriate one has been detected
		if (fl_fund_freq > FREQ_FLOOR){
			*shared_pointer = fl_fund_freq;
			printf("FUNDAMENTAL FREQUENCY = %f Hz\r\n", fl_fund_freq);
		}
	}

	free(stim_buf);
	free(result_buf);
	free(convert_buf);
	free(input_data);
	free(final_out_buf);
	free(Iic);
	fft_destroy(p_fft_inst);

	return 0;
}
