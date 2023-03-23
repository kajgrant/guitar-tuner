//////////////////////////////////////////////////////////////////////////////////
//
// Company:        n/a
// Engineer:       Kaj Grant-Mathiasen
// Create Date:    11 March 2023
// Library Name:   Harmonic Product Spectrum
// File Name:      hps.h
// Target Devices: Zedboard
// Tool Versions:  2020.2
// Description:    Implementation of HPS.
// Dependencies:
//   - cplx_data.h - Driver version v1.0
//   - dma_accel.h - Driver version v1.0
//   - gpio.h      - Driver version v4.0
// Revision History:
//
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

#ifndef HPS_H_
#define HPS_H_

void hps(short *convert_buf, long *final_out_buf, int num_points);

void hps_data_get_string(char *c, long data);
void hps_print_final_buf(long *final_out_buf, int num_points);
int detect_fundamental_freq(long *final_out_buf, int num_pts);

#endif /* HPS_H_ */