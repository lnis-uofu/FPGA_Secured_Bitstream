//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for physical tile: io_top]
//	Author: Xifan TANG
//	Organization: University of Utah
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Grid Verilog module: grid_io_top_top -----
//----- Default net type -----

// ----- Verilog module for grid_io_top_top -----
module grid_io_top_top(IO_ISOL_N,
                       pReset,
                       prog_clk,
                       gfpga_pad_EMBEDDED_IO_HD_SOC_IN,
                       gfpga_pad_EMBEDDED_IO_HD_SOC_OUT,
                       gfpga_pad_EMBEDDED_IO_HD_SOC_DIR,
                       bottom_width_0_height_0_subtile_0__pin_outpad_0_,
                       ccff_head,
                       bottom_width_0_height_0_subtile_0__pin_inpad_0_upper,
                       bottom_width_0_height_0_subtile_0__pin_inpad_0_lower,
                       ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] IO_ISOL_N;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- GPIN PORTS -----
input [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_IN;
//----- GPOUT PORTS -----
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT;
//----- GPOUT PORTS -----
output [0:0] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR;
//----- INPUT PORTS -----
input [0:0] bottom_width_0_height_0_subtile_0__pin_outpad_0_;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] bottom_width_0_height_0_subtile_0__pin_inpad_0_upper;
//----- OUTPUT PORTS -----
output [0:0] bottom_width_0_height_0_subtile_0__pin_inpad_0_lower;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign bottom_width_0_height_0_subtile_0__pin_inpad_0_lower[0] = bottom_width_0_height_0_subtile_0__pin_inpad_0_upper[0];
// ----- END Local output short connections -----

	logical_tile_io_mode_io_ logical_tile_io_mode_io__0 (
		.IO_ISOL_N(IO_ISOL_N),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_EMBEDDED_IO_HD_SOC_IN(gfpga_pad_EMBEDDED_IO_HD_SOC_IN),
		.gfpga_pad_EMBEDDED_IO_HD_SOC_OUT(gfpga_pad_EMBEDDED_IO_HD_SOC_OUT),
		.gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(gfpga_pad_EMBEDDED_IO_HD_SOC_DIR),
		.io_outpad(bottom_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(ccff_head),
		.io_inpad(bottom_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.ccff_tail(ccff_tail));

endmodule
// ----- END Verilog module for grid_io_top_top -----

//----- Default net type -----



// ----- END Grid Verilog module: grid_io_top_top -----

