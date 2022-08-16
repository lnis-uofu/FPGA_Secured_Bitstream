//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for physical tile: io_right]
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Grid Verilog module: grid_io_right_right -----
//----- Default net type -----
`default_nettype none

// ----- Verilog module for grid_io_right_right -----
module grid_io_right_right(IO_ISOL_N,
                           config_readback,
                           config_enable,
                           pReset,
                           prog_clk,
                           gfpga_pad_EMBEDDED_IO_ISOLN_SOC_IN,
                           gfpga_pad_EMBEDDED_IO_ISOLN_SOC_OUT,
                           gfpga_pad_EMBEDDED_IO_ISOLN_SOC_DIR,
                           left_width_0_height_0_subtile_0__pin_outpad_0_,
                           ccff_head,
                           left_width_0_height_0_subtile_0__pin_inpad_0_upper,
                           left_width_0_height_0_subtile_0__pin_inpad_0_lower,
                           ccff_tail);
//----- GLOBAL PORTS -----
input wire [0:0] IO_ISOL_N;
//----- GLOBAL PORTS -----
input wire [0:0] config_readback;
//----- GLOBAL PORTS -----
input wire [0:0] config_enable;
//----- GLOBAL PORTS -----
input wire [0:0] pReset;
//----- GLOBAL PORTS -----
input wire [0:0] prog_clk;
//----- GPIN PORTS -----
input wire [0:0] gfpga_pad_EMBEDDED_IO_ISOLN_SOC_IN;
//----- GPOUT PORTS -----
output wire [0:0] gfpga_pad_EMBEDDED_IO_ISOLN_SOC_OUT;
//----- GPOUT PORTS -----
output wire [0:0] gfpga_pad_EMBEDDED_IO_ISOLN_SOC_DIR;
//----- INPUT PORTS -----
input wire [0:0] left_width_0_height_0_subtile_0__pin_outpad_0_;
//----- INPUT PORTS -----
input wire [0:0] ccff_head;
//----- OUTPUT PORTS -----
output wire [0:0] left_width_0_height_0_subtile_0__pin_inpad_0_upper;
//----- OUTPUT PORTS -----
output wire [0:0] left_width_0_height_0_subtile_0__pin_inpad_0_lower;
//----- OUTPUT PORTS -----
output wire [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign left_width_0_height_0_subtile_0__pin_inpad_0_lower[0] = left_width_0_height_0_subtile_0__pin_inpad_0_upper[0];
// ----- END Local output short connections -----

	logical_tile_io_mode_io_ logical_tile_io_mode_io__0 (
		.IO_ISOL_N(IO_ISOL_N),
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_EMBEDDED_IO_ISOLN_SOC_IN(gfpga_pad_EMBEDDED_IO_ISOLN_SOC_IN),
		.gfpga_pad_EMBEDDED_IO_ISOLN_SOC_OUT(gfpga_pad_EMBEDDED_IO_ISOLN_SOC_OUT),
		.gfpga_pad_EMBEDDED_IO_ISOLN_SOC_DIR(gfpga_pad_EMBEDDED_IO_ISOLN_SOC_DIR),
		.io_outpad(left_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(ccff_head),
		.io_inpad(left_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.ccff_tail(ccff_tail));

endmodule
// ----- END Verilog module for grid_io_right_right -----

//----- Default net type -----
`default_nettype none



// ----- END Grid Verilog module: grid_io_right_right -----

