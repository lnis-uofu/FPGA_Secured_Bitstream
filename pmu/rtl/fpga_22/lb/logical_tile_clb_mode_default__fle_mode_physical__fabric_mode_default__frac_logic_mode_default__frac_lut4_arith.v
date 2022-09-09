//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: frac_lut4_arith
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4_arith -----
module logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4_arith(config_enable,
                                                                                                                       pReset,
                                                                                                                       prog_clk,
                                                                                                                       frac_lut4_arith_in,
                                                                                                                       frac_lut4_arith_cin,
                                                                                                                       ccff_head,
                                                                                                                       frac_lut4_arith_lut3_out,
                                                                                                                       frac_lut4_arith_lut4_out,
                                                                                                                       frac_lut4_arith_cout,
                                                                                                                       ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:3] frac_lut4_arith_in;
//----- INPUT PORTS -----
input [0:0] frac_lut4_arith_cin;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:1] frac_lut4_arith_lut3_out;
//----- OUTPUT PORTS -----
output [0:0] frac_lut4_arith_lut4_out;
//----- OUTPUT PORTS -----
output [0:0] frac_lut4_arith_cout;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:3] frac_lut4_arith_in;
wire [0:0] frac_lut4_arith_cin;
wire [0:1] frac_lut4_arith_lut3_out;
wire [0:0] frac_lut4_arith_lut4_out;
wire [0:0] frac_lut4_arith_cout;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:1] frac_lut4_arith_0_mode;
wire [0:15] frac_lut4_arith_0_sram;
wire [0:17] frac_lut4_arith_sofa_plus_ccff_mem_undriven_mem_outb;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	frac_lut4_arith frac_lut4_arith_0_ (
		.in(frac_lut4_arith_in[0:3]),
		.cin(frac_lut4_arith_cin),
		.sram(frac_lut4_arith_0_sram[0:15]),
		.mode(frac_lut4_arith_0_mode[0:1]),
		.lut3_out(frac_lut4_arith_lut3_out[0:1]),
		.lut4_out(frac_lut4_arith_lut4_out),
		.cout(frac_lut4_arith_cout));

	frac_lut4_arith_sofa_plus_ccff_mem frac_lut4_arith_sofa_plus_ccff_mem (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out({frac_lut4_arith_0_sram[0:15], frac_lut4_arith_0_mode[0:1]}),
		.mem_outb(frac_lut4_arith_sofa_plus_ccff_mem_undriven_mem_outb[0:17]));

endmodule
// ----- END Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4_arith -----

//----- Default net type -----
`default_nettype wire



