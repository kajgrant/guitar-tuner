//////////////////////////////////////////////////////////////////////////////////
//
// Company:        n/a
// Engineer:       Kaj Grant-Mathiasen
// Create Date:    11 March 2023
// Library Name:   Harmonic Product Spectrum
// File Name:      hps.c
// Target Devices: Zedboard
// Tool Versions:  2020.2
// Description:    Implementation of HPS.
// Dependencies:
// Revision History:
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

// Includes
#include <stdio.h>
#include <stdlib.h>
#include "xuartps_hw.h"
#include "hps.h"
#include <math.h>
#include "xbasic_types.h"
#include "xparameters.h"

/* ---------------------------------------------------------------------------- *
 * 									hps()									    *
 * ---------------------------------------------------------------------------- *
 * Performs the hps algorithm on the input converted values buffer by adding
 * the values to the hps block axi base address and reading the calculated
 * final result back. Uses 1st, 2nd, 3rd, 5th bin downsamples.
 * ---------------------------------------------------------------------------- */
void hps(short *convert_buf, long *final_out_buf, int num_points)
{
    Xuint32 *baseaddr_p = (Xuint32 *)XPAR_CUSTOM_HPS_1_S00_AXI_BASEADDR;
    unsigned long onetwo;
    unsigned long thirdfifth;
    unsigned long convertedVal;

    for (int i = 0; i < num_points; i++)
    {
    	onetwo = convert_buf[i * IN2] << 16 | convert_buf[i * IN1];
    	thirdfifth = convert_buf[i * IN4] << 16 | convert_buf[i * IN3];

        *(baseaddr_p + 0) = onetwo;
        *(baseaddr_p + 1) = thirdfifth;

        //Lower 32 bits of the calculated value
        //Likely not needed as fundamental frequency will be several orders of magnitude higher
        //convertedVal = *(baseaddr_p + 2);

        //Upper 32 bits of the calculated value
        convertedVal = *(baseaddr_p + 3);

        final_out_buf[i] = convertedVal;
    }
}

/* ---------------------------------------------------------------------------- *
 * 									hps_data_get_string()									    *
 * ---------------------------------------------------------------------------- *
 * Converts the given data to a printable character array
 * ---------------------------------------------------------------------------- */
void hps_data_get_string(char *c, long data)
{
    sprintf(c, "%ld", data);
}

/* ---------------------------------------------------------------------------- *
 * 									hps_print_final_buf()						*
 * ---------------------------------------------------------------------------- *
 * Prints the entire hps output buffer to uart
 * ---------------------------------------------------------------------------- */
void hps_print_final_buf(long *final_out_buf, int num_points)
{

    // Local variables
    char str[25]; // Large enough to hold 2 ints plus extra characters

    for (int i = 0; i < num_points; i++)
    {
        hps_data_get_string(str, final_out_buf[i]);
        xil_printf("HPSk(%d) = %s\n\r", i, str);
    }
}

/* ---------------------------------------------------------------------------- *
 * 									detect_fundamental_freq()					*
 * ---------------------------------------------------------------------------- *
 * Detects fundamental frequency by searching the buffer for the maximum value
 * ---------------------------------------------------------------------------- */
int detect_fundamental_freq(long *final_out_buf, int num_pts)
{

    int largestIndex = 0;

    for (int i = 0; i < num_pts; i++)
    {
        if (final_out_buf[i] > final_out_buf[largestIndex])
        {
            largestIndex = i;
        }
    }

    return largestIndex;
}
