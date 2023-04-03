#include "map.h"

int C[6] = 		{16, 33, 65, 131, 262, 523};
int Csharp[6] = {17, 35, 69, 139, 277, 554};
int D[6] = 		{18, 37, 73, 147, 294, 587};
int Dsharp[6] = {19, 39, 78, 156, 311, 622};
int E[6] = 		{20, 41, 82, 165, 330, 660};
int F[6] = 		{22, 44, 87, 175, 349, 698};
int Fsharp[6] = {23, 46, 93, 185, 370, 740};
int G[6] = 		{25, 49, 98, 196, 392, 784};
int Gsharp[6] = {26, 52, 104, 208, 415, 831};
int A[6] = 		{27, 55, 110, 220, 440, 880};
int Asharp[6] = {29, 58, 116, 233, 466, 932};
int B[6] = 		{30, 61, 123, 247, 494, 988};


int C_start[6] = {0};
int Csharp_start[6] = {0};
int D_start[6] = {0};
int Dsharp_start[6] = {0};
int E_start[6] = {0};
int F_start[6] = {0};
int Fsharp_start[6] = {0};
int G_start[6] = {0};
int Gsharp_start[6] = {0};
int A_start[6] = {0};
int Asharp_start[6] = {0};
int B_start[6] = {0};
int B_end[6] = {0};
void init_map() {
	for (int i = 1; i < 5; i++ ) {
		C_start[i] = (B[i-1]+C[i])/2;
		Csharp_start[i] = (C[i]+Csharp[i])/2;
		D_start[i] = (Csharp[i]+D[i])/2;
		Dsharp_start[i] = (D[i]+Dsharp[i])/2;
		E_start[i] = (Dsharp[i]+E[i])/2;
		F_start[i] = (E[i]+F[i])/2;
		Fsharp_start[i] = (F[i]+Fsharp[i])/2;
		G_start[i] = (Fsharp[i]+G[i])/2;
		Gsharp_start[i] = (G[i]+Gsharp[i])/2;
		A_start[i] = (Gsharp[i]+A[i])/2;
		Asharp_start[i] = (A[i]+Asharp[i])/2;
		B_start[i] = (Asharp[i]+B[i])/2;
		B_end[i] = (B[i]+C[i+1])/2;
	}
}


char map(int freq) {
	char note;

	for (int i = 1; i < 5; i++ ) {
		if (freq >= C_start[i] && freq < Csharp_start[i]) {
			note = 'c';
		} else if (freq >= Csharp_start[i] && freq < D_start[i]) {
			note = 'l';
		} else if (freq >= D_start[i] && freq < Dsharp_start[i]) {
			note = 'd';
		} else if (freq >= Dsharp_start[i] && freq < E_start[i]) {
			note = 'm';
		} else if (freq >= E_start[i] && freq < F_start[i]) {
			if(freq > 165) {
				note = 'E';
			} else {
				note = 'e';
			}
		} else if (freq >= F_start[i] && freq < Fsharp_start[i]) {
			note = 'f';
		} else if (freq >= Fsharp_start[i] && freq < G_start[i]) {
			note = 'n';
		} else if (freq >= G_start[i] && freq < Gsharp_start[i]) {
			note = 'g';
		} else if (freq >= Gsharp_start[i] && freq < A_start[i]) {
			note = 'o';
		} else if (freq >= A_start[i] && freq < Asharp_start[i]) {
			note = 'a';
		} else if (freq >= Asharp_start[i] && freq < B_start[i]) {
			note = 'p';
		} else if (freq >= B_start[i] && freq < B_end[i]) {
			note = 'b';
		} else {
			// do nothing
		}
	}

	return note;
}


int pos_map(int freq){
	int location = 0;

	if (freq == 80) {
		location = -2;
	} else if (freq == 81) {
		location = -1;
	} else if (freq == 82) {
		location = 0;
	} else if (freq == 83) {
		location = 1;
	} else if (freq == 84) {
		location = 2;
	} else if (freq == 85) {
		location = -2;
	} else if (freq == 86) {
		location = -1;
	} else if (freq == 87) {
		location = 0;
	} else if (freq == 88) {
		location = 1;
	} else if (freq == 88) {
		location = 2;
	}
	else {
		// do nothing
	}

	return location;
}
