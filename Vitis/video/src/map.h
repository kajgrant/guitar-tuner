#ifndef _MAP_H_
#define _MAP_H_

#include <stdio.h>
#include <cstdlib>

//#define B3 247
//
//#define C4 262
//#define Csharp_4 277
//#define D4 294
//#define Dsharp_4 311
//#define E4 330
//#define F4 349
//#define Fsharp_4 370
//#define G4 392
//#define Gsharp_4 415
//#define A4 440
//#define Asharp_4 466
//#define B4 494
//
//#define C5 523



void init_map();
char map(int freq);
int pos_map(int freq);

#endif /* MAP_H */
