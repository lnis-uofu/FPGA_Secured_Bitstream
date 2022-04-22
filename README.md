# PMU V1: Bitstream Loader with JTAG interface

## Introduction
The Programmign Management Unit will serve as a macro that can be placed near a FPGA to handle bitstream loading. While the primary functonalty of the PMU is to load a bitstream into an FPGA Core it will also incoroporate some hardware security and integrity features. This is in reponse to the need for OpenFPGA to be able to incoporate some hardware security IPs to FPGA designs. To accurately access the level of protetection the secuiry features provide to the FPGA/FPGA bitstream, an iterative apprach to the PMU design will be taken starting with version one. The iterative approach is currently defined by a threat model shown in Figure 1. As of today the primary objectives of the PMU is to accurately transfer bitstream data to the core and protect the IP that lies within a bitstream using AES. The final version of the PMU will resembel a RISC-V core that incorporates all the features of the previous PMU versions as well as post fabrication feature implementation and programming of multiple FPGA configuration chains. 

<p>
  <img src="/docs/figures/ThreatModel.png">
</p>

## Programming Management Unit: PMU
### Version 1
  PMU V1 consists of a JTAG Tap Controller, PMU FSM, and a CRC8 module. Version 1 incorporates no security features and will act as a baseline to compare other versions of the PMU. This is in order to accuratly evaluate the countermeasures with respect to expected security risks according to the PMU threat model as described in the introduction. A hierarchial overview is shown in Figure 2 and mored detailed diagrams of each block are presented later in the README.
  
 <p align="center">
  <img src="/docs/figures/hierarchy_overview.png">
</p>

### Encoding Scheme
PMU V1 is capable of intrepreting two encoding schemes: one with CRC data integrity check and one without. To be compliant with JTAG communicaton protocol the bitstream encoding requires two signals: tdi and tms. Tdi contains the bitstream data and JTAG instructions. The tms signal controls the tap controller fsm and consists of a tms header to initialze tap controller and a footer to reset tap contoller. It is filled with zeros between the header and footer to work simutaneouly with tdi signal. The high level overview of the encoding scheme is shown in Figure 4. 
 <p align="center">
  <img src="/docs/figures/encode.png">
</p>

The encoding scheme that contains CRC information contains a JTAG header and footer, a header that contains information about the number of 64-bit packets and the number of bits %64 (modulo remainder) depending on the size of the Bitstream. For example in the testbench provided there are 2250 bits of bitstream. Therefore there are 35 packets of data + 1 packet of header + 10 bits of %64 remainder (when CRC is enabled the 10 remaing bits are padded to make a 64-bit data packet with 8-bit CRC Key). Therefore in total there are 37 packets and %64 remainder of 10. Each "packet" contains 64 bits of bitstream data and 8-bits or CRC key. The high level overview of the encoding scheme is shown in Figure 4. A "packet" for the encodign scheme with CRC is shown below. 
 <p align="center">
  <img src="/docs/figures/packet1.png">
</p>

The encoding scheme without CRC is similar to the scheme with CRC however the "packets" differ because they do not contain a CRC key. Additionally it does not add padding to the final packet. A "packet" for the encodign scheme without CRC is shown below. 
 <p align="center">
  <img src="/docs/figures/packet2.png">
</p>


### Blocks
##### JTAG TAP Controller
The PMU utilizes a JTAG implementation from OpenCores found [here](https://github.com/freecores/jtag) as a template. Two new instrutcions: pmu_w_cs and pmu_wo_cs are added along with some control and data singals for the PMU. These two instructions are intrepreted by the tap controller and have to purpose of loading a bitstream with and without activating a checksum (CRC8).  
##### PMU FSM
The PMU contains an FSM that intpretes the the encoding scheme and control signals from JTAG tap_controller. This FSM was designed based on the decision tree below. PMU version 1 has two main functions loading a bitstream with checksum and loading a bitstream without employing a checksum. In this version CRC8 is being used to calculate a checksum. These two operations are controlled with the checksum_en_i singal. The FSM uses counters to contorl the movement between states and correctly intrepret the encoded bitstream.

 <p align="center">
  <img src="/docs/figures/FSM_decision_tree.png">
</p>

##### CRC8
This is a classic implementation of cyclic redundancy check that relies on polynomial arithmetic in finite field F2 raised to the power of 8. The linear feedback shift register(LFSR) circuit shown below is contaned inside the CRC8 module. The LFSR below implemets CRC over F2 raised to 8 using the generating polynomial G(x) = X^8 + X^7 + X^6 + X^5 + X^3 + X + 1. It operates by shifting in n number of data bits + 8 bits of '0' padding through the shift register. Once the n bits of data plus 8-bits of padding the CRC key is the value in the LFSR. If this value is then appened to the data and again given to the LFSR the value in the LFSR should be zero. If the value is not zero it indicates that there was an error or bit flip in the data. Some basic reference to LFSRs and how they work can be forun [here](https://www.eng.auburn.edu/~strouce/class/elec6250/LFSRs.pdf).

<p align="center">
  <img src="/docs/figures/CRC8.png"> 
</p>

#### Scripts
Included there is a [python script](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/scripts/V1_encode.py) used to generate the bitstream with the encoding scheme and without used for pmu_top functional testing . This python script can be used as a temlplate to generate similar encdoded bitstreams. Future versions of the PMU will include more user friendly versions of this bitstream encoding script. 

#### Testing

##### Functional
- JTAG TAP CONTROLLER
  [testbench]()

- CRC8


- PMU


- PMU_TOP



##### Unit
- TBD

## Installation
## Dependencies
## TO-DO
 - Unit Testing
## Acknoledgements
- [MAC_unit_systolic](https://github.com/lnis-uofu/MAC_unit_systolic): Repository Organization
- [JTAG](https://github.com/freecores/jtag): JTAG implementation from OpenCores
