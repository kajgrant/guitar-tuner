/*
 * audio.c
 *
 *  Contains all of the functions related to audio codec setup.
 */
#include "audio.h"

/* ---------------------------------------------------------------------------- *
 * 									IicConfig()									*
 * ---------------------------------------------------------------------------- *
 * Initialises the IIC driver by looking up the configuration in the config
 * table and then initialising it. Also sets the IIC serial clock rate.
 * ---------------------------------------------------------------------------- */
unsigned char IicConfig(unsigned int DeviceIdPS, XIicPs *Iic)
{
	XIicPs_Config *Config;
	int Status;

	/* Initialise the IIC driver so that it's ready to use */

	// Look up the configuration in the config table
	Config = XIicPs_LookupConfig(DeviceIdPS);
	if (NULL == Config)
	{
		return XST_FAILURE;
	}

	// Initialise the IIC driver configuration
	Status = XIicPs_CfgInitialize(Iic, Config, Config->BaseAddress);
	if (Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	// Set the IIC serial clock rate.
	XIicPs_SetSClk(Iic, IIC_SCLK_RATE);

	return XST_SUCCESS;
}

/* ---------------------------------------------------------------------------- *
 * 								AudioPllConfig()								*
 * ---------------------------------------------------------------------------- *
 * Configures audio codes's internal PLL. With MCLK = 10 MHz it configures the
 * PLL for a VCO frequency = 49.152 MHz, and an audio sample rate of 48 KHz.
 * ---------------------------------------------------------------------------- */
void AudioPllConfig(XIicPs *Iic)
{

	unsigned char u8TxData[8], u8RxData[6];
	int Status;

	Status = IicConfig(XPAR_XIICPS_0_DEVICE_ID, Iic);
	if (Status != XST_SUCCESS)
	{
		xil_printf("\nError initializing IIC");
	}

	// Disable Core Clock
	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0E, Iic);

	/* 	MCLK = 10 MHz
		R = 0100 = 4, N = 0x02 0x3C = 572, M = 0x02 0x71 = 625

		PLL required output = 1024x48 KHz
		(PLLout)			= 49.152 MHz

		PLLout/MCLK			= 49.152 MHz/10 MHz
							= 4.9152 MHz
							= R + (N/M)
							= 4 + (572/625) */

	// Write 6 bytes to R1 @ register address 0x4002
	u8TxData[0] = 0x40; // Register write address [15:8]
	u8TxData[1] = 0x02; // Register write address [7:0]
	u8TxData[2] = 0x02; // byte 6 - M[15:8]
	u8TxData[3] = 0x71; // byte 5 - M[7:0]
	u8TxData[4] = 0x02; // byte 4 - N[15:8]
	u8TxData[5] = 0x3C; // byte 3 - N[7:0]
	u8TxData[6] = 0x21; // byte 2 - 7 = reserved, bits 6:3 = R[3:0], 2:1 = X[1:0], 0 = PLL operation mode
	u8TxData[7] = 0x01; // byte 1 - 7:2 = reserved, 1 = PLL Lock, 0 = Core clock enable

	// Write bytes to PLL Control register R1 @ 0x4002
	XIicPs_MasterSendPolled(Iic, u8TxData, 8, (IIC_SLAVE_ADDR >> 1));
	while (XIicPs_BusIsBusy(Iic))
		;

	// Register address set: 0x4002
	u8TxData[0] = 0x40;
	u8TxData[1] = 0x02;

	// Poll PLL Lock bit
	do
	{
		XIicPs_MasterSendPolled(Iic, u8TxData, 2, (IIC_SLAVE_ADDR >> 1));
		while (XIicPs_BusIsBusy(Iic))
			;
		XIicPs_MasterRecvPolled(Iic, u8RxData, 6, (IIC_SLAVE_ADDR >> 1));
		while (XIicPs_BusIsBusy(Iic))
			;
	} while ((u8RxData[5] & 0x02) == 0); // while not locked

	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0F, Iic); // 1111
											 // bit 3:		CLKSRC = PLL Clock input
											 // bits 2:1:	INFREQ = 1024 x fs
											 // bit 0:		COREN = Core Clock enabled
}

/* ---------------------------------------------------------------------------- *
 * 								AudioWriteToReg									*
 * ---------------------------------------------------------------------------- *
 * Function to write one byte (8-bits) to one of the registers from the audio
 * controller.
 * ---------------------------------------------------------------------------- */
void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data, XIicPs *Iic)
{

	unsigned char u8TxData[3];

	u8TxData[0] = 0x40;
	u8TxData[1] = u8RegAddr;
	u8TxData[2] = u8Data;

	XIicPs_MasterSendPolled(Iic, u8TxData, 3, (IIC_SLAVE_ADDR >> 1));
	while (XIicPs_BusIsBusy(Iic))
		;
}

/* ---------------------------------------------------------------------------- *
 * 								AudioConfigureJacks()							*
 * ---------------------------------------------------------------------------- *
 * Configures audio codes's various mixers, ADC's, DAC's, and amplifiers to
 * accept stereo input from line in and push stereo output to line out.
 * ---------------------------------------------------------------------------- */
void AudioConfigureJacks(XIicPs *Iic)
{
	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01, Iic);	// enable mixer 1
	//AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x07, Iic);	// unmute Left channel of line in into mxr 1 and set gain to 6 db
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01, Iic); // enable mixer 2
	//AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x07, Iic); // unmute Right channel of line in into mxr 2 and set gain to 6 db
	AudioWriteToReg(R19_ADC_CONTROL, 0x13, Iic);					// enable ADCs

	//Mic
	AudioWriteToReg(R8_LEFT_DIFFERENTIAL_INPUT_VOLUME_CONTROL, 0xFF, Iic); //Set Input Volume
	AudioWriteToReg(R9_RIGHT_DIFFERENTIAL_INPUT_VOLUME_CONTROL, 0xFF, Iic); //Set Input Volume
	AudioWriteToReg(R10_RECORD_MICROPHONE_BIAS_CONTROL, 0x01, Iic); // Bias Control enabled and set to default.
	AudioWriteToReg(R11_ALC_CONTROL_0, 0x13, Iic); // ALC controls PGA - Here its set to stereo.
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x10, Iic); //20dB LDBOOST, Line In Disabled.
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x10, Iic);//20dB LD Boost, Line In Disabled.

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21, Iic);				// unmute Left DAC into Mxr 3; enable mxr 3
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41, Iic);				// unmute Right DAC into Mxr4; enable mxr 4
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x05, Iic);	// unmute Mxr3 into Mxr5 and set gain to 6db; enable mxr 5
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x11, Iic); // unmute Mxr4 into Mxr6 and set gain to 6db; enable mxr 6
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xFF, Iic);		// Mute Left channel of HP port (LHP)
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xFF, Iic);	// Mute Right channel of HP port (LHP)
	// AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6, Iic); //set LOUT volume (0db); unmute left channel of Line out port; set Line out port to line out mode
	// AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6, Iic); // set ROUT volume (0db); unmute right channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xFE, Iic);  // set LOUT volume (0db); unmute left channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xFE, Iic); // set ROUT volume (0db); unmute right channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03, Iic);				  // enable left and right channel playback (not sure exactly what this does...)
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03, Iic);							  // enable both DACs

	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01, Iic);	// Connect I2S serial port output (SDATA_O) to DACs
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01, Iic); // connect I2S serial port input (SDATA_I) to ADCs

	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F, Iic); // Enable clocks
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03, Iic); // Enable rest of clocks
}

/* ---------------------------------------------------------------------------- *
 * 								LineinLineoutConfig()							*
 * ---------------------------------------------------------------------------- *
 * Configures Line-In input, ADC's, DAC's, Line-Out and HP-Out.
 * ---------------------------------------------------------------------------- */
void LineinLineoutConfig(XIicPs *Iic)
{

	AudioWriteToReg(R17_CONVERTER_CONTROL_0, 0x05, Iic);	  // 48 KHz
	AudioWriteToReg(R64_SERIAL_PORT_SAMPLING_RATE, 0x05, Iic); // 48 KHz
	AudioWriteToReg(R19_ADC_CONTROL, 0x13, Iic);
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03, Iic);
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03, Iic);
	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01, Iic);
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01, Iic);
	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F, Iic);
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03, Iic);

	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01, Iic);
	//AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x05, Iic); // 0 dB gain
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01, Iic);
	//AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x05, Iic); // 0 dB gain

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21, Iic);
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41, Iic);
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x03, Iic);	// 0 dB
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x09, Iic); // 0 dB
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xE7, Iic);		// 0 dB
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xE7, Iic);		// 0 dB
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6, Iic);	// 0 dB
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6, Iic);	// 0 dB
}

void audio_stream()
{
	u32 in_left, in_right;

	while (1){
		// Read audio input from codec
		in_left = Xil_In32(I2S_DATA_RX_L_REG);
		in_right = Xil_In32(I2S_DATA_RX_R_REG);
		// Write audio output to codec
		Xil_Out32(I2S_DATA_TX_L_REG, in_left);
		Xil_Out32(I2S_DATA_TX_R_REG, in_right);
	}
} // audio_stream()
