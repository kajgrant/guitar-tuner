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
#include "map.h"

#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR

#define FLAT_MODE	50
#define SHARP_MODE	51

//int NUM_BYTES_BUFFER = 5242880;
int NUM_BYTES_BAR = 258048;
int NUM_BYTES_MODE = 352256;
int NUM_BYTES_NOTE = 1853440;
int NUM_BYTES_CIRCLE = 160000;
int NUM_BYTES_BUFFER = 5242880;

#define DDR_BASE_ADDR (XPAR_PS7_DDR_0_S_AXI_BASEADDR + 0x700000)
#define BUTTON_LEFT (DDR_BASE_ADDR + 0x4)
#define BUTTON_RIGHT (DDR_BASE_ADDR + 0x8)
#define PS_INTERRUPT_CONTROLLER (DDR_BASE_ADDR + 0x48)
#define BUFFER_BASE (DDR_BASE_ADDR + 0x00100000)
#define DEVICE_ID_PS_PUSHBUTTONS XPAR_XGPIOPS_0_DEVICE_ID

#define SHARED_ADDRESS 0x0F000000

u32 *leftButtonEnabled = (u32 *)BUTTON_LEFT;
u32 *rightButtonEnabled = (u32 *)BUTTON_RIGHT;
XGpioPs sharp_Gpio;
XGpioPs flat_Gpio;
XScuGic *interruptController = (XScuGic *)PS_INTERRUPT_CONTROLLER;
XGpioPs_Config *gpioPSPushButtonsConfig;
XScuGic_Config *interruptControllerConfig;

int * start_buffer_pointer = (int *)0x00900000;
int * middle_buffer_pointer = (int *) 0x0097D000; //0x009FA000;
int * bottom_buffer_pointer = (int *)0x00D06000;

int * shared_pointer = (int *)SHARED_ADDRESS;

//int * a_pointer = (int *)0x128D2008; // A
//int * b_pointer = (int *)0x130BB00C; // B
//int * c_pointer = (int *)0x138A4010; // C
//int * d_pointer = (int *)0x1408D014; // D
//int * e_pointer = (int *)0x14876018; // E
//int * f_pointer = (int *)0x1505F01C; // F
//int * g_pointer = (int *)0x15848020; // G
//
//int * flat_pointer = (int *)0x16031024;
//int * sharp_pointer = (int *)0x1681A028;
//
//int * _pointer = (int *)0x1700302C;
//int * circle_pointer = (int *)0x177EC030;
//int * flat_sym_ptr = (int *) 0x187BE038;
//int * sharp_sym_ptr = (int *) 0x18FA703C;
extern int a[];
extern int b[];
extern int c[];
extern int d[];
extern int e1[];
extern int e2[];
extern int f[];
extern int g[];

extern int default_note[];

extern int sharp_mode_img[];
extern int flat_mode_img[];

extern int sharp_sym[];
extern int flat_sym[];

extern int tuned_bar[];

extern int unmute[];
extern int mute[];

extern int l1[];
extern int l2[];
extern int l3[];
extern int r1[];
extern int r2[];
extern int r3[];

int * temp_ptr = (int *)0x17FD5034;


//1D
int sharp = 0;

// VGA
void write_pixel(int x, int y, int colour) {
	int *vga_addr= start_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}


void clear_screen() {
  int x, y;
  for (y = 0; y < 1024; y++) {
	for (x = 0; x < 1280; x++) {
	  write_pixel(x,y,0);
	}
  }
}


void write_bar(int x, int y, int colour) {
	int *vga_addr= start_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}

void draw_bar(int pos) {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 100; y++) {
		for (x = 320; x < 960; x++) {
			if (pos == -3) {
				write_bar(x,y,l3[k]);
			} else if (pos == -2) {
				write_bar(x,y,l2[k]);
			} else if (pos == -1) {
				write_bar(x,y,l1[k]);
			} else if (pos == 1) {
				write_bar(x,y,r1[k]);
			} else if (pos == 2) {
				write_bar(x,y,r2[k]);
			} else if (pos == 3) {
				write_bar(x,y,r3[k]);
			} else {
				write_bar(x,y,tuned_bar[k]);
			}
			k++;
		}
	}
}

void write_sharp(int x, int y, int colour) {
	int *vga_addr= middle_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}

void draw_sharp(int sharp) {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 200; y++) {
		for (x = 960; x < 1160; x++) {
			if(sharp == 1) {
				write_sharp(x,y,sharp_sym[k]);
			} else {
				write_sharp(x,y,flat_sym[k]);
			}
			k++;
		}
	}
}

void clear_sharp() {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 200; y++) {
		for (x = 960; x < 1160; x++) {
			write_sharp(x,y,0);
			k++;
		}
	}
}

void write_sharp_mode(int x, int y, int colour) {
	int *vga_addr= bottom_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}

void draw_sharp_mode(int sharp) {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 200; y++) {
		for (x = 320; x < 760; x++) {
			if(sharp == 1) {
				write_sharp_mode(x,y,sharp_mode_img[k]);
			} else {
				write_sharp_mode(x,y,flat_mode_img[k]);
			}
			k++;
		}
	}
}



void write_note(int x, int y, int colour) {
	int *vga_addr= middle_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}


void draw_note() {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 724; y++) {
		for (x = 320; x < 960; x++) {
			write_note(x,y,temp_ptr[k]);
			k++;
		}
	}
}


void write_mute(int x, int y, int colour) {
	int *vga_addr= bottom_buffer_pointer;
	int offset = (y*1280) + x;
	vga_addr[offset]=colour;
}

void draw_mute(int mute_int) {
	int k = 0;
	int x = 0;
	int y = 0;
	for (y = 0; y < 200; y++) {
		for (x = 760; x < 960; x++) {
			if (mute_int == 0) {
				write_mute(x, y, unmute[k]);
			} else {
				write_mute(x, y, mute[k]);
			}
			k++;
		}
	}
}

void outputNote(u8 note, int sharp) {
	if (note == 'a'){
		memcpy(temp_ptr, a, NUM_BYTES_NOTE);
		draw_note();

	} else if(note == 'p') {
		if (sharp == 0) {
			memcpy(temp_ptr, b, NUM_BYTES_NOTE);
			draw_note();
		} else {
			memcpy(temp_ptr, a, NUM_BYTES_NOTE);
			draw_note();
		}
	} else if (note == 'b') {
		memcpy(temp_ptr, b, NUM_BYTES_NOTE);
		draw_note();
	} else if (note == 'c') {
		memcpy(temp_ptr, c, NUM_BYTES_NOTE);
		draw_note();

	} else if(note == 'l') {
		if (sharp == 0) {
			memcpy(temp_ptr, d, NUM_BYTES_NOTE);
			draw_note();
		} else {
			memcpy(temp_ptr, c, NUM_BYTES_NOTE);
			draw_note();
		}
	} else if (note == 'd') {
		memcpy(temp_ptr, d, NUM_BYTES_NOTE);
		draw_note();

	} else if(note == 'm') {
		if (sharp == 0) {
			memcpy(temp_ptr, e1, NUM_BYTES_NOTE);
			draw_note();
		} else {
			memcpy(temp_ptr, d, NUM_BYTES_NOTE);
			draw_note();
		}
	} else if (note == 'e') {
		memcpy(temp_ptr, e1, NUM_BYTES_NOTE);
		draw_note();
	} else if (note == 'E') {
		memcpy(temp_ptr, e2, NUM_BYTES_NOTE);
		draw_note();
	} else if (note == 'f') {
		memcpy(temp_ptr, f, NUM_BYTES_NOTE);
		draw_note();

	} else if(note == 'n') {
		if (sharp == 0) {
			memcpy(temp_ptr, g, NUM_BYTES_NOTE);
			draw_note();
		} else {
			memcpy(temp_ptr, f, NUM_BYTES_NOTE);
			draw_note();
		}
	} else if (note == 'g' ) {
		memcpy(temp_ptr, g, NUM_BYTES_NOTE);
		draw_note();
	} else if(note == 'o') {
		if (sharp == 0) {
			memcpy(temp_ptr, a, NUM_BYTES_NOTE);
			draw_note();
		} else {
			memcpy(temp_ptr, g, NUM_BYTES_NOTE);
			draw_note();
		}
	} else {
		return;
	}

	if (note == 'l' || note == 'm' || note == 'n' || note == 'o' || note == 'p') {
		draw_sharp(sharp);
	} else {
		clear_sharp();
	}

//	if (sharp == 0) {
//		memcpy(bottom_buffer_pointer, flat_mode_img, NUM_BYTES_MODE);
//	} else {
//		memcpy(bottom_buffer_pointer, sharp_mode_img, NUM_BYTES_MODE);
//	}

//	memcpy(start_buffer_pointer, , NUM_BYTES_);
	//move_circle();

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
	int inp = 0;
	u8 note = 000;
	int bar_pos = 0;
	//xil_printf("Enter note to display/play: \n");
  	// wait for input
	while(1){

		if(XGpioPs_ReadPin(&sharp_Gpio, SHARP_MODE)){
			sharp = 1;
			draw_sharp_mode(sharp);
			xil_printf("Sharp Mode Activated\n");
			sleep(1);
		}

		if(XGpioPs_ReadPin(&flat_Gpio, FLAT_MODE)){
			sharp = 0;
			draw_sharp_mode(sharp);
			xil_printf("Flat Mode Activated\n");
			sleep(1);
		}


		inp = *shared_pointer;
		//inp = atoi(str_inp);

		//xil_printf("Freq read: %d \n", inp);

		if(inp >= 60 && inp < 500) {
			//xil_printf("Freq read: %d \n", inp);
			note = map(inp);
			//xil_printf("Freq mapped to note: %c \n", note);
			outputNote(note, sharp);
			bar_pos = pos_map(inp);
			draw_bar(bar_pos);



			//for (x = 0; x < 1000; x=x+5) {

			*shared_pointer = 0;
		}


//			xil_printf("Enter note to display/play: \n");
//
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



 int main()
 {
	init_GPIO();

	registerInterruptHandler(interruptController);

	xil_printf("Setup for PS buttons\r\n");
	setupInterruptButtons(interruptController, FLAT_MODE, gpioButtonInterruptHandler, &sharp_Gpio, XGPIOPS_IRQ_TYPE_EDGE_BOTH, XPAR_XGPIOPS_0_INTR);
	setupInterruptButtons(interruptController, SHARP_MODE, gpioButtonInterruptHandler, &flat_Gpio, XGPIOPS_IRQ_TYPE_EDGE_RISING, XPAR_XGPIOPS_0_INTR);

	Xil_DCacheDisable();
	init_map();

	clear_screen();
	clear_screen();

	memcpy(temp_ptr, default_note, NUM_BYTES_NOTE);
	draw_note();
	draw_sharp_mode(0);
	draw_bar(0);
	draw_mute(0);


	read_UART();

	return 0;
}


