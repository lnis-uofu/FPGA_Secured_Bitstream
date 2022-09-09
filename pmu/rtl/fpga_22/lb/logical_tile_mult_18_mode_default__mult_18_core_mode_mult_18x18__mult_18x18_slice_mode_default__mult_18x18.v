//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: mult_18x18
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18 -----
module logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18(config_enable,
                                                                                                                  pReset,
                                                                                                                  prog_clk,
                                                                                                                  mult_18x18_A,
                                                                                                                  mult_18x18_B,
                                                                                                                  ccff_head,
                                                                                                                  mult_18x18_Y,
                                                                                                                  ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:17] mult_18x18_A;
//----- INPUT PORTS -----
input [0:17] mult_18x18_B;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:35] mult_18x18_Y;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:17] mult_18x18_A;
wire [0:17] mult_18x18_B;
wire [0:35] mult_18x18_Y;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] frac_mult_18_18_0_mode;
wire [0:0] frac_mult_18_18_sofa_plus_ccff_mem_undriven_mem_outb;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	frac_mult_18_18 frac_mult_18_18_0_ (
		.A(mult_18x18_A[0:17]),
		.B(mult_18x18_B[0:17]),
		.MODE(frac_mult_18_18_0_mode),
		.Y(mult_18x18_Y[0:35]));

	frac_mult_18_18_sofa_plus_ccff_mem frac_mult_18_18_sofa_plus_ccff_mem (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out(frac_mult_18_18_0_mode),
		.mem_outb(frac_mult_18_18_sofa_plus_ccff_mem_undriven_mem_outb));

endmodule
// ----- END Verilog module for logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18 -----

//----- Default net type -----
`default_nettype wire



