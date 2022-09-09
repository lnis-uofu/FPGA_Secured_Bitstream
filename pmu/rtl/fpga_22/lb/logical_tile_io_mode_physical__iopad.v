//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: iopad
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_io_mode_physical__iopad -----
module logical_tile_io_mode_physical__iopad(IO_ISOL_N,
                                            config_enable,
                                            pReset,
                                            prog_clk,
                                            gfpga_pad_sofa_plus_io_SOC_IN,
                                            gfpga_pad_sofa_plus_io_SOC_OUT,
                                            gfpga_pad_sofa_plus_io_SOC_DIR,
                                            iopad_outpad,
                                            ccff_head,
                                            iopad_inpad,
                                            ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] IO_ISOL_N;
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- GPIN PORTS -----
input [0:0] gfpga_pad_sofa_plus_io_SOC_IN;
//----- GPOUT PORTS -----
output [0:0] gfpga_pad_sofa_plus_io_SOC_OUT;
//----- GPOUT PORTS -----
output [0:0] gfpga_pad_sofa_plus_io_SOC_DIR;
//----- INPUT PORTS -----
input [0:0] iopad_outpad;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] iopad_inpad;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:0] iopad_outpad;
wire [0:0] iopad_inpad;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_io_0_en;
wire [0:0] sofa_plus_io_sofa_plus_ccff_mem_undriven_mem_outb;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_io sofa_plus_io_0_ (
		.IO_ISOL_N(IO_ISOL_N),
		.SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN),
		.SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT),
		.SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR),
		.FPGA_OUT(iopad_outpad),
		.FPGA_DIR(sofa_plus_io_0_en),
		.FPGA_IN(iopad_inpad));

	sofa_plus_io_sofa_plus_ccff_mem sofa_plus_io_sofa_plus_ccff_mem (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out(sofa_plus_io_0_en),
		.mem_outb(sofa_plus_io_sofa_plus_ccff_mem_undriven_mem_outb));

endmodule
// ----- END Verilog module for logical_tile_io_mode_physical__iopad -----

//----- Default net type -----
`default_nettype wire



