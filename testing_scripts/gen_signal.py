import math
import numpy as np

# script to generate test data for FFT
# must take form: int test_data[FFT_MAX_NUM_PTS] =
# {... };

FS = 8192
T = 1/FS
L = 2000
FUNCTION = 'sin'
LOWER = 0
UPPER = 2000

t = np.linspace(LOWER, UPPER-1, L)
for i in range(len(t)):
    t[i] = t[i]*T

print(len(t))
print(t)

# f = open("test.txt", "a")

# f.write('[')
# for i in range(len(t)):
#     f.write(str(math.sin(t[i])) + ',')
# f.write(']')
