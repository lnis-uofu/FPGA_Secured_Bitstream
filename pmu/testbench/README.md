# Testing
## Functional

- JTAG TAP CONTROLLER

    [testbench](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/testbench/functional_tap_top.v)

    This test bench demoonstrates using the tap controller to load the two addtional instructions for PMU; pmu_w_cs and pmu_wo_cs.
  
 - CRC8

   [testbench](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/testbench/functional_crc8.v)
   Demonstrates loading a random 16-bit value into the 8 bit LFSR and then 8 '0' bits after that. The value of the registers in the LFSR is now the 8-bit CRC key. This key is then append to the same randon 16-bit value as before and fed again into the LFSR. After the 16-bits of data and CRC-key have been shifted through the LFSR the value in the LFSR registers should be zero domonstrating equivalent data from transmitter to reciever.

- PMU

  [testbench](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/testbench/functional_pmu.v)
 
    Demonstrates two functions of the PMU. The first is loading a bitstream with CRC-8 on and detecting an error. The second is loading a bitstream without     CRC. Both functions load a header before loading data and this does not include encoding for JTAG interface. 

- PMU_TOP
  [testbench](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/testbench/functional_pmu_top.v)
  
    The purpose of this testbench is to demonstrate the overall operation including JTAG communication interface with a tap controller a mock FPGA core with "configuration chain" bitstream loading protocol. It performs three tests the first is loading a "passing" bitstream (passing meaning free of errors) and compaing to see if the value in the FPGA core is the intened value of the bistream. The next test is same however there is a purposly injected error in the bitstream. The test shows the an error has been detected and then displays the value in the core which is zero. When an error is detected by CRC the value core is reset bu PMU. Finally, Loading a bitstream without th euse of CRC is demonstrate in the third test. 
