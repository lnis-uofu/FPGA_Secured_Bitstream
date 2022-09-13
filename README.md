# PMU V3: Secure Bitstream Loader

## Getting Started

1. Checkout the repository
```sh
git clone --recursive git@github.com:lnis-uofu/FPGA_Secured_Bitstream.git
cd FPGA_Secured_Bitstream.git
```
2. Setup the environment variables in a `csh`/`tcsh` shell
```csh
source setup_enc.csh
```

## Introduction
The Programmign Management Unit will serve as a macro that can be placed near a FPGA to handle bitstream loading. While the primary functonalty of the PMU is to load a bitstream into an FPGA Core it will also incoroporate some hardware security and data integrity features. This is in reponse to the need for OpenFPGA to be able to incoporate some hardware security IPs to its FPGA design framework. As of today the PMU version 3 is capable of 8 instructions for loading a bistream with the options of using AES encription and/or SHA authentication. The FSM contained in this macro intreprets a serially encoded "pmu header" that is appened to a plaintext bitstream, ciphertext bitstream, or cipher key. This version of the PMU also features some testing features encure accurate loading of the correct bitsteam to the FPGA core. With that, the final version of the PMU will resembel a RISC-V core that incorporates all the features of the previous PMU versions as well as other features such as programming multiple FPGA configuration chains and post fabrication updates. 

## Programming Management Unit: PMU
### Version 3
  PMU V3 consists of a JTAG Tap Controller, PMU FSM, with SHA and AES interfaces. Version 3 incoportates AES for bitstream encryption and SHA for bitstream data integrity and user authentication. Since PMU version 3 was implemented as a test chip the hierarchial overview of the test chip is shown in Figure 2 and mored detailed organizatioin of the blocks within the PMU are presented later in the README.
  
  
 <p align="center">
  <img src="/docs/figures/PMU_caravel.png">
</p>

# TO BE UPDATED

### PMU Instructions/Encoding Scheme
Since the PMU is capable of using AES and SHA separately or combined, it creates the need for several encoding schemes. For example, if you want to load a bitstream without utilizing any of the PMUs security features, the instruction header can be reduced to only contain the instruction. This is to avoid any extra informationi being left in the bitstream, which could include information like public/private key combinitations for asymetric cipher blocks. Since almost all 7 instructions have a unique encoding format, each instruction will be listed here with the appropriate bitstream encoding mechanisms. The names of the instructions reflect their operation can be categorized as: loading a key, loading a bitstream, or pushing the bitstream from the fpga core. With that AES or SHA engines can be used to improve the security achieved in each category. 
For example the PMU can load a key without AES or SHA and then use both cipher cores when loading the bitstream to ensure its authenticy and protect the plain text bitstream. Then using the "push bitstream" instruction the user can read out the plaintext value loaded into the FPGA core. This instructions is solely for testing purposes and would not be implemented in anything but a testchip. Instruction binary values chosen such that the done resemble and common brute force attacks like sending a string of alternating values. ie. '10101'.

#### INSTRUCTIONS

#### '00101' LOAD KEY

#### '00111' LOAD BITSTREAM

#### '10111' PUSH BITSTREAM

#### '00110' LOAD KEY SHA

#### '11001' LOAD BITSTREAM SHA

#### '01101' LOAD BITSTREAM AES

#### '11010' LOAD BITSTREAM +SHA +AES

### Blocks
##### JTAG TAP Controller
The PMU utilizes a JTAG implementation from OpenCores found [here](https://github.com/freecores/jtag) as a template. A new instruction is added to enable and route serial data to the pmu core. 

##### PMU FSM
The PMU contains an FSM that intpretes the the encoding scheme and control signals from JTAG tap_controller. This FSM was designed based on the decision tree below. PMU version 1 has two main functions loading a bitstream with checksum and loading a bitstream without employing a checksum. In this version CRC8 is being used to calculate a checksum. These two operations are controlled with the checksum_en_i singal. If checksum is enabled and it fails due to errors in the bitstream or CRC keys it will reset both the JTAG tap controller and the FPGA core such that incorrect data is not loaded into the bitstream. The FSM uses counters to contorl the movement between states and correctly intrepret the encoded bitstream.

 <p align="center">
  <img src="/docs/figures/FSM_decision_tree.png">
</p>

##### Note on Key Storage
Due to the limitations of the skywater130 pdk PMU v3 uses registers to store the AES key. Ideally this key would be stored in a custom 128b ePROM/FLASH write only memory or the another key manage approach would be to utilize a rolling AES key as has been done in Xillinx FPGAs. From a hardware security perspective cipher key storage is considered one of the biggest weaknesses of a system. However, the scope of the project ends at key management techniques as this aspect of the design could be left to another research project.

#### Scripts
Included there is a [python script](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/scripts/V1_encode.py) used to generate the bitstream with the encoding scheme and without used for pmu_top functional testing. This python script can be used as a temlplate to generate similar encdoded bitstreams. Future versions of the PMU will include more user friendly versions of this bitstream encoding script. 

#### Testing
Information about testing is [here](https://github.com/lnis-uofu/FPGA_Secured_Bitstream/blob/v1/testbench/README.md) in the testbench/README.md file.

## Dependencies
## TO-DO
 - Unit Testing
 - Dependencies
## Acknoledgements
- [MAC_unit_systolic](https://github.com/lnis-uofu/MAC_unit_systolic): Repository Organization
- [JTAG](https://github.com/freecores/jtag): JTAG implementation from OpenCores
- [AES](https://github.com/secworks/aes): AES-128b
- [SHA](https://github.com/secworks/sha256): SHA-256b
