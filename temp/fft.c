#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include "xparameters.h"
#include "xgpio.h" 					// GPIO drivers, PL side.
#include "xaxidma.h"
#include "xil_printf.h"
#include "fft.h"

#define FFT_SIZE 512

static XGpio gpioFftConfig;					// AXI GPIO object for the FFT configuration.
const u32 scalingSchedule2048 = 0b101010000000;

// This function initializes the FFT DMA.
int setupDma(XAxiDma* axiDma, u16 DeviceId) {
	XAxiDma_Config *CfgPtr;
	int status;

	CfgPtr = XAxiDma_LookupConfig(DeviceId);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DeviceId);
		return XST_FAILURE;
	}

	status = XAxiDma_CfgInitialize(axiDma, CfgPtr);
	if (status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", status);
		return XST_FAILURE;
	}

	if (XAxiDma_HasSg(axiDma)) {
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	// Disable interrupts, we use polling mode
	XAxiDma_IntrDisable(axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE);

	return status;
}

// This function does the following:
// - Does a data transfer to and from the FFT core via the DMA
//   to perform a forward FFT.
int XAxiDma_FftDataTransfer(u16 DeviceId, volatile u64* inputBuffer, volatile u64* outputBuffer, XAxiDma* axiDma) {
	int status;

	// flush the cache
	Xil_DCacheFlushRange((UINTPTR)inputBuffer, FFT_SIZE*8); // FFT_point size * 8 bytes since we have 64 bits.
	Xil_DCacheFlushRange((UINTPTR)outputBuffer, FFT_SIZE*8);

	/**********************Start data transfer with FFT***************************/
	status = XAxiDma_SimpleTransfer(axiDma, (UINTPTR)outputBuffer, FFT_SIZE*8, XAXIDMA_DEVICE_TO_DMA);

	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	status = XAxiDma_SimpleTransfer(axiDma, (UINTPTR)inputBuffer, FFT_SIZE*8, XAXIDMA_DMA_TO_DEVICE);

	if (status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	// loop while DMA is busy
	while ((XAxiDma_Busy(axiDma,XAXIDMA_DEVICE_TO_DMA)) || (XAxiDma_Busy(axiDma,XAXIDMA_DMA_TO_DEVICE))) {
			/* Wait */
	}

	return 0;
}
