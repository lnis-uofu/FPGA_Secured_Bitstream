//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for pb_type: mult_18
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Physical programmable logic block Verilog module: mult_18 -----
//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_mult_18_mode_mult_18_ -----
module logical_tile_mult_18_mode_mult_18_(config_enable,
                                          pReset,
                                          prog_clk,
                                          mult_18_a,
                                          mult_18_b,
                                          ccff_head,
                                          mult_18_out,
                                          ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:17] mult_18_a;
//----- INPUT PORTS -----
input [0:17] mult_18_b;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:35] mult_18_out;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:17] mult_18_a;
wire [0:17] mult_18_b;
wire [0:35] mult_18_out;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] logical_tile_mult_18_mode_default__mult_18_core_0_ccff_tail;
wire [0:35] logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out;
wire [0:0] mux_tree_size18_0_out;
wire [0:4] mux_tree_size18_0_sram;
wire [0:4] mux_tree_size18_0_sram_inv;
wire [0:0] mux_tree_size18_10_out;
wire [0:4] mux_tree_size18_10_sram;
wire [0:4] mux_tree_size18_10_sram_inv;
wire [0:0] mux_tree_size18_11_out;
wire [0:4] mux_tree_size18_11_sram;
wire [0:4] mux_tree_size18_11_sram_inv;
wire [0:0] mux_tree_size18_12_out;
wire [0:4] mux_tree_size18_12_sram;
wire [0:4] mux_tree_size18_12_sram_inv;
wire [0:0] mux_tree_size18_13_out;
wire [0:4] mux_tree_size18_13_sram;
wire [0:4] mux_tree_size18_13_sram_inv;
wire [0:0] mux_tree_size18_14_out;
wire [0:4] mux_tree_size18_14_sram;
wire [0:4] mux_tree_size18_14_sram_inv;
wire [0:0] mux_tree_size18_15_out;
wire [0:4] mux_tree_size18_15_sram;
wire [0:4] mux_tree_size18_15_sram_inv;
wire [0:0] mux_tree_size18_16_out;
wire [0:4] mux_tree_size18_16_sram;
wire [0:4] mux_tree_size18_16_sram_inv;
wire [0:0] mux_tree_size18_17_out;
wire [0:4] mux_tree_size18_17_sram;
wire [0:4] mux_tree_size18_17_sram_inv;
wire [0:0] mux_tree_size18_18_out;
wire [0:4] mux_tree_size18_18_sram;
wire [0:4] mux_tree_size18_18_sram_inv;
wire [0:0] mux_tree_size18_19_out;
wire [0:4] mux_tree_size18_19_sram;
wire [0:4] mux_tree_size18_19_sram_inv;
wire [0:0] mux_tree_size18_1_out;
wire [0:4] mux_tree_size18_1_sram;
wire [0:4] mux_tree_size18_1_sram_inv;
wire [0:0] mux_tree_size18_20_out;
wire [0:4] mux_tree_size18_20_sram;
wire [0:4] mux_tree_size18_20_sram_inv;
wire [0:0] mux_tree_size18_21_out;
wire [0:4] mux_tree_size18_21_sram;
wire [0:4] mux_tree_size18_21_sram_inv;
wire [0:0] mux_tree_size18_22_out;
wire [0:4] mux_tree_size18_22_sram;
wire [0:4] mux_tree_size18_22_sram_inv;
wire [0:0] mux_tree_size18_23_out;
wire [0:4] mux_tree_size18_23_sram;
wire [0:4] mux_tree_size18_23_sram_inv;
wire [0:0] mux_tree_size18_24_out;
wire [0:4] mux_tree_size18_24_sram;
wire [0:4] mux_tree_size18_24_sram_inv;
wire [0:0] mux_tree_size18_25_out;
wire [0:4] mux_tree_size18_25_sram;
wire [0:4] mux_tree_size18_25_sram_inv;
wire [0:0] mux_tree_size18_26_out;
wire [0:4] mux_tree_size18_26_sram;
wire [0:4] mux_tree_size18_26_sram_inv;
wire [0:0] mux_tree_size18_27_out;
wire [0:4] mux_tree_size18_27_sram;
wire [0:4] mux_tree_size18_27_sram_inv;
wire [0:0] mux_tree_size18_28_out;
wire [0:4] mux_tree_size18_28_sram;
wire [0:4] mux_tree_size18_28_sram_inv;
wire [0:0] mux_tree_size18_29_out;
wire [0:4] mux_tree_size18_29_sram;
wire [0:4] mux_tree_size18_29_sram_inv;
wire [0:0] mux_tree_size18_2_out;
wire [0:4] mux_tree_size18_2_sram;
wire [0:4] mux_tree_size18_2_sram_inv;
wire [0:0] mux_tree_size18_30_out;
wire [0:4] mux_tree_size18_30_sram;
wire [0:4] mux_tree_size18_30_sram_inv;
wire [0:0] mux_tree_size18_31_out;
wire [0:4] mux_tree_size18_31_sram;
wire [0:4] mux_tree_size18_31_sram_inv;
wire [0:0] mux_tree_size18_32_out;
wire [0:4] mux_tree_size18_32_sram;
wire [0:4] mux_tree_size18_32_sram_inv;
wire [0:0] mux_tree_size18_33_out;
wire [0:4] mux_tree_size18_33_sram;
wire [0:4] mux_tree_size18_33_sram_inv;
wire [0:0] mux_tree_size18_34_out;
wire [0:4] mux_tree_size18_34_sram;
wire [0:4] mux_tree_size18_34_sram_inv;
wire [0:0] mux_tree_size18_35_out;
wire [0:4] mux_tree_size18_35_sram;
wire [0:4] mux_tree_size18_35_sram_inv;
wire [0:0] mux_tree_size18_3_out;
wire [0:4] mux_tree_size18_3_sram;
wire [0:4] mux_tree_size18_3_sram_inv;
wire [0:0] mux_tree_size18_4_out;
wire [0:4] mux_tree_size18_4_sram;
wire [0:4] mux_tree_size18_4_sram_inv;
wire [0:0] mux_tree_size18_5_out;
wire [0:4] mux_tree_size18_5_sram;
wire [0:4] mux_tree_size18_5_sram_inv;
wire [0:0] mux_tree_size18_6_out;
wire [0:4] mux_tree_size18_6_sram;
wire [0:4] mux_tree_size18_6_sram_inv;
wire [0:0] mux_tree_size18_7_out;
wire [0:4] mux_tree_size18_7_sram;
wire [0:4] mux_tree_size18_7_sram_inv;
wire [0:0] mux_tree_size18_8_out;
wire [0:4] mux_tree_size18_8_sram;
wire [0:4] mux_tree_size18_8_sram_inv;
wire [0:0] mux_tree_size18_9_out;
wire [0:4] mux_tree_size18_9_sram;
wire [0:4] mux_tree_size18_9_sram_inv;
wire [0:0] mux_tree_size18_mem_0_ccff_tail;
wire [0:0] mux_tree_size18_mem_10_ccff_tail;
wire [0:0] mux_tree_size18_mem_11_ccff_tail;
wire [0:0] mux_tree_size18_mem_12_ccff_tail;
wire [0:0] mux_tree_size18_mem_13_ccff_tail;
wire [0:0] mux_tree_size18_mem_14_ccff_tail;
wire [0:0] mux_tree_size18_mem_15_ccff_tail;
wire [0:0] mux_tree_size18_mem_16_ccff_tail;
wire [0:0] mux_tree_size18_mem_17_ccff_tail;
wire [0:0] mux_tree_size18_mem_18_ccff_tail;
wire [0:0] mux_tree_size18_mem_19_ccff_tail;
wire [0:0] mux_tree_size18_mem_1_ccff_tail;
wire [0:0] mux_tree_size18_mem_20_ccff_tail;
wire [0:0] mux_tree_size18_mem_21_ccff_tail;
wire [0:0] mux_tree_size18_mem_22_ccff_tail;
wire [0:0] mux_tree_size18_mem_23_ccff_tail;
wire [0:0] mux_tree_size18_mem_24_ccff_tail;
wire [0:0] mux_tree_size18_mem_25_ccff_tail;
wire [0:0] mux_tree_size18_mem_26_ccff_tail;
wire [0:0] mux_tree_size18_mem_27_ccff_tail;
wire [0:0] mux_tree_size18_mem_28_ccff_tail;
wire [0:0] mux_tree_size18_mem_29_ccff_tail;
wire [0:0] mux_tree_size18_mem_2_ccff_tail;
wire [0:0] mux_tree_size18_mem_30_ccff_tail;
wire [0:0] mux_tree_size18_mem_31_ccff_tail;
wire [0:0] mux_tree_size18_mem_32_ccff_tail;
wire [0:0] mux_tree_size18_mem_33_ccff_tail;
wire [0:0] mux_tree_size18_mem_34_ccff_tail;
wire [0:0] mux_tree_size18_mem_3_ccff_tail;
wire [0:0] mux_tree_size18_mem_4_ccff_tail;
wire [0:0] mux_tree_size18_mem_5_ccff_tail;
wire [0:0] mux_tree_size18_mem_6_ccff_tail;
wire [0:0] mux_tree_size18_mem_7_ccff_tail;
wire [0:0] mux_tree_size18_mem_8_ccff_tail;
wire [0:0] mux_tree_size18_mem_9_ccff_tail;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	logical_tile_mult_18_mode_default__mult_18_core logical_tile_mult_18_mode_default__mult_18_core_0 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.mult_18_core_a({mux_tree_size18_0_out, mux_tree_size18_1_out, mux_tree_size18_2_out, mux_tree_size18_3_out, mux_tree_size18_4_out, mux_tree_size18_5_out, mux_tree_size18_6_out, mux_tree_size18_7_out, mux_tree_size18_8_out, mux_tree_size18_9_out, mux_tree_size18_10_out, mux_tree_size18_11_out, mux_tree_size18_12_out, mux_tree_size18_13_out, mux_tree_size18_14_out, mux_tree_size18_15_out, mux_tree_size18_16_out, mux_tree_size18_17_out}),
		.mult_18_core_b({mux_tree_size18_18_out, mux_tree_size18_19_out, mux_tree_size18_20_out, mux_tree_size18_21_out, mux_tree_size18_22_out, mux_tree_size18_23_out, mux_tree_size18_24_out, mux_tree_size18_25_out, mux_tree_size18_26_out, mux_tree_size18_27_out, mux_tree_size18_28_out, mux_tree_size18_29_out, mux_tree_size18_30_out, mux_tree_size18_31_out, mux_tree_size18_32_out, mux_tree_size18_33_out, mux_tree_size18_34_out, mux_tree_size18_35_out}),
		.ccff_head(ccff_head),
		.mult_18_core_out(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[0:35]),
		.ccff_tail(logical_tile_mult_18_mode_default__mult_18_core_0_ccff_tail));

	direct_interc direct_interc_0_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[0]),
		.out(mult_18_out[0]));

	direct_interc direct_interc_1_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[1]),
		.out(mult_18_out[1]));

	direct_interc direct_interc_2_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[2]),
		.out(mult_18_out[2]));

	direct_interc direct_interc_3_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[3]),
		.out(mult_18_out[3]));

	direct_interc direct_interc_4_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[4]),
		.out(mult_18_out[4]));

	direct_interc direct_interc_5_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[5]),
		.out(mult_18_out[5]));

	direct_interc direct_interc_6_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[6]),
		.out(mult_18_out[6]));

	direct_interc direct_interc_7_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[7]),
		.out(mult_18_out[7]));

	direct_interc direct_interc_8_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[8]),
		.out(mult_18_out[8]));

	direct_interc direct_interc_9_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[9]),
		.out(mult_18_out[9]));

	direct_interc direct_interc_10_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[10]),
		.out(mult_18_out[10]));

	direct_interc direct_interc_11_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[11]),
		.out(mult_18_out[11]));

	direct_interc direct_interc_12_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[12]),
		.out(mult_18_out[12]));

	direct_interc direct_interc_13_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[13]),
		.out(mult_18_out[13]));

	direct_interc direct_interc_14_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[14]),
		.out(mult_18_out[14]));

	direct_interc direct_interc_15_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[15]),
		.out(mult_18_out[15]));

	direct_interc direct_interc_16_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[16]),
		.out(mult_18_out[16]));

	direct_interc direct_interc_17_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[17]),
		.out(mult_18_out[17]));

	direct_interc direct_interc_18_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[18]),
		.out(mult_18_out[18]));

	direct_interc direct_interc_19_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[19]),
		.out(mult_18_out[19]));

	direct_interc direct_interc_20_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[20]),
		.out(mult_18_out[20]));

	direct_interc direct_interc_21_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[21]),
		.out(mult_18_out[21]));

	direct_interc direct_interc_22_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[22]),
		.out(mult_18_out[22]));

	direct_interc direct_interc_23_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[23]),
		.out(mult_18_out[23]));

	direct_interc direct_interc_24_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[24]),
		.out(mult_18_out[24]));

	direct_interc direct_interc_25_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[25]),
		.out(mult_18_out[25]));

	direct_interc direct_interc_26_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[26]),
		.out(mult_18_out[26]));

	direct_interc direct_interc_27_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[27]),
		.out(mult_18_out[27]));

	direct_interc direct_interc_28_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[28]),
		.out(mult_18_out[28]));

	direct_interc direct_interc_29_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[29]),
		.out(mult_18_out[29]));

	direct_interc direct_interc_30_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[30]),
		.out(mult_18_out[30]));

	direct_interc direct_interc_31_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[31]),
		.out(mult_18_out[31]));

	direct_interc direct_interc_32_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[32]),
		.out(mult_18_out[32]));

	direct_interc direct_interc_33_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[33]),
		.out(mult_18_out[33]));

	direct_interc direct_interc_34_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[34]),
		.out(mult_18_out[34]));

	direct_interc direct_interc_35_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_0_mult_18_core_out[35]),
		.out(mult_18_out[35]));

	mux_tree_size18 mux_mult_18_core_0_a_0 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_0_sram[0:4]),
		.sram_inv(mux_tree_size18_0_sram_inv[0:4]),
		.out(mux_tree_size18_0_out));

	mux_tree_size18 mux_mult_18_core_0_a_1 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_1_sram[0:4]),
		.sram_inv(mux_tree_size18_1_sram_inv[0:4]),
		.out(mux_tree_size18_1_out));

	mux_tree_size18 mux_mult_18_core_0_a_2 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_2_sram[0:4]),
		.sram_inv(mux_tree_size18_2_sram_inv[0:4]),
		.out(mux_tree_size18_2_out));

	mux_tree_size18 mux_mult_18_core_0_a_3 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_3_sram[0:4]),
		.sram_inv(mux_tree_size18_3_sram_inv[0:4]),
		.out(mux_tree_size18_3_out));

	mux_tree_size18 mux_mult_18_core_0_a_4 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_4_sram[0:4]),
		.sram_inv(mux_tree_size18_4_sram_inv[0:4]),
		.out(mux_tree_size18_4_out));

	mux_tree_size18 mux_mult_18_core_0_a_5 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_5_sram[0:4]),
		.sram_inv(mux_tree_size18_5_sram_inv[0:4]),
		.out(mux_tree_size18_5_out));

	mux_tree_size18 mux_mult_18_core_0_a_6 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_6_sram[0:4]),
		.sram_inv(mux_tree_size18_6_sram_inv[0:4]),
		.out(mux_tree_size18_6_out));

	mux_tree_size18 mux_mult_18_core_0_a_7 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_7_sram[0:4]),
		.sram_inv(mux_tree_size18_7_sram_inv[0:4]),
		.out(mux_tree_size18_7_out));

	mux_tree_size18 mux_mult_18_core_0_a_8 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_8_sram[0:4]),
		.sram_inv(mux_tree_size18_8_sram_inv[0:4]),
		.out(mux_tree_size18_8_out));

	mux_tree_size18 mux_mult_18_core_0_a_9 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_9_sram[0:4]),
		.sram_inv(mux_tree_size18_9_sram_inv[0:4]),
		.out(mux_tree_size18_9_out));

	mux_tree_size18 mux_mult_18_core_0_a_10 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_10_sram[0:4]),
		.sram_inv(mux_tree_size18_10_sram_inv[0:4]),
		.out(mux_tree_size18_10_out));

	mux_tree_size18 mux_mult_18_core_0_a_11 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_11_sram[0:4]),
		.sram_inv(mux_tree_size18_11_sram_inv[0:4]),
		.out(mux_tree_size18_11_out));

	mux_tree_size18 mux_mult_18_core_0_a_12 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_12_sram[0:4]),
		.sram_inv(mux_tree_size18_12_sram_inv[0:4]),
		.out(mux_tree_size18_12_out));

	mux_tree_size18 mux_mult_18_core_0_a_13 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_13_sram[0:4]),
		.sram_inv(mux_tree_size18_13_sram_inv[0:4]),
		.out(mux_tree_size18_13_out));

	mux_tree_size18 mux_mult_18_core_0_a_14 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_14_sram[0:4]),
		.sram_inv(mux_tree_size18_14_sram_inv[0:4]),
		.out(mux_tree_size18_14_out));

	mux_tree_size18 mux_mult_18_core_0_a_15 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_15_sram[0:4]),
		.sram_inv(mux_tree_size18_15_sram_inv[0:4]),
		.out(mux_tree_size18_15_out));

	mux_tree_size18 mux_mult_18_core_0_a_16 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_16_sram[0:4]),
		.sram_inv(mux_tree_size18_16_sram_inv[0:4]),
		.out(mux_tree_size18_16_out));

	mux_tree_size18 mux_mult_18_core_0_a_17 (
		.in(mult_18_a[0:17]),
		.sram(mux_tree_size18_17_sram[0:4]),
		.sram_inv(mux_tree_size18_17_sram_inv[0:4]),
		.out(mux_tree_size18_17_out));

	mux_tree_size18 mux_mult_18_core_0_b_0 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_18_sram[0:4]),
		.sram_inv(mux_tree_size18_18_sram_inv[0:4]),
		.out(mux_tree_size18_18_out));

	mux_tree_size18 mux_mult_18_core_0_b_1 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_19_sram[0:4]),
		.sram_inv(mux_tree_size18_19_sram_inv[0:4]),
		.out(mux_tree_size18_19_out));

	mux_tree_size18 mux_mult_18_core_0_b_2 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_20_sram[0:4]),
		.sram_inv(mux_tree_size18_20_sram_inv[0:4]),
		.out(mux_tree_size18_20_out));

	mux_tree_size18 mux_mult_18_core_0_b_3 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_21_sram[0:4]),
		.sram_inv(mux_tree_size18_21_sram_inv[0:4]),
		.out(mux_tree_size18_21_out));

	mux_tree_size18 mux_mult_18_core_0_b_4 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_22_sram[0:4]),
		.sram_inv(mux_tree_size18_22_sram_inv[0:4]),
		.out(mux_tree_size18_22_out));

	mux_tree_size18 mux_mult_18_core_0_b_5 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_23_sram[0:4]),
		.sram_inv(mux_tree_size18_23_sram_inv[0:4]),
		.out(mux_tree_size18_23_out));

	mux_tree_size18 mux_mult_18_core_0_b_6 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_24_sram[0:4]),
		.sram_inv(mux_tree_size18_24_sram_inv[0:4]),
		.out(mux_tree_size18_24_out));

	mux_tree_size18 mux_mult_18_core_0_b_7 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_25_sram[0:4]),
		.sram_inv(mux_tree_size18_25_sram_inv[0:4]),
		.out(mux_tree_size18_25_out));

	mux_tree_size18 mux_mult_18_core_0_b_8 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_26_sram[0:4]),
		.sram_inv(mux_tree_size18_26_sram_inv[0:4]),
		.out(mux_tree_size18_26_out));

	mux_tree_size18 mux_mult_18_core_0_b_9 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_27_sram[0:4]),
		.sram_inv(mux_tree_size18_27_sram_inv[0:4]),
		.out(mux_tree_size18_27_out));

	mux_tree_size18 mux_mult_18_core_0_b_10 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_28_sram[0:4]),
		.sram_inv(mux_tree_size18_28_sram_inv[0:4]),
		.out(mux_tree_size18_28_out));

	mux_tree_size18 mux_mult_18_core_0_b_11 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_29_sram[0:4]),
		.sram_inv(mux_tree_size18_29_sram_inv[0:4]),
		.out(mux_tree_size18_29_out));

	mux_tree_size18 mux_mult_18_core_0_b_12 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_30_sram[0:4]),
		.sram_inv(mux_tree_size18_30_sram_inv[0:4]),
		.out(mux_tree_size18_30_out));

	mux_tree_size18 mux_mult_18_core_0_b_13 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_31_sram[0:4]),
		.sram_inv(mux_tree_size18_31_sram_inv[0:4]),
		.out(mux_tree_size18_31_out));

	mux_tree_size18 mux_mult_18_core_0_b_14 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_32_sram[0:4]),
		.sram_inv(mux_tree_size18_32_sram_inv[0:4]),
		.out(mux_tree_size18_32_out));

	mux_tree_size18 mux_mult_18_core_0_b_15 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_33_sram[0:4]),
		.sram_inv(mux_tree_size18_33_sram_inv[0:4]),
		.out(mux_tree_size18_33_out));

	mux_tree_size18 mux_mult_18_core_0_b_16 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_34_sram[0:4]),
		.sram_inv(mux_tree_size18_34_sram_inv[0:4]),
		.out(mux_tree_size18_34_out));

	mux_tree_size18 mux_mult_18_core_0_b_17 (
		.in(mult_18_b[0:17]),
		.sram(mux_tree_size18_35_sram[0:4]),
		.sram_inv(mux_tree_size18_35_sram_inv[0:4]),
		.out(mux_tree_size18_35_out));

	mux_tree_size18_mem mem_mult_18_core_0_a_0 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(logical_tile_mult_18_mode_default__mult_18_core_0_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_0_ccff_tail),
		.mem_out(mux_tree_size18_0_sram[0:4]),
		.mem_outb(mux_tree_size18_0_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_1 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_0_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_1_ccff_tail),
		.mem_out(mux_tree_size18_1_sram[0:4]),
		.mem_outb(mux_tree_size18_1_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_2 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_1_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_2_ccff_tail),
		.mem_out(mux_tree_size18_2_sram[0:4]),
		.mem_outb(mux_tree_size18_2_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_3 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_2_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_3_ccff_tail),
		.mem_out(mux_tree_size18_3_sram[0:4]),
		.mem_outb(mux_tree_size18_3_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_4 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_3_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_4_ccff_tail),
		.mem_out(mux_tree_size18_4_sram[0:4]),
		.mem_outb(mux_tree_size18_4_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_5 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_4_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_5_ccff_tail),
		.mem_out(mux_tree_size18_5_sram[0:4]),
		.mem_outb(mux_tree_size18_5_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_6 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_5_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_6_ccff_tail),
		.mem_out(mux_tree_size18_6_sram[0:4]),
		.mem_outb(mux_tree_size18_6_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_7 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_6_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_7_ccff_tail),
		.mem_out(mux_tree_size18_7_sram[0:4]),
		.mem_outb(mux_tree_size18_7_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_8 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_7_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_8_ccff_tail),
		.mem_out(mux_tree_size18_8_sram[0:4]),
		.mem_outb(mux_tree_size18_8_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_9 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_8_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_9_ccff_tail),
		.mem_out(mux_tree_size18_9_sram[0:4]),
		.mem_outb(mux_tree_size18_9_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_10 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_9_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_10_ccff_tail),
		.mem_out(mux_tree_size18_10_sram[0:4]),
		.mem_outb(mux_tree_size18_10_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_11 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_10_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_11_ccff_tail),
		.mem_out(mux_tree_size18_11_sram[0:4]),
		.mem_outb(mux_tree_size18_11_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_12 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_11_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_12_ccff_tail),
		.mem_out(mux_tree_size18_12_sram[0:4]),
		.mem_outb(mux_tree_size18_12_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_13 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_12_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_13_ccff_tail),
		.mem_out(mux_tree_size18_13_sram[0:4]),
		.mem_outb(mux_tree_size18_13_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_14 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_13_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_14_ccff_tail),
		.mem_out(mux_tree_size18_14_sram[0:4]),
		.mem_outb(mux_tree_size18_14_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_15 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_14_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_15_ccff_tail),
		.mem_out(mux_tree_size18_15_sram[0:4]),
		.mem_outb(mux_tree_size18_15_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_16 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_15_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_16_ccff_tail),
		.mem_out(mux_tree_size18_16_sram[0:4]),
		.mem_outb(mux_tree_size18_16_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_a_17 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_16_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_17_ccff_tail),
		.mem_out(mux_tree_size18_17_sram[0:4]),
		.mem_outb(mux_tree_size18_17_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_0 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_17_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_18_ccff_tail),
		.mem_out(mux_tree_size18_18_sram[0:4]),
		.mem_outb(mux_tree_size18_18_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_1 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_18_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_19_ccff_tail),
		.mem_out(mux_tree_size18_19_sram[0:4]),
		.mem_outb(mux_tree_size18_19_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_2 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_19_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_20_ccff_tail),
		.mem_out(mux_tree_size18_20_sram[0:4]),
		.mem_outb(mux_tree_size18_20_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_3 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_20_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_21_ccff_tail),
		.mem_out(mux_tree_size18_21_sram[0:4]),
		.mem_outb(mux_tree_size18_21_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_4 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_21_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_22_ccff_tail),
		.mem_out(mux_tree_size18_22_sram[0:4]),
		.mem_outb(mux_tree_size18_22_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_5 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_22_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_23_ccff_tail),
		.mem_out(mux_tree_size18_23_sram[0:4]),
		.mem_outb(mux_tree_size18_23_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_6 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_23_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_24_ccff_tail),
		.mem_out(mux_tree_size18_24_sram[0:4]),
		.mem_outb(mux_tree_size18_24_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_7 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_24_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_25_ccff_tail),
		.mem_out(mux_tree_size18_25_sram[0:4]),
		.mem_outb(mux_tree_size18_25_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_8 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_25_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_26_ccff_tail),
		.mem_out(mux_tree_size18_26_sram[0:4]),
		.mem_outb(mux_tree_size18_26_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_9 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_26_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_27_ccff_tail),
		.mem_out(mux_tree_size18_27_sram[0:4]),
		.mem_outb(mux_tree_size18_27_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_10 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_27_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_28_ccff_tail),
		.mem_out(mux_tree_size18_28_sram[0:4]),
		.mem_outb(mux_tree_size18_28_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_11 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_28_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_29_ccff_tail),
		.mem_out(mux_tree_size18_29_sram[0:4]),
		.mem_outb(mux_tree_size18_29_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_12 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_29_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_30_ccff_tail),
		.mem_out(mux_tree_size18_30_sram[0:4]),
		.mem_outb(mux_tree_size18_30_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_13 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_30_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_31_ccff_tail),
		.mem_out(mux_tree_size18_31_sram[0:4]),
		.mem_outb(mux_tree_size18_31_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_14 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_31_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_32_ccff_tail),
		.mem_out(mux_tree_size18_32_sram[0:4]),
		.mem_outb(mux_tree_size18_32_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_15 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_32_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_33_ccff_tail),
		.mem_out(mux_tree_size18_33_sram[0:4]),
		.mem_outb(mux_tree_size18_33_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_16 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_33_ccff_tail),
		.ccff_tail(mux_tree_size18_mem_34_ccff_tail),
		.mem_out(mux_tree_size18_34_sram[0:4]),
		.mem_outb(mux_tree_size18_34_sram_inv[0:4]));

	mux_tree_size18_mem mem_mult_18_core_0_b_17 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(mux_tree_size18_mem_34_ccff_tail),
		.ccff_tail(ccff_tail),
		.mem_out(mux_tree_size18_35_sram[0:4]),
		.mem_outb(mux_tree_size18_35_sram_inv[0:4]));

endmodule
// ----- END Verilog module for logical_tile_mult_18_mode_mult_18_ -----

//----- Default net type -----
`default_nettype wire



// ----- END Physical programmable logic block Verilog module: mult_18 -----
