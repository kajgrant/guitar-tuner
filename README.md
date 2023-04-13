# Hardware Accelerated Guitar Tuner

## Overview

The Hardware Accelerated Guitar Tuner is a group project created for SFU ENSC 452 - Advanced Digital System Design. This project uses the Zedboard FPGA platform.

### File Hierarchy

- **Vitis** - The main folder containing all Vitis related code
  - **audio** - Audio processing core related functionality
    - **src** - All .c and .h files relating to the audio processing core
  - **video** - Video processing core related functionality
    - **src** - All .c and .h files relating to the video processing core
      - **assets** - raw .data files used for displaying visuals to GUI
  - **final_tuner** - The main vitis project folder
  - **design_1_wrapper** - The platform folder
- **Vivado** - The main folder containing all Vivado related functionality
  - **audio_fft** - The main Vivado project folder
  - **ip_repo** - The ip repository folder
    - **custom_hps_1.0** - HDL and IP project for the custom HPS block
    - **vga_controller_ip** -Tutorial provided VGA controller IP
    - **xilinx.com_ip_edge_detect_1.0** - Xilinx provided Edge Detect IP
    - **zed_audio_ctrl** - Tutorial provided audio controller IP
  - **sources** - Audio Tutorial provided drivers and resources
- **testing_scripts** - All testing and matlab related resources
  - **ModelSim** - ModelSim project used for verifying custom HPS block
  - **sampleNotes** - Repository of sample recordings used for testing
- **assets** - Visual assets used in the final demo version

### IP Cores Used

- AXI-Stream FFT (8192 point)
- AXI DMA
- AXI GPIO
- Zedboard Audio Controller
- AXI-Stream VGA Core
- HPS Algorithm Core (custom)

### Features

- Mic or Line-In input
- Continuous detection with resolution < 1 Hz
- Ability to switch between sharp and flat modes
- Frequency analysis support from 50 Hz to 500 Hz

### Requirements

- Zedboard
- Vivado 2020.2
- Vitis 2020.2
