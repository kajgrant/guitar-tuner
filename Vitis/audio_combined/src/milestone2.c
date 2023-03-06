//Empty C++ Application
#include <stdio.h>
#include "xparameters.h"
#include <cstdlib>

#include "xgpiops.h"
#include "xuartps_hw.h"

#include <xil_io.h>
#include <sleep.h>
#include <xil_printf.h>
#include <xparameters.h>
#include "xuartps.h"
#include "stdlib.h"
#include "xscugic.h"
#include "xscutimer.h"
#include "xil_cache.h"

#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR

#define FLAT_MODE	50
#define SHARP_MODE	51



//int NUM_BYTES_BUFFER = 5242880;
int NUM_BYTES_LINE = 1024000;
int NUM_BYTES_MODE = 1146880;
int NUM_BYTES_NOTE = 4096000;


#define DDR_BASE_ADDR (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x700000)
#define BUTTON_LEFT (DDR_BASE_ADDR + 0x4)
#define BUTTON_RIGHT (DDR_BASE_ADDR + 0x8)
#define PS_INTERRUPT_CONTROLLER (DDR_BASE_ADDR + 0x48)
#define BUFFER_BASE (DDR_BASE_ADDR + 0x00100000)
#define DEVICE_ID_PS_PUSHBUTTONS XPAR_XGPIOPS_0_DEVICE_ID

u32 *leftButtonEnabled = (u32 *)BUTTON_LEFT;
u32 *rightButtonEnabled = (u32 *)BUTTON_RIGHT;
XGpioPs sharp_Gpio;
XGpioPs flat_Gpio;
XScuGic *interruptController = (XScuGic *)PS_INTERRUPT_CONTROLLER;
XGpioPs_Config *gpioPSPushButtonsConfig;
XScuGic_Config *interruptControllerConfig;

int * start_buffer_pointer = (int *)0x00900000;
int * middle_buffer_pointer = (int *)0x009FA000;
int * bottom_buffer_pointer = (int *)0x00D1C800;

int * a_pointer = (int *)0x018D2008; // A
int * b_pointer = (int *)0x020BB00C; // B
int * c_pointer = (int *)0x028A4010; // C
int * d_pointer = (int *)0x0308D014; // D
int * e_pointer = (int *)0x03876018; // E
int * f_pointer = (int *)0x0405F01C; // F
int * g_pointer = (int *)0x04848020; // G

int * flat_pointer = (int *)0x05031024;
int * sharp_pointer = (int *)0x0581A028;

int * line_pointer = (int *)0x0600302C;

void outputNote(u8 note) {
	if (note == 'a'){
    	memcpy(middle_buffer_pointer, a_pointer, NUM_BYTES_NOTE);
	} else if (note == 'b') {
		memcpy(middle_buffer_pointer, b_pointer, NUM_BYTES_NOTE);
	} else if (note == 'c') {
		memcpy(middle_buffer_pointer, c_pointer, NUM_BYTES_NOTE);
	} else if (note == 'd') {
		memcpy(middle_buffer_pointer, d_pointer, NUM_BYTES_NOTE);
	} else if (note == 'e') {
		memcpy(middle_buffer_pointer, e_pointer, NUM_BYTES_NOTE);
	} else if (note == 'f') {
		memcpy(middle_buffer_pointer, f_pointer, NUM_BYTES_NOTE);
	} else if (note == 'g') {
		memcpy(middle_buffer_pointer, g_pointer, NUM_BYTES_NOTE);
	} else {
		//do nothing
	}

}

// Interrupt
void gpioButtonInterruptHandler(void *callBack)
{
	XGpioPs *gpio = (XGpioPs *)callBack;
	u32 *leftButtonEnabled = (u32 *)BUTTON_LEFT;
	u32 *rightButtonEnabled = (u32 *)BUTTON_RIGHT;
	u32 leftBn = XGpioPs_ReadPin(&sharp_Gpio, SHARP_MODE);
	u32 rightBn = XGpioPs_ReadPin(&flat_Gpio, FLAT_MODE);

	if (leftBn == 1)
	{
		*leftButtonEnabled = 1;
	}
	if (rightBn == 1)
	{
		*rightButtonEnabled = 1;
	}
	if (leftBn == 0)
	{
		*leftButtonEnabled = 0;
	}
	if (rightBn == 0)
	{
		*rightButtonEnabled = 0;
	}


	XGpioPs_IntrClearPin(gpio, 50);
	XGpioPs_IntrClearPin(gpio, 51);
}


void setupInterruptButtons(XScuGic *interruptController, int pin, Xil_ExceptionHandler interruptHandler, XGpioPs *gpio, int triggerType, int interruptID)
{
	// This enables the interrupts to be detected in the GPIO.  The mask tells it which interrupts to enable.
	/* Set the handler for gpio interrupts. */
	XGpioPs_SetCallbackHandler(gpio, (void *)gpio, (XGpioPs_Handler)interruptHandler);

	// Set pin to be input.
	XGpioPs_SetOutputEnablePin(gpio, pin, 0x0);

	// Enable the GPIO interrupt for the pin to be on rising edge.
	XGpioPs_SetIntrTypePin(gpio, pin, triggerType);
	XGpioPs_IntrEnablePin(gpio, pin);

	// Now that the GPIO interrupt is configured, connect it to the interrupt controller, and the handler.
	XScuGic_Disable(interruptController, interruptID);

	XScuGic_SetPriorityTriggerType(interruptController, interruptID, 0xA0, 0b01);

	// Hook up the GPIO Switch interrupt to the interrupt controller.
	XScuGic_Connect(interruptController, interruptID, interruptHandler, gpio);

	// Enable the GPIO Switch interrupt
	XScuGic_Enable(interruptController, interruptID);
}

void registerInterruptHandler(XScuGic *interruptController)
{
	// Initialize the exception table
	Xil_ExceptionInit();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, interruptController);

	// Enable the IRQ
	Xil_ExceptionEnable();
}



// UART
void init_UART()
{
	u32 CntrlRegister;

	CntrlRegister = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_CR_OFFSET);

	XUartPs_WriteReg(UART_BASEADDR, XUARTPS_CR_OFFSET,
			((CntrlRegister & ~XUARTPS_CR_EN_DIS_MASK) |
			(XUARTPS_CR_TX_EN | XUARTPS_CR_RX_EN)));
}

u8 read_UART()
{
	u8 inp = 000;
	int sharp = 0;
	xil_printf("Enter note to display/play: \n");
  	// wait for input
	while(1){

		if(XGpioPs_ReadPin(&sharp_Gpio, SHARP_MODE)){
			sharp = 1;
			memcpy(bottom_buffer_pointer, sharp_pointer, NUM_BYTES_MODE);
			xil_printf("Sharp Mode Activated\n");
			xil_printf("Enter note to display/play: \n");
			sleep(1);
		}

		if(XGpioPs_ReadPin(&flat_Gpio, FLAT_MODE)){
			sharp = 0;
			memcpy(bottom_buffer_pointer, flat_pointer, NUM_BYTES_MODE);
			xil_printf("Flat Mode Activated\n");
			xil_printf("Enter note to display/play: \n");
			sleep(1);
		}
		if (XUartPs_IsReceiveData(UART_BASEADDR)){
			inp = XUartPs_ReadReg(UART_BASEADDR, XUARTPS_FIFO_OFFSET);
			xil_printf("Note entered to play: %c \n", inp);
			outputNote(inp);
			if (sharp == 0) {
				memcpy(bottom_buffer_pointer, flat_pointer, NUM_BYTES_MODE);
			} else {
				memcpy(bottom_buffer_pointer, sharp_pointer, NUM_BYTES_MODE);
			}
			memcpy(start_buffer_pointer, line_pointer, NUM_BYTES_LINE);
			xil_printf("Enter note to display/play: \n");
		}
	}

}



// GPIO

void init_GPIO()
{
	XGpioPs_Config *GPIO_Config;
	int status;

	GPIO_Config = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	status = XGpioPs_CfgInitialize(&sharp_Gpio, GPIO_Config, GPIO_Config->BaseAddr);
	status = XGpioPs_CfgInitialize(&flat_Gpio, GPIO_Config, GPIO_Config->BaseAddr);

 	interruptControllerConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	XScuGic_CfgInitialize(interruptController, interruptControllerConfig, interruptControllerConfig->CpuBaseAddress);

	XGpioPs_SetDirectionPin(&sharp_Gpio, SHARP_MODE, 1);
	XGpioPs_SetDirectionPin(&flat_Gpio, FLAT_MODE, 1);
}

// VGA
void write_pixel(int x, int y, int colour) {
	int *vga_addr=(int *)(0x00900000);
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}

void clear_screen() {
  int x, y;
  for (x = 0; x < 1280; x++) {
    for (y = 0; y < 1024; y++) {
	  write_pixel(x,y,0);
	}
  }
}



 int main()
 {
	init_GPIO();

	registerInterruptHandler(interruptController);

	xil_printf("Setup for PS buttons\r\n");
	setupInterruptButtons(interruptController, FLAT_MODE, gpioButtonInterruptHandler, &sharp_Gpio, XGPIOPS_IRQ_TYPE_EDGE_BOTH, XPAR_XGPIOPS_0_INTR);
	setupInterruptButtons(interruptController, SHARP_MODE, gpioButtonInterruptHandler, &flat_Gpio, XGPIOPS_IRQ_TYPE_EDGE_RISING, XPAR_XGPIOPS_0_INTR);

	Xil_DCacheDisable();

	clear_screen();
	clear_screen();
	memcpy(bottom_buffer_pointer, flat_pointer, NUM_BYTES_MODE);
	memcpy(start_buffer_pointer, line_pointer, NUM_BYTES_LINE);


	read_UART();

	return 0;
}
