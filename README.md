# PMU V1: Bitstream Loader with JTAG interface

## Introduction
The Programmign Management Unit will serve as a macro that can be placed near a FPGA to handle bitstream loading. While the primary functonalty of the PMU is to load a bitstream into an FPGA Core it will also incoroporate some hardware security and integrity features. This is in reponse to the need for OpenFPGA to be able to incoporate some hardware security IPs to FPGA designs. To accurately access the level of protetection the secuiry features provide to the FPGA/FPGA bitstream, an iterative apprach to the PMU design will be taken starting with version one. The iterative approach is currently defined by a threat model shown in Figure 1. As of today the primary objectives of the PMU is to accurately transfer bitstream data to the core and protect the IP that lies within a bitstream using AES. The final version of the PMU will resembel a RISC-V core that incorporates all the features of the previous PMU versions as well as post fabrication feature implementation and programming of multiple FPGA configuration chains. 

<p>
  <img src="/docs/figures/ThreatModel.png">
</p>

## Programming Management Unit: PMU
### Version 1
  PMU V1 consists of a JTAG Tap Controller, PMU FSM, and a CRC8 module. Version 1 incorporates no security features and will act as a baseline to compare other versions of the PMU. This is in order to accuratly evaluate the countermeasures with respect to expected security risks according to the PMU threat model as described in the introduction. A hierarchial overview is shown in Figure 2 and FIgure 3 contains a detailed block diagram of PMU version 1 architecture.
  
 <p align="center">
  <img src="/docs/figures/Hierarchy_overview.png">
</p>

#### Encoding Scheme
PMU V1 is capable of intrepreting two encoding schemes: one with CRC data integrity check and one without. To be compliant with JTAg communicaton protocol the bitstream encoding requires two signals: tdi and tms. Tdi contains the bitstream data and JTAG instructions. The tms signal controls the tap controller fsm and consists of a tms header to initialze tap controller adn footer to reset tap contoller. It is filled with zeros between the header and footer to work simutaneouly with tdi signa. 

The encoding scheme that contains CRC information contains a JTAG header and footer, a header that contains information about the number of 64-bit packets and the number of bits %64 (modulo remainder) depending on the size of the Bitstream. For example in the testbench provided there are 2250 bits of bitstream. Therefore there are 35 packets of data + 1 packet of header + 10 bits of %64 remainder (when CRC is enabled the 10 remaing bits are padded to make a 64-bit data packet with 8-bit CRC Key). Therefore in total there are 37 packets and %64 remainder of 10. Each "packet" contains 64 bits of bitstream data and 8-bits or CRC key. The high level overview of the encoding scheme is shown in Figure 4. 

 <p align="center">
  <img src="/docs/figures/encode.png">
</p>



#### Blocks
##### JTAG TAP Controller
##### PMU FSM
##### CRC8
#### Testing

## Installation
## Dependencies
## Acknoledgements
- [JTAG](https://github.com/freecores/jtag): JTAG implementation from OpenCores
