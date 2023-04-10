// Includes
#include <stdio.h>
#include <stdlib.h>
#include "xuartps_hw.h"
#include "hps.h"
#include <math.h>
#include "xbasic_types.h"
#include "xparameters.h"

void hps(short *convert_buf, long *final_out_buf, int num_points)
{
    Xuint32 *baseaddr_p = (Xuint32 *)XPAR_CUSTOM_HPS_1_S00_AXI_BASEADDR;
    unsigned long onetwo;
    unsigned long thirdfifth;
    unsigned long convertedVal;

    for (int i = 0; i < num_points / 5; i++)
    {
    	onetwo = convert_buf[i * 2] << 16 | convert_buf[i];
    	thirdfifth = convert_buf[i * 5] << 16 | convert_buf[i * 3];

        *(baseaddr_p + 0) = onetwo;
        *(baseaddr_p + 1) = thirdfifth;

        //convertedVal = *(baseaddr_p + 2);
        convertedVal = *(baseaddr_p + 3);

        final_out_buf[i] = convertedVal;
    }
}

void hps_data_get_string(char *c, long data)
{
    sprintf(c, "%d", data);
}

void hps_print_final_buf(long *final_out_buf, int num_points)
{

    // Local variables
    char str[25]; // Large enough to hold 2 ints plus extra characters

    for (int i = 0; i < num_points; i++)
    {
        hps_data_get_string(str, final_out_buf[i]);
        xil_printf("Xk(%d) = %s\n\r", i, str);
    }
}

int detect_fundamental_freq(long *final_out_buf, int num_pts)
{

    long largestIndex = 0;

    for (int i = 0; i < num_pts; i++)
    {
        if (final_out_buf[i] > final_out_buf[largestIndex])
        {
            largestIndex = i;
        }
    }

    return largestIndex;
}
