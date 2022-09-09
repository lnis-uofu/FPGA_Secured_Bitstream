//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Top-level Verilog module for FPGA
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for fpga_top -----
module fpga_top(clk,
                reset,
                config_enable,
                pReset,
                prog_clk,
                Test_en,
                IO_ISOL_N,
                gfpga_pad_sofa_plus_io_SOC_IN,
                gfpga_pad_sofa_plus_io_SOC_OUT,
                gfpga_pad_sofa_plus_io_SOC_DIR,
                ccff_head,
                ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] clk;
//----- GLOBAL PORTS -----
input [0:0] reset;
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- GLOBAL PORTS -----
input [0:0] Test_en;
//----- GLOBAL PORTS -----
input [0:0] IO_ISOL_N;
//----- GPIN PORTS -----
input [0:23] gfpga_pad_sofa_plus_io_SOC_IN;
//----- GPOUT PORTS -----
output [0:23] gfpga_pad_sofa_plus_io_SOC_OUT;
//----- GPOUT PORTS -----
output [0:23] gfpga_pad_sofa_plus_io_SOC_DIR;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_;
wire [0:0] cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_;
wire [0:0] cbx_1__0__0_ccff_tail;
wire [0:11] cbx_1__0__0_chanx_left_out;
wire [0:11] cbx_1__0__0_chanx_right_out;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_;
wire [0:0] cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_;
wire [0:0] cbx_1__0__1_ccff_tail;
wire [0:11] cbx_1__0__1_chanx_left_out;
wire [0:11] cbx_1__0__1_chanx_right_out;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_;
wire [0:0] cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_;
wire [0:0] cbx_1__0__2_ccff_tail;
wire [0:11] cbx_1__0__2_chanx_left_out;
wire [0:11] cbx_1__0__2_chanx_right_out;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_;
wire [0:0] cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_;
wire [0:0] cbx_1__0__3_ccff_tail;
wire [0:11] cbx_1__0__3_chanx_left_out;
wire [0:11] cbx_1__0__3_chanx_right_out;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_;
wire [0:0] cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_;
wire [0:0] cbx_1__2__0_ccff_tail;
wire [0:11] cbx_1__2__0_chanx_left_out;
wire [0:11] cbx_1__2__0_chanx_right_out;
wire [0:0] cbx_1__2__0_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_;
wire [0:0] cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_;
wire [0:0] cbx_1__2__1_ccff_tail;
wire [0:11] cbx_1__2__1_chanx_left_out;
wire [0:11] cbx_1__2__1_chanx_right_out;
wire [0:0] cbx_1__2__1_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cby_0__1__0_ccff_tail;
wire [0:11] cby_0__1__0_chany_bottom_out;
wire [0:11] cby_0__1__0_chany_top_out;
wire [0:0] cby_0__1__0_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cby_0__1__1_ccff_tail;
wire [0:11] cby_0__1__1_chany_bottom_out;
wire [0:11] cby_0__1__1_chany_top_out;
wire [0:0] cby_0__1__1_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cby_1__1__0_ccff_tail;
wire [0:11] cby_1__1__0_chany_bottom_out;
wire [0:11] cby_1__1__0_chany_top_out;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_;
wire [0:0] cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_;
wire [0:0] cby_1__1__1_ccff_tail;
wire [0:11] cby_1__1__1_chany_bottom_out;
wire [0:11] cby_1__1__1_chany_top_out;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_;
wire [0:0] cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_;
wire [0:0] cby_2__1__0_ccff_tail;
wire [0:11] cby_2__1__0_chany_bottom_out;
wire [0:11] cby_2__1__0_chany_top_out;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_;
wire [0:0] cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_;
wire [0:0] cby_2__1__0_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] cby_2__1__1_ccff_tail;
wire [0:11] cby_2__1__1_chany_bottom_out;
wire [0:11] cby_2__1__1_chany_top_out;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_;
wire [0:0] cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_;
wire [0:0] cby_2__1__1_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_;
wire [0:0] direct_interc_0_out;
wire [0:0] direct_interc_1_out;
wire [0:0] direct_interc_2_out;
wire [0:0] direct_interc_3_out;
wire [0:0] direct_interc_4_out;
wire [0:0] grid_clb_0_bottom_width_0_height_0_subtile_0__pin_sc_out_0_;
wire [0:0] grid_clb_0_ccff_tail;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_upper;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_upper;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_upper;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_upper;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_upper;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_lower;
wire [0:0] grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_upper;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_lower;
wire [0:0] grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_upper;
wire [0:0] grid_clb_1__1__undriven_bottom_width_0_height_0_subtile_0__pin_cout_0_;
wire [0:0] grid_clb_1__2__undriven_top_width_0_height_0_subtile_0__pin_cin_0_;
wire [0:0] grid_clb_1__2__undriven_top_width_0_height_0_subtile_0__pin_sc_in_0_;
wire [0:0] grid_clb_1_bottom_width_0_height_0_subtile_0__pin_cout_0_;
wire [0:0] grid_clb_1_bottom_width_0_height_0_subtile_0__pin_sc_out_0_;
wire [0:0] grid_clb_1_ccff_tail;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_upper;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_upper;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_upper;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_upper;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_upper;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_lower;
wire [0:0] grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_upper;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_lower;
wire [0:0] grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_upper;
wire [0:0] grid_clb_2__1__undriven_bottom_width_0_height_0_subtile_0__pin_cout_0_;
wire [0:0] grid_clb_2__1__undriven_bottom_width_0_height_0_subtile_0__pin_sc_out_0_;
wire [0:0] grid_clb_2__2__undriven_top_width_0_height_0_subtile_0__pin_cin_0_;
wire [0:0] grid_clb_2_ccff_tail;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_upper;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_upper;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_upper;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_upper;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_upper;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_lower;
wire [0:0] grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_upper;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_lower;
wire [0:0] grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_upper;
wire [0:0] grid_clb_3_bottom_width_0_height_0_subtile_0__pin_cout_0_;
wire [0:0] grid_clb_3_bottom_width_0_height_0_subtile_0__pin_sc_out_0_;
wire [0:0] grid_clb_3_ccff_tail;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_upper;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_upper;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_upper;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_upper;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_upper;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_lower;
wire [0:0] grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_upper;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_lower;
wire [0:0] grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_upper;
wire [0:0] grid_io_bottom_bottom_0_ccff_tail;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_ccff_tail;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_upper;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_lower;
wire [0:0] grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_upper;
wire [0:0] grid_io_left_left_0_ccff_tail;
wire [0:0] grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_left_left_1_ccff_tail;
wire [0:0] grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_right_right_0_ccff_tail;
wire [0:0] grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_right_right_1_ccff_tail;
wire [0:0] grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_top_top_0_ccff_tail;
wire [0:0] grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower;
wire [0:0] grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper;
wire [0:0] grid_io_top_top_1_ccff_tail;
wire [0:11] sb_0__0__0_chanx_right_out;
wire [0:11] sb_0__0__0_chany_top_out;
wire [0:0] sb_0__1__0_ccff_tail;
wire [0:11] sb_0__1__0_chanx_right_out;
wire [0:11] sb_0__1__0_chany_bottom_out;
wire [0:11] sb_0__1__0_chany_top_out;
wire [0:0] sb_0__2__0_ccff_tail;
wire [0:11] sb_0__2__0_chanx_right_out;
wire [0:11] sb_0__2__0_chany_bottom_out;
wire [0:0] sb_1__0__0_ccff_tail;
wire [0:11] sb_1__0__0_chanx_left_out;
wire [0:11] sb_1__0__0_chanx_right_out;
wire [0:11] sb_1__0__0_chany_top_out;
wire [0:0] sb_1__1__0_ccff_tail;
wire [0:11] sb_1__1__0_chanx_left_out;
wire [0:11] sb_1__1__0_chanx_right_out;
wire [0:11] sb_1__1__0_chany_bottom_out;
wire [0:11] sb_1__1__0_chany_top_out;
wire [0:0] sb_1__2__0_ccff_tail;
wire [0:11] sb_1__2__0_chanx_left_out;
wire [0:11] sb_1__2__0_chanx_right_out;
wire [0:11] sb_1__2__0_chany_bottom_out;
wire [0:0] sb_2__0__0_ccff_tail;
wire [0:11] sb_2__0__0_chanx_left_out;
wire [0:11] sb_2__0__0_chany_top_out;
wire [0:0] sb_2__1__0_ccff_tail;
wire [0:11] sb_2__1__0_chanx_left_out;
wire [0:11] sb_2__1__0_chany_bottom_out;
wire [0:11] sb_2__1__0_chany_top_out;
wire [0:0] sb_2__2__0_ccff_tail;
wire [0:11] sb_2__2__0_chanx_left_out;
wire [0:11] sb_2__2__0_chany_bottom_out;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	grid_clb grid_clb_1__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_sc_in_0_(direct_interc_2_out),
		.top_width_0_height_0_subtile_0__pin_cin_0_(direct_interc_0_out),
		.right_width_0_height_0_subtile_0__pin_I_9_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.right_width_0_height_0_subtile_0__pin_I_10_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.right_width_0_height_0_subtile_0__pin_I_11_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.right_width_0_height_0_subtile_0__pin_I_12_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.right_width_0_height_0_subtile_0__pin_I_13_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.right_width_0_height_0_subtile_0__pin_I_14_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.right_width_0_height_0_subtile_0__pin_I_15_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.right_width_0_height_0_subtile_0__pin_I_16_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.right_width_0_height_0_subtile_0__pin_I_17_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.left_width_0_height_0_subtile_0__pin_reset_0_(reset),
		.left_width_0_height_0_subtile_0__pin_clk_0_(clk),
		.ccff_head(grid_io_left_left_0_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_O_0_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.top_width_0_height_0_subtile_0__pin_O_0_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.top_width_0_height_0_subtile_0__pin_O_1_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.top_width_0_height_0_subtile_0__pin_O_1_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.top_width_0_height_0_subtile_0__pin_O_2_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.top_width_0_height_0_subtile_0__pin_O_2_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.top_width_0_height_0_subtile_0__pin_O_3_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.top_width_0_height_0_subtile_0__pin_O_3_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.top_width_0_height_0_subtile_0__pin_O_4_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.top_width_0_height_0_subtile_0__pin_O_4_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.top_width_0_height_0_subtile_0__pin_O_5_upper(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.top_width_0_height_0_subtile_0__pin_O_5_lower(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.right_width_0_height_0_subtile_0__pin_O_6_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.right_width_0_height_0_subtile_0__pin_O_6_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.right_width_0_height_0_subtile_0__pin_O_7_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.right_width_0_height_0_subtile_0__pin_O_7_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.right_width_0_height_0_subtile_0__pin_O_8_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.right_width_0_height_0_subtile_0__pin_O_8_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.right_width_0_height_0_subtile_0__pin_O_9_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.right_width_0_height_0_subtile_0__pin_O_9_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.right_width_0_height_0_subtile_0__pin_O_10_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.right_width_0_height_0_subtile_0__pin_O_10_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.right_width_0_height_0_subtile_0__pin_O_11_upper(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.right_width_0_height_0_subtile_0__pin_O_11_lower(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.bottom_width_0_height_0_subtile_0__pin_sc_out_0_(grid_clb_0_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.bottom_width_0_height_0_subtile_0__pin_cout_0_(grid_clb_1__1__undriven_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.ccff_tail(grid_clb_0_ccff_tail));

	grid_clb grid_clb_1__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_),
		.top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_),
		.top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_),
		.top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_),
		.top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_),
		.top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_),
		.top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_),
		.top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_),
		.top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_),
		.top_width_0_height_0_subtile_0__pin_sc_in_0_(grid_clb_1__2__undriven_top_width_0_height_0_subtile_0__pin_sc_in_0_),
		.top_width_0_height_0_subtile_0__pin_cin_0_(grid_clb_1__2__undriven_top_width_0_height_0_subtile_0__pin_cin_0_),
		.right_width_0_height_0_subtile_0__pin_I_9_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.right_width_0_height_0_subtile_0__pin_I_10_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.right_width_0_height_0_subtile_0__pin_I_11_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.right_width_0_height_0_subtile_0__pin_I_12_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.right_width_0_height_0_subtile_0__pin_I_13_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.right_width_0_height_0_subtile_0__pin_I_14_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.right_width_0_height_0_subtile_0__pin_I_15_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.right_width_0_height_0_subtile_0__pin_I_16_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.right_width_0_height_0_subtile_0__pin_I_17_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.left_width_0_height_0_subtile_0__pin_reset_0_(reset),
		.left_width_0_height_0_subtile_0__pin_clk_0_(clk),
		.ccff_head(grid_io_left_left_1_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_O_0_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.top_width_0_height_0_subtile_0__pin_O_0_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.top_width_0_height_0_subtile_0__pin_O_1_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.top_width_0_height_0_subtile_0__pin_O_1_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.top_width_0_height_0_subtile_0__pin_O_2_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.top_width_0_height_0_subtile_0__pin_O_2_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.top_width_0_height_0_subtile_0__pin_O_3_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.top_width_0_height_0_subtile_0__pin_O_3_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.top_width_0_height_0_subtile_0__pin_O_4_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.top_width_0_height_0_subtile_0__pin_O_4_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.top_width_0_height_0_subtile_0__pin_O_5_upper(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.top_width_0_height_0_subtile_0__pin_O_5_lower(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.right_width_0_height_0_subtile_0__pin_O_6_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.right_width_0_height_0_subtile_0__pin_O_6_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.right_width_0_height_0_subtile_0__pin_O_7_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.right_width_0_height_0_subtile_0__pin_O_7_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.right_width_0_height_0_subtile_0__pin_O_8_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.right_width_0_height_0_subtile_0__pin_O_8_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.right_width_0_height_0_subtile_0__pin_O_9_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.right_width_0_height_0_subtile_0__pin_O_9_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.right_width_0_height_0_subtile_0__pin_O_10_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.right_width_0_height_0_subtile_0__pin_O_10_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.right_width_0_height_0_subtile_0__pin_O_11_upper(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.right_width_0_height_0_subtile_0__pin_O_11_lower(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.bottom_width_0_height_0_subtile_0__pin_sc_out_0_(grid_clb_1_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.bottom_width_0_height_0_subtile_0__pin_cout_0_(grid_clb_1_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.ccff_tail(grid_clb_1_ccff_tail));

	grid_clb grid_clb_2__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.top_width_0_height_0_subtile_0__pin_sc_in_0_(direct_interc_3_out),
		.top_width_0_height_0_subtile_0__pin_cin_0_(direct_interc_1_out),
		.right_width_0_height_0_subtile_0__pin_I_9_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.right_width_0_height_0_subtile_0__pin_I_10_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.right_width_0_height_0_subtile_0__pin_I_11_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.right_width_0_height_0_subtile_0__pin_I_12_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.right_width_0_height_0_subtile_0__pin_I_13_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.right_width_0_height_0_subtile_0__pin_I_14_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.right_width_0_height_0_subtile_0__pin_I_15_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.right_width_0_height_0_subtile_0__pin_I_16_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.right_width_0_height_0_subtile_0__pin_I_17_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.left_width_0_height_0_subtile_0__pin_reset_0_(reset),
		.left_width_0_height_0_subtile_0__pin_clk_0_(clk),
		.ccff_head(cby_1__1__0_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_O_0_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.top_width_0_height_0_subtile_0__pin_O_0_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.top_width_0_height_0_subtile_0__pin_O_1_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.top_width_0_height_0_subtile_0__pin_O_1_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.top_width_0_height_0_subtile_0__pin_O_2_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.top_width_0_height_0_subtile_0__pin_O_2_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.top_width_0_height_0_subtile_0__pin_O_3_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.top_width_0_height_0_subtile_0__pin_O_3_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.top_width_0_height_0_subtile_0__pin_O_4_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.top_width_0_height_0_subtile_0__pin_O_4_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.top_width_0_height_0_subtile_0__pin_O_5_upper(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.top_width_0_height_0_subtile_0__pin_O_5_lower(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.right_width_0_height_0_subtile_0__pin_O_6_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.right_width_0_height_0_subtile_0__pin_O_6_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.right_width_0_height_0_subtile_0__pin_O_7_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.right_width_0_height_0_subtile_0__pin_O_7_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.right_width_0_height_0_subtile_0__pin_O_8_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.right_width_0_height_0_subtile_0__pin_O_8_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.right_width_0_height_0_subtile_0__pin_O_9_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.right_width_0_height_0_subtile_0__pin_O_9_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.right_width_0_height_0_subtile_0__pin_O_10_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.right_width_0_height_0_subtile_0__pin_O_10_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.right_width_0_height_0_subtile_0__pin_O_11_upper(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.right_width_0_height_0_subtile_0__pin_O_11_lower(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.bottom_width_0_height_0_subtile_0__pin_sc_out_0_(grid_clb_2__1__undriven_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.bottom_width_0_height_0_subtile_0__pin_cout_0_(grid_clb_2__1__undriven_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.ccff_tail(grid_clb_2_ccff_tail));

	grid_clb grid_clb_2__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.Test_en(Test_en),
		.top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_),
		.top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_),
		.top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_),
		.top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_),
		.top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_),
		.top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_),
		.top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_),
		.top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_),
		.top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_),
		.top_width_0_height_0_subtile_0__pin_sc_in_0_(direct_interc_4_out),
		.top_width_0_height_0_subtile_0__pin_cin_0_(grid_clb_2__2__undriven_top_width_0_height_0_subtile_0__pin_cin_0_),
		.right_width_0_height_0_subtile_0__pin_I_9_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.right_width_0_height_0_subtile_0__pin_I_10_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.right_width_0_height_0_subtile_0__pin_I_11_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.right_width_0_height_0_subtile_0__pin_I_12_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.right_width_0_height_0_subtile_0__pin_I_13_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.right_width_0_height_0_subtile_0__pin_I_14_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.right_width_0_height_0_subtile_0__pin_I_15_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.right_width_0_height_0_subtile_0__pin_I_16_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.right_width_0_height_0_subtile_0__pin_I_17_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.left_width_0_height_0_subtile_0__pin_reset_0_(reset),
		.left_width_0_height_0_subtile_0__pin_clk_0_(clk),
		.ccff_head(cby_1__1__1_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_O_0_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.top_width_0_height_0_subtile_0__pin_O_0_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.top_width_0_height_0_subtile_0__pin_O_1_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.top_width_0_height_0_subtile_0__pin_O_1_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.top_width_0_height_0_subtile_0__pin_O_2_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.top_width_0_height_0_subtile_0__pin_O_2_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.top_width_0_height_0_subtile_0__pin_O_3_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.top_width_0_height_0_subtile_0__pin_O_3_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.top_width_0_height_0_subtile_0__pin_O_4_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.top_width_0_height_0_subtile_0__pin_O_4_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.top_width_0_height_0_subtile_0__pin_O_5_upper(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.top_width_0_height_0_subtile_0__pin_O_5_lower(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.right_width_0_height_0_subtile_0__pin_O_6_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.right_width_0_height_0_subtile_0__pin_O_6_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.right_width_0_height_0_subtile_0__pin_O_7_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.right_width_0_height_0_subtile_0__pin_O_7_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.right_width_0_height_0_subtile_0__pin_O_8_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.right_width_0_height_0_subtile_0__pin_O_8_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.right_width_0_height_0_subtile_0__pin_O_9_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.right_width_0_height_0_subtile_0__pin_O_9_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.right_width_0_height_0_subtile_0__pin_O_10_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.right_width_0_height_0_subtile_0__pin_O_10_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.right_width_0_height_0_subtile_0__pin_O_11_upper(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.right_width_0_height_0_subtile_0__pin_O_11_lower(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.bottom_width_0_height_0_subtile_0__pin_sc_out_0_(grid_clb_3_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.bottom_width_0_height_0_subtile_0__pin_cout_0_(grid_clb_3_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.ccff_tail(grid_clb_3_ccff_tail));

	grid_io_top_top grid_io_top_top_1__3_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[0]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[0]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[0]),
		.bottom_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__2__0_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cbx_1__2__0_ccff_tail),
		.bottom_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.bottom_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_top_top_0_ccff_tail));

	grid_io_top_top grid_io_top_top_2__3_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[1]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[1]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[1]),
		.bottom_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__2__1_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cbx_1__2__1_ccff_tail),
		.bottom_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.bottom_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_top_top_1_ccff_tail));

	grid_io_right_right grid_io_right_right_3__2_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[2]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[2]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[2]),
		.left_width_0_height_0_subtile_0__pin_outpad_0_(cby_2__1__1_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cby_2__1__1_ccff_tail),
		.left_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.left_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_right_right_0_ccff_tail));

	grid_io_right_right grid_io_right_right_3__1_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[3]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[3]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[3]),
		.left_width_0_height_0_subtile_0__pin_outpad_0_(cby_2__1__0_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cby_2__1__0_ccff_tail),
		.left_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.left_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_right_right_1_ccff_tail));

	grid_io_bottom_bottom grid_io_bottom_bottom_2__0_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[4:12]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[4:12]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[4:12]),
		.top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_head(cbx_1__0__2_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_1__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_1__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_2__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_2__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_3__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_3__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_4__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_4__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_5__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_5__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_6__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_6__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_7__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_7__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_8__pin_inpad_0_upper(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_8__pin_inpad_0_lower(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_lower),
		.ccff_tail(grid_io_bottom_bottom_0_ccff_tail));

	grid_io_bottom_bottom grid_io_bottom_bottom_1__0_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[13:21]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[13:21]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[13:21]),
		.top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_head(cbx_1__0__0_ccff_tail),
		.top_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_1__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_1__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_2__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_2__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_3__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_3__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_4__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_4__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_5__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_5__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_6__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_6__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_7__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_7__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_lower),
		.top_width_0_height_0_subtile_8__pin_inpad_0_upper(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_upper),
		.top_width_0_height_0_subtile_8__pin_inpad_0_lower(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_lower),
		.ccff_tail(grid_io_bottom_bottom_1_ccff_tail));

	grid_io_left_left grid_io_left_left_0__1_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[22]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[22]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[22]),
		.right_width_0_height_0_subtile_0__pin_outpad_0_(cby_0__1__0_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cby_0__1__0_ccff_tail),
		.right_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_left_left_0_ccff_tail));

	grid_io_left_left grid_io_left_left_0__2_ (
		.IO_ISOL_N(IO_ISOL_N),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_sofa_plus_io_SOC_IN[23]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_sofa_plus_io_SOC_OUT[23]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_sofa_plus_io_SOC_DIR[23]),
		.right_width_0_height_0_subtile_0__pin_outpad_0_(cby_0__1__1_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_head(cby_0__1__1_ccff_tail),
		.right_width_0_height_0_subtile_0__pin_inpad_0_upper(grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_width_0_height_0_subtile_0__pin_inpad_0_lower(grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.ccff_tail(grid_io_left_left_1_ccff_tail));

	sb_0__0_ sb_0__0_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_0__1__0_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.chanx_right_in(cbx_1__0__0_chanx_left_out[0:11]),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_1__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_2__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_3__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_4__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_5__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_6__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_7__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_8__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_upper),
		.ccff_head(grid_io_bottom_bottom_1_ccff_tail),
		.chany_top_out(sb_0__0__0_chany_top_out[0:11]),
		.chanx_right_out(sb_0__0__0_chanx_right_out[0:11]),
		.ccff_tail(ccff_tail));

	sb_0__1_ sb_0__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_0__1__1_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.chanx_right_in(cbx_1__0__1_chanx_left_out[0:11]),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.chany_bottom_in(cby_0__1__0_chany_top_out[0:11]),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_left_left_0_right_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.ccff_head(cbx_1__0__1_ccff_tail),
		.chany_top_out(sb_0__1__0_chany_top_out[0:11]),
		.chanx_right_out(sb_0__1__0_chanx_right_out[0:11]),
		.chany_bottom_out(sb_0__1__0_chany_bottom_out[0:11]),
		.ccff_tail(sb_0__1__0_ccff_tail));

	sb_0__2_ sb_0__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_right_in(cbx_1__2__0_chanx_left_out[0:11]),
		.right_top_grid_bottom_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.chany_bottom_in(cby_0__1__1_chany_top_out[0:11]),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_left_left_1_right_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.ccff_head(grid_io_top_top_0_ccff_tail),
		.chanx_right_out(sb_0__2__0_chanx_right_out[0:11]),
		.chany_bottom_out(sb_0__2__0_chany_bottom_out[0:11]),
		.ccff_tail(sb_0__2__0_ccff_tail));

	sb_1__0_ sb_1__0_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_1__1__0_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.chanx_right_in(cbx_1__0__2_chanx_left_out[0:11]),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_1__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_2__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_3__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_4__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_5__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_6__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_7__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_8__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_upper),
		.chanx_left_in(cbx_1__0__0_chanx_right_out[0:11]),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_1__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_1__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_2__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_2__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_3__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_3__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_4__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_4__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_5__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_5__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_6__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_6__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_7__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_7__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_8__pin_inpad_0_(grid_io_bottom_bottom_1_top_width_0_height_0_subtile_8__pin_inpad_0_lower),
		.ccff_head(grid_io_bottom_bottom_0_ccff_tail),
		.chany_top_out(sb_1__0__0_chany_top_out[0:11]),
		.chanx_right_out(sb_1__0__0_chanx_right_out[0:11]),
		.chanx_left_out(sb_1__0__0_chanx_left_out[0:11]),
		.ccff_tail(sb_1__0__0_ccff_tail));

	sb_1__1_ sb_1__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_1__1__1_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.chanx_right_in(cbx_1__0__3_chanx_left_out[0:11]),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.chany_bottom_in(cby_1__1__0_chany_top_out[0:11]),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_0_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.chanx_left_in(cbx_1__0__1_chanx_right_out[0:11]),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_0_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.ccff_head(cbx_1__0__3_ccff_tail),
		.chany_top_out(sb_1__1__0_chany_top_out[0:11]),
		.chanx_right_out(sb_1__1__0_chanx_right_out[0:11]),
		.chany_bottom_out(sb_1__1__0_chany_bottom_out[0:11]),
		.chanx_left_out(sb_1__1__0_chanx_left_out[0:11]),
		.ccff_tail(sb_1__1__0_ccff_tail));

	sb_1__2_ sb_1__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_right_in(cbx_1__2__1_chanx_left_out[0:11]),
		.right_top_grid_bottom_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_upper),
		.right_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_upper),
		.chany_bottom_in(cby_1__1__1_chany_top_out[0:11]),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_1_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.chanx_left_in(cbx_1__2__0_chanx_right_out[0:11]),
		.left_top_grid_bottom_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_top_top_0_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_1_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.ccff_head(grid_io_top_top_1_ccff_tail),
		.chanx_right_out(sb_1__2__0_chanx_right_out[0:11]),
		.chany_bottom_out(sb_1__2__0_chany_bottom_out[0:11]),
		.chanx_left_out(sb_1__2__0_chanx_left_out[0:11]),
		.ccff_tail(sb_1__2__0_ccff_tail));

	sb_2__0_ sb_2__0_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_2__1__0_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.top_right_grid_left_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.chanx_left_in(cbx_1__0__2_chanx_right_out[0:11]),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_1__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_1__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_2__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_2__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_3__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_3__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_4__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_4__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_5__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_5__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_6__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_6__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_7__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_7__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_8__pin_inpad_0_(grid_io_bottom_bottom_0_top_width_0_height_0_subtile_8__pin_inpad_0_lower),
		.ccff_head(grid_io_right_right_1_ccff_tail),
		.chany_top_out(sb_2__0__0_chany_top_out[0:11]),
		.chanx_left_out(sb_2__0__0_chanx_left_out[0:11]),
		.ccff_tail(sb_2__0__0_ccff_tail));

	sb_2__1_ sb_2__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_top_in(cby_2__1__1_chany_bottom_out[0:11]),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_lower),
		.top_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_lower),
		.top_right_grid_left_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.chany_bottom_in(cby_2__1__0_chany_top_out[0:11]),
		.bottom_right_grid_left_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_right_right_1_left_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_2_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.chanx_left_in(cbx_1__0__3_chanx_right_out[0:11]),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_2_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.ccff_head(grid_io_right_right_0_ccff_tail),
		.chany_top_out(sb_2__1__0_chany_top_out[0:11]),
		.chany_bottom_out(sb_2__1__0_chany_bottom_out[0:11]),
		.chanx_left_out(sb_2__1__0_chanx_left_out[0:11]),
		.ccff_tail(sb_2__1__0_ccff_tail));

	sb_2__2_ sb_2__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(cby_2__1__1_chany_top_out[0:11]),
		.bottom_right_grid_left_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_right_right_0_left_width_0_height_0_subtile_0__pin_inpad_0_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_6_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_6_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_7_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_7_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_8_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_8_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_9_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_9_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_10_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_10_upper),
		.bottom_left_grid_right_width_0_height_0_subtile_0__pin_O_11_(grid_clb_3_right_width_0_height_0_subtile_0__pin_O_11_upper),
		.chanx_left_in(cbx_1__2__1_chanx_right_out[0:11]),
		.left_top_grid_bottom_width_0_height_0_subtile_0__pin_inpad_0_(grid_io_top_top_1_bottom_width_0_height_0_subtile_0__pin_inpad_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_0_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_0_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_1_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_1_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_2_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_2_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_3_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_3_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_4_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_4_lower),
		.left_bottom_grid_top_width_0_height_0_subtile_0__pin_O_5_(grid_clb_3_top_width_0_height_0_subtile_0__pin_O_5_lower),
		.ccff_head(ccff_head),
		.chany_bottom_out(sb_2__2__0_chany_bottom_out[0:11]),
		.chanx_left_out(sb_2__2__0_chanx_left_out[0:11]),
		.ccff_tail(sb_2__2__0_ccff_tail));

	cbx_1__0_ cbx_1__0_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_0__0__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_1__0__0_chanx_left_out[0:11]),
		.ccff_head(sb_1__0__0_ccff_tail),
		.chanx_left_out(cbx_1__0__0_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__0__0_chanx_right_out[0:11]),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__0_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_tail(cbx_1__0__0_ccff_tail));

	cbx_1__0_ cbx_1__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_0__1__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_1__1__0_chanx_left_out[0:11]),
		.ccff_head(sb_1__1__0_ccff_tail),
		.chanx_left_out(cbx_1__0__1_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__0__1_chanx_right_out[0:11]),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__1_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_tail(cbx_1__0__1_ccff_tail));

	cbx_1__0_ cbx_2__0_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_1__0__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_2__0__0_chanx_left_out[0:11]),
		.ccff_head(sb_2__0__0_ccff_tail),
		.chanx_left_out(cbx_1__0__2_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__0__2_chanx_right_out[0:11]),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__2_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_tail(cbx_1__0__2_ccff_tail));

	cbx_1__0_ cbx_2__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_1__1__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_2__1__0_chanx_left_out[0:11]),
		.ccff_head(sb_2__1__0_ccff_tail),
		.chanx_left_out(cbx_1__0__3_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__0__3_chanx_right_out[0:11]),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_(cbx_1__0__3_bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_),
		.ccff_tail(cbx_1__0__3_ccff_tail));

	cbx_1__2_ cbx_1__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_0__2__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_1__2__0_chanx_left_out[0:11]),
		.ccff_head(sb_1__2__0_ccff_tail),
		.chanx_left_out(cbx_1__2__0_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__2__0_chanx_right_out[0:11]),
		.top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__2__0_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__2__0_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_),
		.ccff_tail(cbx_1__2__0_ccff_tail));

	cbx_1__2_ cbx_2__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chanx_left_in(sb_1__2__0_chanx_right_out[0:11]),
		.chanx_right_in(sb_2__2__0_chanx_left_out[0:11]),
		.ccff_head(sb_2__2__0_ccff_tail),
		.chanx_left_out(cbx_1__2__1_chanx_left_out[0:11]),
		.chanx_right_out(cbx_1__2__1_chanx_right_out[0:11]),
		.top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_(cbx_1__2__1_top_grid_bottom_width_0_height_0_subtile_0__pin_outpad_0_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_0_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_1_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_2_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_3_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_4_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_5_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_6_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_7_),
		.bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_(cbx_1__2__1_bottom_grid_top_width_0_height_0_subtile_0__pin_I_8_),
		.ccff_tail(cbx_1__2__1_ccff_tail));

	cby_0__1_ cby_0__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_0__0__0_chany_top_out[0:11]),
		.chany_top_in(sb_0__1__0_chany_bottom_out[0:11]),
		.ccff_head(sb_0__1__0_ccff_tail),
		.chany_bottom_out(cby_0__1__0_chany_bottom_out[0:11]),
		.chany_top_out(cby_0__1__0_chany_top_out[0:11]),
		.left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_(cby_0__1__0_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_tail(cby_0__1__0_ccff_tail));

	cby_0__1_ cby_0__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_0__1__0_chany_top_out[0:11]),
		.chany_top_in(sb_0__2__0_chany_bottom_out[0:11]),
		.ccff_head(sb_0__2__0_ccff_tail),
		.chany_bottom_out(cby_0__1__1_chany_bottom_out[0:11]),
		.chany_top_out(cby_0__1__1_chany_top_out[0:11]),
		.left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_(cby_0__1__1_left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_),
		.ccff_tail(cby_0__1__1_ccff_tail));

	cby_1__1_ cby_1__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_1__0__0_chany_top_out[0:11]),
		.chany_top_in(sb_1__1__0_chany_bottom_out[0:11]),
		.ccff_head(grid_clb_0_ccff_tail),
		.chany_bottom_out(cby_1__1__0_chany_bottom_out[0:11]),
		.chany_top_out(cby_1__1__0_chany_top_out[0:11]),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_9_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_10_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_11_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_12_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_13_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_14_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_15_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_16_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_17_(cby_1__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.ccff_tail(cby_1__1__0_ccff_tail));

	cby_1__1_ cby_1__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_1__1__0_chany_top_out[0:11]),
		.chany_top_in(sb_1__2__0_chany_bottom_out[0:11]),
		.ccff_head(grid_clb_1_ccff_tail),
		.chany_bottom_out(cby_1__1__1_chany_bottom_out[0:11]),
		.chany_top_out(cby_1__1__1_chany_top_out[0:11]),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_9_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_10_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_11_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_12_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_13_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_14_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_15_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_16_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_17_(cby_1__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.ccff_tail(cby_1__1__1_ccff_tail));

	cby_2__1_ cby_2__1_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_2__0__0_chany_top_out[0:11]),
		.chany_top_in(sb_2__1__0_chany_bottom_out[0:11]),
		.ccff_head(grid_clb_2_ccff_tail),
		.chany_bottom_out(cby_2__1__0_chany_bottom_out[0:11]),
		.chany_top_out(cby_2__1__0_chany_top_out[0:11]),
		.right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_(cby_2__1__0_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_9_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_10_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_11_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_12_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_13_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_14_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_15_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_16_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_17_(cby_2__1__0_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.ccff_tail(cby_2__1__0_ccff_tail));

	cby_2__1_ cby_2__2_ (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.chany_bottom_in(sb_2__1__0_chany_top_out[0:11]),
		.chany_top_in(sb_2__2__0_chany_bottom_out[0:11]),
		.ccff_head(grid_clb_3_ccff_tail),
		.chany_bottom_out(cby_2__1__1_chany_bottom_out[0:11]),
		.chany_top_out(cby_2__1__1_chany_top_out[0:11]),
		.right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_(cby_2__1__1_right_grid_left_width_0_height_0_subtile_0__pin_outpad_0_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_9_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_9_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_10_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_10_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_11_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_11_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_12_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_12_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_13_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_13_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_14_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_14_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_15_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_15_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_16_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_16_),
		.left_grid_right_width_0_height_0_subtile_0__pin_I_17_(cby_2__1__1_left_grid_right_width_0_height_0_subtile_0__pin_I_17_),
		.ccff_tail(cby_2__1__1_ccff_tail));

	direct_interc direct_interc_0_ (
		.in(grid_clb_1_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.out(direct_interc_0_out));

	direct_interc direct_interc_1_ (
		.in(grid_clb_3_bottom_width_0_height_0_subtile_0__pin_cout_0_),
		.out(direct_interc_1_out));

	direct_interc direct_interc_2_ (
		.in(grid_clb_1_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.out(direct_interc_2_out));

	direct_interc direct_interc_3_ (
		.in(grid_clb_3_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.out(direct_interc_3_out));

	direct_interc direct_interc_4_ (
		.in(grid_clb_0_bottom_width_0_height_0_subtile_0__pin_sc_out_0_),
		.out(direct_interc_4_out));

endmodule
// ----- END Verilog module for fpga_top -----

//----- Default net type -----




