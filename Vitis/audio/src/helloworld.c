#include <stdio.h>
#include <stdlib.h>
#include "xuartps_hw.h"
#include "xaxidma.h"
#include "fft.h"
#include "xparameters.h"

//Used for UART Printing
#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR
#define DEVICE_ID_DMA_FFT XPAR_AXI_DMA_0_DEVICE_ID
#define DEVICE_ID_FFT_GPIO XPAR_AXI_GPIO_FFT_CONFIG_DEVICE_ID
#define FFT_SIZE 512

#define DDR_BASE XPAR_PS7_DDR_0_S_AXI_BASEADDR
#define BUFFER_SIZE_64B	(FFT_SIZE * 8)
#define BUFFER_BASE (DDR_BASE + 0x00100000)
#define IN_BUFFER_BASE (BUFFER_BASE + BUFFER_SIZE_64B)
#define OUT_BUFFER_BASE (IN_BUFFER_BASE + BUFFER_SIZE_64B)

XAxiDma axiDmaFft;		// DMA for the FFT.
u64 *InBufferPtr = (u64*)IN_BUFFER_BASE;
u64 *OutBufferPtr = (u64*)OUT_BUFFER_BASE;


void init_uart(){
	u32 CntrlRegister;
	CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
			((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
			XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN));
}

// Main entry point
int main()
{
	int status;

	// Setup UART and enable caches
    init_uart();
    xil_printf("Hello World!\n\r");

    for (int i = 0; i < FFT_SIZE; i++) {
    	InBufferPtr[i] = 1;
    }

	// Configure the FFT DMA.
	status = setupDma(&axiDmaFft, DEVICE_ID_DMA_FFT);

	if (status != XST_SUCCESS) {
		xil_printf("Error: FFT DMA initialization failed!\r\n");
	}

	status = XAxiDma_FftDataTransfer(DEVICE_ID_DMA_FFT, InBufferPtr, OutBufferPtr, &axiDmaFft);

	if (status != XST_SUCCESS) {
		xil_printf("XAxiDma_SimplePoll Example Failed\r\n");
	}

	xil_printf("Done!\n\r");


    return 0;
}

