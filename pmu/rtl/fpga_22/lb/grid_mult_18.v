//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for physical tile: mult_18]
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Grid Verilog module: grid_mult_18 -----
//----- Default net type -----
`default_nettype none

// ----- Verilog module for grid_mult_18 -----
module grid_mult_18(config_readback,
                    config_enable,
                    pReset,
                    prog_clk,
                    top_width_0_height_1_subtile_0__pin_a_0_,
                    top_width_0_height_1_subtile_0__pin_a_1_,
                    top_width_0_height_1_subtile_0__pin_a_2_,
                    top_width_0_height_1_subtile_0__pin_a_3_,
                    top_width_0_height_1_subtile_0__pin_a_4_,
                    top_width_0_height_1_subtile_0__pin_a_5_,
                    top_width_0_height_1_subtile_0__pin_a_6_,
                    top_width_0_height_1_subtile_0__pin_a_7_,
                    top_width_0_height_1_subtile_0__pin_b_0_,
                    top_width_0_height_1_subtile_0__pin_b_1_,
                    top_width_0_height_1_subtile_0__pin_b_2_,
                    top_width_0_height_1_subtile_0__pin_b_3_,
                    top_width_0_height_1_subtile_0__pin_b_4_,
                    top_width_0_height_1_subtile_0__pin_b_5_,
                    top_width_0_height_1_subtile_0__pin_b_6_,
                    top_width_0_height_1_subtile_0__pin_b_7_,
                    right_width_0_height_0_subtile_0__pin_a_13_,
                    right_width_0_height_0_subtile_0__pin_a_14_,
                    right_width_0_height_0_subtile_0__pin_a_15_,
                    right_width_0_height_0_subtile_0__pin_a_16_,
                    right_width_0_height_0_subtile_0__pin_a_17_,
                    right_width_0_height_0_subtile_0__pin_b_13_,
                    right_width_0_height_0_subtile_0__pin_b_14_,
                    right_width_0_height_0_subtile_0__pin_b_15_,
                    right_width_0_height_0_subtile_0__pin_b_16_,
                    right_width_0_height_0_subtile_0__pin_b_17_,
                    right_width_0_height_1_subtile_0__pin_a_8_,
                    right_width_0_height_1_subtile_0__pin_a_9_,
                    right_width_0_height_1_subtile_0__pin_a_10_,
                    right_width_0_height_1_subtile_0__pin_a_11_,
                    right_width_0_height_1_subtile_0__pin_a_12_,
                    right_width_0_height_1_subtile_0__pin_b_8_,
                    right_width_0_height_1_subtile_0__pin_b_9_,
                    right_width_0_height_1_subtile_0__pin_b_10_,
                    right_width_0_height_1_subtile_0__pin_b_11_,
                    right_width_0_height_1_subtile_0__pin_b_12_,
                    ccff_head,
                    top_width_0_height_1_subtile_0__pin_out_0_upper,
                    top_width_0_height_1_subtile_0__pin_out_0_lower,
                    top_width_0_height_1_subtile_0__pin_out_1_upper,
                    top_width_0_height_1_subtile_0__pin_out_1_lower,
                    top_width_0_height_1_subtile_0__pin_out_2_upper,
                    top_width_0_height_1_subtile_0__pin_out_2_lower,
                    top_width_0_height_1_subtile_0__pin_out_3_upper,
                    top_width_0_height_1_subtile_0__pin_out_3_lower,
                    top_width_0_height_1_subtile_0__pin_out_4_upper,
                    top_width_0_height_1_subtile_0__pin_out_4_lower,
                    top_width_0_height_1_subtile_0__pin_out_5_upper,
                    top_width_0_height_1_subtile_0__pin_out_5_lower,
                    top_width_0_height_1_subtile_0__pin_out_6_upper,
                    top_width_0_height_1_subtile_0__pin_out_6_lower,
                    top_width_0_height_1_subtile_0__pin_out_7_upper,
                    top_width_0_height_1_subtile_0__pin_out_7_lower,
                    right_width_0_height_0_subtile_0__pin_out_22_upper,
                    right_width_0_height_0_subtile_0__pin_out_22_lower,
                    right_width_0_height_0_subtile_0__pin_out_23_upper,
                    right_width_0_height_0_subtile_0__pin_out_23_lower,
                    right_width_0_height_0_subtile_0__pin_out_24_upper,
                    right_width_0_height_0_subtile_0__pin_out_24_lower,
                    right_width_0_height_0_subtile_0__pin_out_25_upper,
                    right_width_0_height_0_subtile_0__pin_out_25_lower,
                    right_width_0_height_0_subtile_0__pin_out_26_upper,
                    right_width_0_height_0_subtile_0__pin_out_26_lower,
                    right_width_0_height_0_subtile_0__pin_out_27_upper,
                    right_width_0_height_0_subtile_0__pin_out_27_lower,
                    right_width_0_height_0_subtile_0__pin_out_28_upper,
                    right_width_0_height_0_subtile_0__pin_out_28_lower,
                    right_width_0_height_0_subtile_0__pin_out_29_upper,
                    right_width_0_height_0_subtile_0__pin_out_29_lower,
                    right_width_0_height_0_subtile_0__pin_out_30_upper,
                    right_width_0_height_0_subtile_0__pin_out_30_lower,
                    right_width_0_height_0_subtile_0__pin_out_31_upper,
                    right_width_0_height_0_subtile_0__pin_out_31_lower,
                    right_width_0_height_0_subtile_0__pin_out_32_upper,
                    right_width_0_height_0_subtile_0__pin_out_32_lower,
                    right_width_0_height_0_subtile_0__pin_out_33_upper,
                    right_width_0_height_0_subtile_0__pin_out_33_lower,
                    right_width_0_height_0_subtile_0__pin_out_34_upper,
                    right_width_0_height_0_subtile_0__pin_out_34_lower,
                    right_width_0_height_0_subtile_0__pin_out_35_upper,
                    right_width_0_height_0_subtile_0__pin_out_35_lower,
                    right_width_0_height_1_subtile_0__pin_out_8_upper,
                    right_width_0_height_1_subtile_0__pin_out_8_lower,
                    right_width_0_height_1_subtile_0__pin_out_9_upper,
                    right_width_0_height_1_subtile_0__pin_out_9_lower,
                    right_width_0_height_1_subtile_0__pin_out_10_upper,
                    right_width_0_height_1_subtile_0__pin_out_10_lower,
                    right_width_0_height_1_subtile_0__pin_out_11_upper,
                    right_width_0_height_1_subtile_0__pin_out_11_lower,
                    right_width_0_height_1_subtile_0__pin_out_12_upper,
                    right_width_0_height_1_subtile_0__pin_out_12_lower,
                    right_width_0_height_1_subtile_0__pin_out_13_upper,
                    right_width_0_height_1_subtile_0__pin_out_13_lower,
                    right_width_0_height_1_subtile_0__pin_out_14_upper,
                    right_width_0_height_1_subtile_0__pin_out_14_lower,
                    right_width_0_height_1_subtile_0__pin_out_15_upper,
                    right_width_0_height_1_subtile_0__pin_out_15_lower,
                    right_width_0_height_1_subtile_0__pin_out_16_upper,
                    right_width_0_height_1_subtile_0__pin_out_16_lower,
                    right_width_0_height_1_subtile_0__pin_out_17_upper,
                    right_width_0_height_1_subtile_0__pin_out_17_lower,
                    right_width_0_height_1_subtile_0__pin_out_18_upper,
                    right_width_0_height_1_subtile_0__pin_out_18_lower,
                    right_width_0_height_1_subtile_0__pin_out_19_upper,
                    right_width_0_height_1_subtile_0__pin_out_19_lower,
                    right_width_0_height_1_subtile_0__pin_out_20_upper,
                    right_width_0_height_1_subtile_0__pin_out_20_lower,
                    right_width_0_height_1_subtile_0__pin_out_21_upper,
                    right_width_0_height_1_subtile_0__pin_out_21_lower,
                    ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_0_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_1_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_2_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_3_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_4_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_5_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_6_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_a_7_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_0_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_1_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_2_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_3_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_4_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_5_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_6_;
//----- INPUT PORTS -----
input [0:0] top_width_0_height_1_subtile_0__pin_b_7_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_a_13_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_a_14_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_a_15_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_a_16_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_a_17_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_b_13_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_b_14_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_b_15_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_b_16_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_b_17_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_a_8_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_a_9_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_a_10_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_a_11_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_a_12_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_b_8_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_b_9_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_b_10_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_b_11_;
//----- INPUT PORTS -----
input [0:0] right_width_0_height_1_subtile_0__pin_b_12_;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_0_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_0_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_1_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_1_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_2_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_2_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_3_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_3_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_4_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_4_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_5_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_5_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_6_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_6_lower;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_7_upper;
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_1_subtile_0__pin_out_7_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_22_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_22_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_23_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_23_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_24_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_24_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_25_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_25_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_26_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_26_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_27_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_27_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_28_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_28_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_29_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_29_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_30_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_30_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_31_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_31_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_32_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_32_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_33_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_33_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_34_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_34_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_35_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_out_35_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_8_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_8_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_9_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_9_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_10_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_10_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_11_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_11_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_12_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_12_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_13_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_13_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_14_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_14_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_15_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_15_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_16_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_16_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_17_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_17_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_18_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_18_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_19_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_19_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_20_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_20_lower;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_21_upper;
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_1_subtile_0__pin_out_21_lower;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign top_width_0_height_1_subtile_0__pin_out_0_lower[0] = top_width_0_height_1_subtile_0__pin_out_0_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_1_lower[0] = top_width_0_height_1_subtile_0__pin_out_1_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_2_lower[0] = top_width_0_height_1_subtile_0__pin_out_2_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_3_lower[0] = top_width_0_height_1_subtile_0__pin_out_3_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_4_lower[0] = top_width_0_height_1_subtile_0__pin_out_4_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_5_lower[0] = top_width_0_height_1_subtile_0__pin_out_5_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_6_lower[0] = top_width_0_height_1_subtile_0__pin_out_6_upper[0];
	assign top_width_0_height_1_subtile_0__pin_out_7_lower[0] = top_width_0_height_1_subtile_0__pin_out_7_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_8_lower[0] = right_width_0_height_1_subtile_0__pin_out_8_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_9_lower[0] = right_width_0_height_1_subtile_0__pin_out_9_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_10_lower[0] = right_width_0_height_1_subtile_0__pin_out_10_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_11_lower[0] = right_width_0_height_1_subtile_0__pin_out_11_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_12_lower[0] = right_width_0_height_1_subtile_0__pin_out_12_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_13_lower[0] = right_width_0_height_1_subtile_0__pin_out_13_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_14_lower[0] = right_width_0_height_1_subtile_0__pin_out_14_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_15_lower[0] = right_width_0_height_1_subtile_0__pin_out_15_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_16_lower[0] = right_width_0_height_1_subtile_0__pin_out_16_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_17_lower[0] = right_width_0_height_1_subtile_0__pin_out_17_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_18_lower[0] = right_width_0_height_1_subtile_0__pin_out_18_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_19_lower[0] = right_width_0_height_1_subtile_0__pin_out_19_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_20_lower[0] = right_width_0_height_1_subtile_0__pin_out_20_upper[0];
	assign right_width_0_height_1_subtile_0__pin_out_21_lower[0] = right_width_0_height_1_subtile_0__pin_out_21_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_22_lower[0] = right_width_0_height_0_subtile_0__pin_out_22_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_23_lower[0] = right_width_0_height_0_subtile_0__pin_out_23_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_24_lower[0] = right_width_0_height_0_subtile_0__pin_out_24_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_25_lower[0] = right_width_0_height_0_subtile_0__pin_out_25_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_26_lower[0] = right_width_0_height_0_subtile_0__pin_out_26_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_27_lower[0] = right_width_0_height_0_subtile_0__pin_out_27_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_28_lower[0] = right_width_0_height_0_subtile_0__pin_out_28_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_29_lower[0] = right_width_0_height_0_subtile_0__pin_out_29_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_30_lower[0] = right_width_0_height_0_subtile_0__pin_out_30_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_31_lower[0] = right_width_0_height_0_subtile_0__pin_out_31_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_32_lower[0] = right_width_0_height_0_subtile_0__pin_out_32_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_33_lower[0] = right_width_0_height_0_subtile_0__pin_out_33_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_34_lower[0] = right_width_0_height_0_subtile_0__pin_out_34_upper[0];
	assign right_width_0_height_0_subtile_0__pin_out_35_lower[0] = right_width_0_height_0_subtile_0__pin_out_35_upper[0];
// ----- END Local output short connections -----

	logical_tile_mult_18_mode_mult_18_ logical_tile_mult_18_mode_mult_18__0 (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.mult_18_a({top_width_0_height_1_subtile_0__pin_a_0_, top_width_0_height_1_subtile_0__pin_a_1_, top_width_0_height_1_subtile_0__pin_a_2_, top_width_0_height_1_subtile_0__pin_a_3_, top_width_0_height_1_subtile_0__pin_a_4_, top_width_0_height_1_subtile_0__pin_a_5_, top_width_0_height_1_subtile_0__pin_a_6_, top_width_0_height_1_subtile_0__pin_a_7_, right_width_0_height_1_subtile_0__pin_a_8_, right_width_0_height_1_subtile_0__pin_a_9_, right_width_0_height_1_subtile_0__pin_a_10_, right_width_0_height_1_subtile_0__pin_a_11_, right_width_0_height_1_subtile_0__pin_a_12_, right_width_0_height_0_subtile_0__pin_a_13_, right_width_0_height_0_subtile_0__pin_a_14_, right_width_0_height_0_subtile_0__pin_a_15_, right_width_0_height_0_subtile_0__pin_a_16_, right_width_0_height_0_subtile_0__pin_a_17_}),
		.mult_18_b({top_width_0_height_1_subtile_0__pin_b_0_, top_width_0_height_1_subtile_0__pin_b_1_, top_width_0_height_1_subtile_0__pin_b_2_, top_width_0_height_1_subtile_0__pin_b_3_, top_width_0_height_1_subtile_0__pin_b_4_, top_width_0_height_1_subtile_0__pin_b_5_, top_width_0_height_1_subtile_0__pin_b_6_, top_width_0_height_1_subtile_0__pin_b_7_, right_width_0_height_1_subtile_0__pin_b_8_, right_width_0_height_1_subtile_0__pin_b_9_, right_width_0_height_1_subtile_0__pin_b_10_, right_width_0_height_1_subtile_0__pin_b_11_, right_width_0_height_1_subtile_0__pin_b_12_, right_width_0_height_0_subtile_0__pin_b_13_, right_width_0_height_0_subtile_0__pin_b_14_, right_width_0_height_0_subtile_0__pin_b_15_, right_width_0_height_0_subtile_0__pin_b_16_, right_width_0_height_0_subtile_0__pin_b_17_}),
		.ccff_head(ccff_head),
		.mult_18_out({top_width_0_height_1_subtile_0__pin_out_0_upper, top_width_0_height_1_subtile_0__pin_out_1_upper, top_width_0_height_1_subtile_0__pin_out_2_upper, top_width_0_height_1_subtile_0__pin_out_3_upper, top_width_0_height_1_subtile_0__pin_out_4_upper, top_width_0_height_1_subtile_0__pin_out_5_upper, top_width_0_height_1_subtile_0__pin_out_6_upper, top_width_0_height_1_subtile_0__pin_out_7_upper, right_width_0_height_1_subtile_0__pin_out_8_upper, right_width_0_height_1_subtile_0__pin_out_9_upper, right_width_0_height_1_subtile_0__pin_out_10_upper, right_width_0_height_1_subtile_0__pin_out_11_upper, right_width_0_height_1_subtile_0__pin_out_12_upper, right_width_0_height_1_subtile_0__pin_out_13_upper, right_width_0_height_1_subtile_0__pin_out_14_upper, right_width_0_height_1_subtile_0__pin_out_15_upper, right_width_0_height_1_subtile_0__pin_out_16_upper, right_width_0_height_1_subtile_0__pin_out_17_upper, right_width_0_height_1_subtile_0__pin_out_18_upper, right_width_0_height_1_subtile_0__pin_out_19_upper, right_width_0_height_1_subtile_0__pin_out_20_upper, right_width_0_height_1_subtile_0__pin_out_21_upper, right_width_0_height_0_subtile_0__pin_out_22_upper, right_width_0_height_0_subtile_0__pin_out_23_upper, right_width_0_height_0_subtile_0__pin_out_24_upper, right_width_0_height_0_subtile_0__pin_out_25_upper, right_width_0_height_0_subtile_0__pin_out_26_upper, right_width_0_height_0_subtile_0__pin_out_27_upper, right_width_0_height_0_subtile_0__pin_out_28_upper, right_width_0_height_0_subtile_0__pin_out_29_upper, right_width_0_height_0_subtile_0__pin_out_30_upper, right_width_0_height_0_subtile_0__pin_out_31_upper, right_width_0_height_0_subtile_0__pin_out_32_upper, right_width_0_height_0_subtile_0__pin_out_33_upper, right_width_0_height_0_subtile_0__pin_out_34_upper, right_width_0_height_0_subtile_0__pin_out_35_upper}),
		.ccff_tail(ccff_tail));

endmodule
// ----- END Verilog module for grid_mult_18 -----

//----- Default net type -----
`default_nettype none



// ----- END Grid Verilog module: grid_mult_18 -----

