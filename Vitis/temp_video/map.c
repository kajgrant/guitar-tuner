#include "map.h"

char map(int freq) {
	char note;
	int C4_start = (B3+C4)/2;
	int Csharp_4_start = (C4+Csharp_4)/2;
	int D4_start = (Csharp_4+D4)/2;
	int Dsharp_4_start = (D4+Dsharp_4)/2;
	int E4_start = (Dsharp_4+E4)/2;
	int F4_start = (E4+F4)/2;
	int Fsharp_4_start = (F4+Fsharp_4)/2;
	int G4_start = (Fsharp_4+G4)/2;
	int Gsharp_4_start = (G4+Gsharp_4)/2;
	int A4_start = (Gsharp_4+A4)/2;
	int Asharp_4_start = (A4+Asharp_4)/2;
	int B4_start = (Asharp_4+B4)/2;
	int B4_end = (B4+C5)/2;

	if (freq >= C4_start && freq < Csharp_4_start) {
		note = 'c';
	} else if (freq >= Csharp_4_start && freq < D4_start) {
		note = 'l';
	} else if (freq >= D4_start && freq < Dsharp_4_start) {
		note = 'd';
	} else if (freq >= Dsharp_4_start && freq < E4_start) {
		note = 'm';
	} else if (freq >= E4_start && freq < F4_start) {
		note = 'e';
	} else if (freq >= F4_start && freq < Fsharp_4_start) {
		note = 'f';
	} else if (freq >= Fsharp_4_start && freq < G4_start) {
		note = 'n';
	} else if (freq >= G4_start && freq < Gsharp_4_start) {
		note = 'g';
	} else if (freq >= Gsharp_4_start && freq < A4_start) {
		note = 'o';
	} else if (freq >= A4_start && freq < Asharp_4_start) {
		note = 'a';
	} else if (freq >= Asharp_4_start && freq < B4_start) {
		note = 'p';
	} else if (freq >= B4_start && freq < B4_end) {
		note = 'b';
	} else {
		// do nothing
	}

	return note;
}
