//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for pb_type: clb
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Physical programmable logic block Verilog module: clb -----
//----- Default net type -----
`default_nettype none

// ----- Verilog module for logical_tile_clb_mode_clb_ -----
module logical_tile_clb_mode_clb_(config_readback,
                                  config_enable,
                                  pReset,
                                  prog_clk,
                                  Test_en,
                                  clb_I0,
                                  clb_I0i,
                                  clb_I1,
                                  clb_I1i,
                                  clb_I2,
                                  clb_I2i,
                                  clb_I3,
                                  clb_I3i,
                                  clb_I4,
                                  clb_I4i,
                                  clb_I5,
                                  clb_I5i,
                                  clb_I6,
                                  clb_I6i,
                                  clb_I7,
                                  clb_I7i,
                                  clb_sc_in,
                                  clb_cin,
                                  clb_reset,
                                  clb_clk,
                                  ccff_head,
                                  clb_O,
                                  clb_sc_out,
                                  clb_cout,
                                  ccff_tail);
//----- GLOBAL PORTS -----
input wire [0:0] config_readback;
//----- GLOBAL PORTS -----
input wire [0:0] config_enable;
//----- GLOBAL PORTS -----
input wire [0:0] pReset;
//----- GLOBAL PORTS -----
input wire [0:0] prog_clk;
//----- GLOBAL PORTS -----
input wire [0:0] Test_en;
//----- INPUT PORTS -----
input wire [0:1] clb_I0;
//----- INPUT PORTS -----
input wire [0:1] clb_I0i;
//----- INPUT PORTS -----
input wire [0:1] clb_I1;
//----- INPUT PORTS -----
input wire [0:1] clb_I1i;
//----- INPUT PORTS -----
input wire [0:1] clb_I2;
//----- INPUT PORTS -----
input wire [0:1] clb_I2i;
//----- INPUT PORTS -----
input wire [0:1] clb_I3;
//----- INPUT PORTS -----
input wire [0:1] clb_I3i;
//----- INPUT PORTS -----
input wire [0:1] clb_I4;
//----- INPUT PORTS -----
input wire [0:1] clb_I4i;
//----- INPUT PORTS -----
input wire [0:1] clb_I5;
//----- INPUT PORTS -----
input wire [0:1] clb_I5i;
//----- INPUT PORTS -----
input wire [0:1] clb_I6;
//----- INPUT PORTS -----
input wire [0:1] clb_I6i;
//----- INPUT PORTS -----
input wire [0:1] clb_I7;
//----- INPUT PORTS -----
input wire [0:1] clb_I7i;
//----- INPUT PORTS -----
input wire [0:0] clb_sc_in;
//----- INPUT PORTS -----
input wire [0:0] clb_cin;
//----- INPUT PORTS -----
input wire [0:0] clb_reset;
//----- INPUT PORTS -----
input wire [0:0] clb_clk;
//----- INPUT PORTS -----
input wire [0:0] ccff_head;
//----- OUTPUT PORTS -----
output wire [0:15] clb_O;
//----- OUTPUT PORTS -----
output wire [0:0] clb_sc_out;
//----- OUTPUT PORTS -----
output wire [0:0] clb_cout;
//----- OUTPUT PORTS -----
output wire [0:0] ccff_tail;

/* //----- BEGIN wire-connection ports ----- */
/* wire [0:1] clb_I0; */
/* wire [0:1] clb_I0i; */
/* wire [0:1] clb_I1; */
/* wire [0:1] clb_I1i; */
/* wire [0:1] clb_I2; */
/* wire [0:1] clb_I2i; */
/* wire [0:1] clb_I3; */
/* wire [0:1] clb_I3i; */
/* wire [0:1] clb_I4; */
/* wire [0:1] clb_I4i; */
/* wire [0:1] clb_I5; */
/* wire [0:1] clb_I5i; */
/* wire [0:1] clb_I6; */
/* wire [0:1] clb_I6i; */
/* wire [0:1] clb_I7; */
/* wire [0:1] clb_I7i; */
/* wire [0:0] clb_sc_in; */
/* wire [0:0] clb_cin; */
/* wire [0:0] clb_reset; */
/* wire [0:0] clb_clk; */
/* wire [0:15] clb_O; */
/* wire [0:0] clb_sc_out; */
/* wire [0:0] clb_cout; */
/* //----- END wire-connection ports ----- */


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] direct_interc_18_out;
wire [0:0] direct_interc_19_out;
wire [0:0] direct_interc_20_out;
wire [0:0] direct_interc_21_out;
wire [0:0] direct_interc_22_out;
wire [0:0] direct_interc_23_out;
wire [0:0] direct_interc_24_out;
wire [0:0] direct_interc_25_out;
wire [0:0] direct_interc_26_out;
wire [0:0] direct_interc_27_out;
wire [0:0] direct_interc_28_out;
wire [0:0] direct_interc_29_out;
wire [0:0] direct_interc_30_out;
wire [0:0] direct_interc_31_out;
wire [0:0] direct_interc_32_out;
wire [0:0] direct_interc_33_out;
wire [0:0] direct_interc_34_out;
wire [0:0] direct_interc_35_out;
wire [0:0] direct_interc_36_out;
wire [0:0] direct_interc_37_out;
wire [0:0] direct_interc_38_out;
wire [0:0] direct_interc_39_out;
wire [0:0] direct_interc_40_out;
wire [0:0] direct_interc_41_out;
wire [0:0] direct_interc_42_out;
wire [0:0] direct_interc_43_out;
wire [0:0] direct_interc_44_out;
wire [0:0] direct_interc_45_out;
wire [0:0] direct_interc_46_out;
wire [0:0] direct_interc_47_out;
wire [0:0] direct_interc_48_out;
wire [0:0] direct_interc_49_out;
wire [0:0] direct_interc_50_out;
wire [0:0] direct_interc_51_out;
wire [0:0] direct_interc_52_out;
wire [0:0] direct_interc_53_out;
wire [0:0] direct_interc_54_out;
wire [0:0] direct_interc_55_out;
wire [0:0] direct_interc_56_out;
wire [0:0] direct_interc_57_out;
wire [0:0] direct_interc_58_out;
wire [0:0] direct_interc_59_out;
wire [0:0] direct_interc_60_out;
wire [0:0] direct_interc_61_out;
wire [0:0] direct_interc_62_out;
wire [0:0] direct_interc_63_out;
wire [0:0] direct_interc_64_out;
wire [0:0] direct_interc_65_out;
wire [0:0] direct_interc_66_out;
wire [0:0] direct_interc_67_out;
wire [0:0] direct_interc_68_out;
wire [0:0] direct_interc_69_out;
wire [0:0] direct_interc_70_out;
wire [0:0] direct_interc_71_out;
wire [0:0] direct_interc_72_out;
wire [0:0] direct_interc_73_out;
wire [0:0] direct_interc_74_out;
wire [0:0] direct_interc_75_out;
wire [0:0] direct_interc_76_out;
wire [0:0] direct_interc_77_out;
wire [0:0] direct_interc_78_out;
wire [0:0] direct_interc_79_out;
wire [0:0] direct_interc_80_out;
wire [0:0] direct_interc_81_out;
wire [0:0] logical_tile_clb_mode_default__fle_0_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_0_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_0_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_0_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_1_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_1_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_1_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_1_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_2_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_2_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_2_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_2_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_3_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_3_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_3_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_3_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_4_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_4_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_4_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_4_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_5_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_5_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_5_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_5_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_6_ccff_tail;
wire [0:0] logical_tile_clb_mode_default__fle_6_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_6_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_6_fle_sc_out;
wire [0:0] logical_tile_clb_mode_default__fle_7_fle_cout;
wire [0:1] logical_tile_clb_mode_default__fle_7_fle_out;
wire [0:0] logical_tile_clb_mode_default__fle_7_fle_sc_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_0 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_18_out, direct_interc_19_out, direct_interc_20_out, direct_interc_21_out}),
		.fle_sc_in(direct_interc_22_out),
		.fle_cin(direct_interc_23_out),
		.fle_reset(direct_interc_24_out),
		.fle_clk(direct_interc_25_out),
		.ccff_head(ccff_head),
		.fle_out(logical_tile_clb_mode_default__fle_0_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_0_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_0_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_0_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_1 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_26_out, direct_interc_27_out, direct_interc_28_out, direct_interc_29_out}),
		.fle_sc_in(direct_interc_30_out),
		.fle_cin(direct_interc_31_out),
		.fle_reset(direct_interc_32_out),
		.fle_clk(direct_interc_33_out),
		.ccff_head(logical_tile_clb_mode_default__fle_0_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_1_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_1_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_1_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_1_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_2 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_34_out, direct_interc_35_out, direct_interc_36_out, direct_interc_37_out}),
		.fle_sc_in(direct_interc_38_out),
		.fle_cin(direct_interc_39_out),
		.fle_reset(direct_interc_40_out),
		.fle_clk(direct_interc_41_out),
		.ccff_head(logical_tile_clb_mode_default__fle_1_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_2_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_2_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_2_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_2_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_3 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_42_out, direct_interc_43_out, direct_interc_44_out, direct_interc_45_out}),
		.fle_sc_in(direct_interc_46_out),
		.fle_cin(direct_interc_47_out),
		.fle_reset(direct_interc_48_out),
		.fle_clk(direct_interc_49_out),
		.ccff_head(logical_tile_clb_mode_default__fle_2_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_3_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_3_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_3_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_3_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_4 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_50_out, direct_interc_51_out, direct_interc_52_out, direct_interc_53_out}),
		.fle_sc_in(direct_interc_54_out),
		.fle_cin(direct_interc_55_out),
		.fle_reset(direct_interc_56_out),
		.fle_clk(direct_interc_57_out),
		.ccff_head(logical_tile_clb_mode_default__fle_3_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_4_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_4_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_4_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_4_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_5 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_58_out, direct_interc_59_out, direct_interc_60_out, direct_interc_61_out}),
		.fle_sc_in(direct_interc_62_out),
		.fle_cin(direct_interc_63_out),
		.fle_reset(direct_interc_64_out),
		.fle_clk(direct_interc_65_out),
		.ccff_head(logical_tile_clb_mode_default__fle_4_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_5_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_5_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_5_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_5_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_6 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_66_out, direct_interc_67_out, direct_interc_68_out, direct_interc_69_out}),
		.fle_sc_in(direct_interc_70_out),
		.fle_cin(direct_interc_71_out),
		.fle_reset(direct_interc_72_out),
		.fle_clk(direct_interc_73_out),
		.ccff_head(logical_tile_clb_mode_default__fle_5_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_6_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_6_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_6_fle_cout),
		.ccff_tail(logical_tile_clb_mode_default__fle_6_ccff_tail));

	logical_tile_clb_mode_default__fle logical_tile_clb_mode_default__fle_7 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.fle_in({direct_interc_74_out, direct_interc_75_out, direct_interc_76_out, direct_interc_77_out}),
		.fle_sc_in(direct_interc_78_out),
		.fle_cin(direct_interc_79_out),
		.fle_reset(direct_interc_80_out),
		.fle_clk(direct_interc_81_out),
		.ccff_head(logical_tile_clb_mode_default__fle_6_ccff_tail),
		.fle_out(logical_tile_clb_mode_default__fle_7_fle_out[0:1]),
		.fle_sc_out(logical_tile_clb_mode_default__fle_7_fle_sc_out),
		.fle_cout(logical_tile_clb_mode_default__fle_7_fle_cout),
		.ccff_tail(ccff_tail));

	direct_interc direct_interc_0_ (
		.in(logical_tile_clb_mode_default__fle_0_fle_out[1]),
		.out(clb_O[0]));

	direct_interc direct_interc_1_ (
		.in(logical_tile_clb_mode_default__fle_0_fle_out[0]),
		.out(clb_O[1]));

	direct_interc direct_interc_2_ (
		.in(logical_tile_clb_mode_default__fle_1_fle_out[1]),
		.out(clb_O[2]));

	direct_interc direct_interc_3_ (
		.in(logical_tile_clb_mode_default__fle_1_fle_out[0]),
		.out(clb_O[3]));

	direct_interc direct_interc_4_ (
		.in(logical_tile_clb_mode_default__fle_2_fle_out[1]),
		.out(clb_O[4]));

	direct_interc direct_interc_5_ (
		.in(logical_tile_clb_mode_default__fle_2_fle_out[0]),
		.out(clb_O[5]));

	direct_interc direct_interc_6_ (
		.in(logical_tile_clb_mode_default__fle_3_fle_out[1]),
		.out(clb_O[6]));

	direct_interc direct_interc_7_ (
		.in(logical_tile_clb_mode_default__fle_3_fle_out[0]),
		.out(clb_O[7]));

	direct_interc direct_interc_8_ (
		.in(logical_tile_clb_mode_default__fle_4_fle_out[1]),
		.out(clb_O[8]));

	direct_interc direct_interc_9_ (
		.in(logical_tile_clb_mode_default__fle_4_fle_out[0]),
		.out(clb_O[9]));

	direct_interc direct_interc_10_ (
		.in(logical_tile_clb_mode_default__fle_5_fle_out[1]),
		.out(clb_O[10]));

	direct_interc direct_interc_11_ (
		.in(logical_tile_clb_mode_default__fle_5_fle_out[0]),
		.out(clb_O[11]));

	direct_interc direct_interc_12_ (
		.in(logical_tile_clb_mode_default__fle_6_fle_out[1]),
		.out(clb_O[12]));

	direct_interc direct_interc_13_ (
		.in(logical_tile_clb_mode_default__fle_6_fle_out[0]),
		.out(clb_O[13]));

	direct_interc direct_interc_14_ (
		.in(logical_tile_clb_mode_default__fle_7_fle_out[1]),
		.out(clb_O[14]));

	direct_interc direct_interc_15_ (
		.in(logical_tile_clb_mode_default__fle_7_fle_out[0]),
		.out(clb_O[15]));

	direct_interc direct_interc_16_ (
		.in(logical_tile_clb_mode_default__fle_7_fle_sc_out),
		.out(clb_sc_out));

	direct_interc direct_interc_17_ (
		.in(logical_tile_clb_mode_default__fle_7_fle_cout),
		.out(clb_cout));

	direct_interc direct_interc_18_ (
		.in(clb_I0[0]),
		.out(direct_interc_18_out));

	direct_interc direct_interc_19_ (
		.in(clb_I0[1]),
		.out(direct_interc_19_out));

	direct_interc direct_interc_20_ (
		.in(clb_I0i[0]),
		.out(direct_interc_20_out));

	direct_interc direct_interc_21_ (
		.in(clb_I0i[1]),
		.out(direct_interc_21_out));

	direct_interc direct_interc_22_ (
		.in(clb_sc_in),
		.out(direct_interc_22_out));

	direct_interc direct_interc_23_ (
		.in(clb_cin),
		.out(direct_interc_23_out));

	direct_interc direct_interc_24_ (
		.in(clb_reset),
		.out(direct_interc_24_out));

	direct_interc direct_interc_25_ (
		.in(clb_clk),
		.out(direct_interc_25_out));

	direct_interc direct_interc_26_ (
		.in(clb_I1[0]),
		.out(direct_interc_26_out));

	direct_interc direct_interc_27_ (
		.in(clb_I1[1]),
		.out(direct_interc_27_out));

	direct_interc direct_interc_28_ (
		.in(clb_I1i[0]),
		.out(direct_interc_28_out));

	direct_interc direct_interc_29_ (
		.in(clb_I1i[1]),
		.out(direct_interc_29_out));

	direct_interc direct_interc_30_ (
		.in(logical_tile_clb_mode_default__fle_0_fle_sc_out),
		.out(direct_interc_30_out));

	direct_interc direct_interc_31_ (
		.in(logical_tile_clb_mode_default__fle_0_fle_cout),
		.out(direct_interc_31_out));

	direct_interc direct_interc_32_ (
		.in(clb_reset),
		.out(direct_interc_32_out));

	direct_interc direct_interc_33_ (
		.in(clb_clk),
		.out(direct_interc_33_out));

	direct_interc direct_interc_34_ (
		.in(clb_I2[0]),
		.out(direct_interc_34_out));

	direct_interc direct_interc_35_ (
		.in(clb_I2[1]),
		.out(direct_interc_35_out));

	direct_interc direct_interc_36_ (
		.in(clb_I2i[0]),
		.out(direct_interc_36_out));

	direct_interc direct_interc_37_ (
		.in(clb_I2i[1]),
		.out(direct_interc_37_out));

	direct_interc direct_interc_38_ (
		.in(logical_tile_clb_mode_default__fle_1_fle_sc_out),
		.out(direct_interc_38_out));

	direct_interc direct_interc_39_ (
		.in(logical_tile_clb_mode_default__fle_1_fle_cout),
		.out(direct_interc_39_out));

	direct_interc direct_interc_40_ (
		.in(clb_reset),
		.out(direct_interc_40_out));

	direct_interc direct_interc_41_ (
		.in(clb_clk),
		.out(direct_interc_41_out));

	direct_interc direct_interc_42_ (
		.in(clb_I3[0]),
		.out(direct_interc_42_out));

	direct_interc direct_interc_43_ (
		.in(clb_I3[1]),
		.out(direct_interc_43_out));

	direct_interc direct_interc_44_ (
		.in(clb_I3i[0]),
		.out(direct_interc_44_out));

	direct_interc direct_interc_45_ (
		.in(clb_I3i[1]),
		.out(direct_interc_45_out));

	direct_interc direct_interc_46_ (
		.in(logical_tile_clb_mode_default__fle_2_fle_sc_out),
		.out(direct_interc_46_out));

	direct_interc direct_interc_47_ (
		.in(logical_tile_clb_mode_default__fle_2_fle_cout),
		.out(direct_interc_47_out));

	direct_interc direct_interc_48_ (
		.in(clb_reset),
		.out(direct_interc_48_out));

	direct_interc direct_interc_49_ (
		.in(clb_clk),
		.out(direct_interc_49_out));

	direct_interc direct_interc_50_ (
		.in(clb_I4[0]),
		.out(direct_interc_50_out));

	direct_interc direct_interc_51_ (
		.in(clb_I4[1]),
		.out(direct_interc_51_out));

	direct_interc direct_interc_52_ (
		.in(clb_I4i[0]),
		.out(direct_interc_52_out));

	direct_interc direct_interc_53_ (
		.in(clb_I4i[1]),
		.out(direct_interc_53_out));

	direct_interc direct_interc_54_ (
		.in(logical_tile_clb_mode_default__fle_3_fle_sc_out),
		.out(direct_interc_54_out));

	direct_interc direct_interc_55_ (
		.in(logical_tile_clb_mode_default__fle_3_fle_cout),
		.out(direct_interc_55_out));

	direct_interc direct_interc_56_ (
		.in(clb_reset),
		.out(direct_interc_56_out));

	direct_interc direct_interc_57_ (
		.in(clb_clk),
		.out(direct_interc_57_out));

	direct_interc direct_interc_58_ (
		.in(clb_I5[0]),
		.out(direct_interc_58_out));

	direct_interc direct_interc_59_ (
		.in(clb_I5[1]),
		.out(direct_interc_59_out));

	direct_interc direct_interc_60_ (
		.in(clb_I5i[0]),
		.out(direct_interc_60_out));

	direct_interc direct_interc_61_ (
		.in(clb_I5i[1]),
		.out(direct_interc_61_out));

	direct_interc direct_interc_62_ (
		.in(logical_tile_clb_mode_default__fle_4_fle_sc_out),
		.out(direct_interc_62_out));

	direct_interc direct_interc_63_ (
		.in(logical_tile_clb_mode_default__fle_4_fle_cout),
		.out(direct_interc_63_out));

	direct_interc direct_interc_64_ (
		.in(clb_reset),
		.out(direct_interc_64_out));

	direct_interc direct_interc_65_ (
		.in(clb_clk),
		.out(direct_interc_65_out));

	direct_interc direct_interc_66_ (
		.in(clb_I6[0]),
		.out(direct_interc_66_out));

	direct_interc direct_interc_67_ (
		.in(clb_I6[1]),
		.out(direct_interc_67_out));

	direct_interc direct_interc_68_ (
		.in(clb_I6i[0]),
		.out(direct_interc_68_out));

	direct_interc direct_interc_69_ (
		.in(clb_I6i[1]),
		.out(direct_interc_69_out));

	direct_interc direct_interc_70_ (
		.in(logical_tile_clb_mode_default__fle_5_fle_sc_out),
		.out(direct_interc_70_out));

	direct_interc direct_interc_71_ (
		.in(logical_tile_clb_mode_default__fle_5_fle_cout),
		.out(direct_interc_71_out));

	direct_interc direct_interc_72_ (
		.in(clb_reset),
		.out(direct_interc_72_out));

	direct_interc direct_interc_73_ (
		.in(clb_clk),
		.out(direct_interc_73_out));

	direct_interc direct_interc_74_ (
		.in(clb_I7[0]),
		.out(direct_interc_74_out));

	direct_interc direct_interc_75_ (
		.in(clb_I7[1]),
		.out(direct_interc_75_out));

	direct_interc direct_interc_76_ (
		.in(clb_I7i[0]),
		.out(direct_interc_76_out));

	direct_interc direct_interc_77_ (
		.in(clb_I7i[1]),
		.out(direct_interc_77_out));

	direct_interc direct_interc_78_ (
		.in(logical_tile_clb_mode_default__fle_6_fle_sc_out),
		.out(direct_interc_78_out));

	direct_interc direct_interc_79_ (
		.in(logical_tile_clb_mode_default__fle_6_fle_cout),
		.out(direct_interc_79_out));

	direct_interc direct_interc_80_ (
		.in(clb_reset),
		.out(direct_interc_80_out));

	direct_interc direct_interc_81_ (
		.in(clb_clk),
		.out(direct_interc_81_out));

endmodule
// ----- END Verilog module for logical_tile_clb_mode_clb_ -----

//----- Default net type -----
`default_nettype none



// ----- END Physical programmable logic block Verilog module: clb -----
