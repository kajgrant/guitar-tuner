/*
 * fft.h
 *
 *  Created on: Feb. 12, 2023
 *      Author: kajgr
 */

#ifndef SRC_FFT_H_
#define SRC_FFT_H_

#include <stdio.h>
#include "xil_exception.h"
#include "xaxidma.h"

#define FFT_MAX_NUM_PTS 8192

int fftConfigForward();
int setupDma(XAxiDma* axiDma, u16 DeviceId);
int setUpFftGpio(u16 DeviceId);
int XAxiDma_FftDataTransfer(u16 DeviceId, volatile u64* inputBuffer, volatile u64* outputBuffer, XAxiDma* axiDma);

#endif /* SRC_FFT_H_ */
