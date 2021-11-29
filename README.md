# FPGA Secured Bitstream

<p align="center">
  <img src="./docs/figures/JtagInterface -FPGA.drawio.svg">
</p>
  
|              Summary of Completeness                       |
| :----:         | :----:             |  :----:  |  :----:   |
|                |                    |     RTL  | Testbench |
|  PMU           |                    |          |           |
|                | PMU                |          |           |
|                | Address Generator  |    X     |      X    |
|                | AES                |    X     |      X    |
|                | Key Storage        |    X     |      X    |
|                | PISO               |    X     |      X    |
|                | SIPO               |    X     |      X    |
| NV Memory      |                    |          |      X    |
|                | NV Memory          |          |      X    | 
| Mock FPGA Core |                    |          |      X    |
|                |             |          |           |
|                |             |          |           |
|                |             |          |           |
|                |             |          |           |
  

## Acknowledgments

Other projects used in FPGA Secured Bitstream
- [JTAG](https://github.com/freecores/jtag): Easy to use JTAG Implementation
- [AES](https://github.com/hplp/AES_implementations): AES Implementation
