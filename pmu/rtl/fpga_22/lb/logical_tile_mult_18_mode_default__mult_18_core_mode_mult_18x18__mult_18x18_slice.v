//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for pb_type: mult_18x18_slice
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

// ----- BEGIN Physical programmable logic block Verilog module: mult_18x18_slice -----
//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice -----
module logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice(config_enable,
                                                                                         pReset,
                                                                                         prog_clk,
                                                                                         mult_18x18_slice_A_cfg,
                                                                                         mult_18x18_slice_B_cfg,
                                                                                         ccff_head,
                                                                                         mult_18x18_slice_OUT_cfg,
                                                                                         ccff_tail);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:17] mult_18x18_slice_A_cfg;
//----- INPUT PORTS -----
input [0:17] mult_18x18_slice_B_cfg;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:35] mult_18x18_slice_OUT_cfg;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;

//----- BEGIN wire-connection ports -----
wire [0:17] mult_18x18_slice_A_cfg;
wire [0:17] mult_18x18_slice_B_cfg;
wire [0:35] mult_18x18_slice_OUT_cfg;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


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
wire [0:35] logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18 logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0 (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.mult_18x18_A({direct_interc_36_out, direct_interc_37_out, direct_interc_38_out, direct_interc_39_out, direct_interc_40_out, direct_interc_41_out, direct_interc_42_out, direct_interc_43_out, direct_interc_44_out, direct_interc_45_out, direct_interc_46_out, direct_interc_47_out, direct_interc_48_out, direct_interc_49_out, direct_interc_50_out, direct_interc_51_out, direct_interc_52_out, direct_interc_53_out}),
		.mult_18x18_B({direct_interc_54_out, direct_interc_55_out, direct_interc_56_out, direct_interc_57_out, direct_interc_58_out, direct_interc_59_out, direct_interc_60_out, direct_interc_61_out, direct_interc_62_out, direct_interc_63_out, direct_interc_64_out, direct_interc_65_out, direct_interc_66_out, direct_interc_67_out, direct_interc_68_out, direct_interc_69_out, direct_interc_70_out, direct_interc_71_out}),
		.ccff_head(ccff_head),
		.mult_18x18_Y(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[0:35]),
		.ccff_tail(ccff_tail));

	direct_interc direct_interc_0_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[0]),
		.out(mult_18x18_slice_OUT_cfg[0]));

	direct_interc direct_interc_1_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[1]),
		.out(mult_18x18_slice_OUT_cfg[1]));

	direct_interc direct_interc_2_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[2]),
		.out(mult_18x18_slice_OUT_cfg[2]));

	direct_interc direct_interc_3_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[3]),
		.out(mult_18x18_slice_OUT_cfg[3]));

	direct_interc direct_interc_4_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[4]),
		.out(mult_18x18_slice_OUT_cfg[4]));

	direct_interc direct_interc_5_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[5]),
		.out(mult_18x18_slice_OUT_cfg[5]));

	direct_interc direct_interc_6_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[6]),
		.out(mult_18x18_slice_OUT_cfg[6]));

	direct_interc direct_interc_7_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[7]),
		.out(mult_18x18_slice_OUT_cfg[7]));

	direct_interc direct_interc_8_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[8]),
		.out(mult_18x18_slice_OUT_cfg[8]));

	direct_interc direct_interc_9_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[9]),
		.out(mult_18x18_slice_OUT_cfg[9]));

	direct_interc direct_interc_10_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[10]),
		.out(mult_18x18_slice_OUT_cfg[10]));

	direct_interc direct_interc_11_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[11]),
		.out(mult_18x18_slice_OUT_cfg[11]));

	direct_interc direct_interc_12_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[12]),
		.out(mult_18x18_slice_OUT_cfg[12]));

	direct_interc direct_interc_13_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[13]),
		.out(mult_18x18_slice_OUT_cfg[13]));

	direct_interc direct_interc_14_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[14]),
		.out(mult_18x18_slice_OUT_cfg[14]));

	direct_interc direct_interc_15_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[15]),
		.out(mult_18x18_slice_OUT_cfg[15]));

	direct_interc direct_interc_16_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[16]),
		.out(mult_18x18_slice_OUT_cfg[16]));

	direct_interc direct_interc_17_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[17]),
		.out(mult_18x18_slice_OUT_cfg[17]));

	direct_interc direct_interc_18_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[18]),
		.out(mult_18x18_slice_OUT_cfg[18]));

	direct_interc direct_interc_19_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[19]),
		.out(mult_18x18_slice_OUT_cfg[19]));

	direct_interc direct_interc_20_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[20]),
		.out(mult_18x18_slice_OUT_cfg[20]));

	direct_interc direct_interc_21_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[21]),
		.out(mult_18x18_slice_OUT_cfg[21]));

	direct_interc direct_interc_22_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[22]),
		.out(mult_18x18_slice_OUT_cfg[22]));

	direct_interc direct_interc_23_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[23]),
		.out(mult_18x18_slice_OUT_cfg[23]));

	direct_interc direct_interc_24_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[24]),
		.out(mult_18x18_slice_OUT_cfg[24]));

	direct_interc direct_interc_25_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[25]),
		.out(mult_18x18_slice_OUT_cfg[25]));

	direct_interc direct_interc_26_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[26]),
		.out(mult_18x18_slice_OUT_cfg[26]));

	direct_interc direct_interc_27_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[27]),
		.out(mult_18x18_slice_OUT_cfg[27]));

	direct_interc direct_interc_28_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[28]),
		.out(mult_18x18_slice_OUT_cfg[28]));

	direct_interc direct_interc_29_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[29]),
		.out(mult_18x18_slice_OUT_cfg[29]));

	direct_interc direct_interc_30_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[30]),
		.out(mult_18x18_slice_OUT_cfg[30]));

	direct_interc direct_interc_31_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[31]),
		.out(mult_18x18_slice_OUT_cfg[31]));

	direct_interc direct_interc_32_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[32]),
		.out(mult_18x18_slice_OUT_cfg[32]));

	direct_interc direct_interc_33_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[33]),
		.out(mult_18x18_slice_OUT_cfg[33]));

	direct_interc direct_interc_34_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[34]),
		.out(mult_18x18_slice_OUT_cfg[34]));

	direct_interc direct_interc_35_ (
		.in(logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice_mode_default__mult_18x18_0_mult_18x18_Y[35]),
		.out(mult_18x18_slice_OUT_cfg[35]));

	direct_interc direct_interc_36_ (
		.in(mult_18x18_slice_A_cfg[0]),
		.out(direct_interc_36_out));

	direct_interc direct_interc_37_ (
		.in(mult_18x18_slice_A_cfg[1]),
		.out(direct_interc_37_out));

	direct_interc direct_interc_38_ (
		.in(mult_18x18_slice_A_cfg[2]),
		.out(direct_interc_38_out));

	direct_interc direct_interc_39_ (
		.in(mult_18x18_slice_A_cfg[3]),
		.out(direct_interc_39_out));

	direct_interc direct_interc_40_ (
		.in(mult_18x18_slice_A_cfg[4]),
		.out(direct_interc_40_out));

	direct_interc direct_interc_41_ (
		.in(mult_18x18_slice_A_cfg[5]),
		.out(direct_interc_41_out));

	direct_interc direct_interc_42_ (
		.in(mult_18x18_slice_A_cfg[6]),
		.out(direct_interc_42_out));

	direct_interc direct_interc_43_ (
		.in(mult_18x18_slice_A_cfg[7]),
		.out(direct_interc_43_out));

	direct_interc direct_interc_44_ (
		.in(mult_18x18_slice_A_cfg[8]),
		.out(direct_interc_44_out));

	direct_interc direct_interc_45_ (
		.in(mult_18x18_slice_A_cfg[9]),
		.out(direct_interc_45_out));

	direct_interc direct_interc_46_ (
		.in(mult_18x18_slice_A_cfg[10]),
		.out(direct_interc_46_out));

	direct_interc direct_interc_47_ (
		.in(mult_18x18_slice_A_cfg[11]),
		.out(direct_interc_47_out));

	direct_interc direct_interc_48_ (
		.in(mult_18x18_slice_A_cfg[12]),
		.out(direct_interc_48_out));

	direct_interc direct_interc_49_ (
		.in(mult_18x18_slice_A_cfg[13]),
		.out(direct_interc_49_out));

	direct_interc direct_interc_50_ (
		.in(mult_18x18_slice_A_cfg[14]),
		.out(direct_interc_50_out));

	direct_interc direct_interc_51_ (
		.in(mult_18x18_slice_A_cfg[15]),
		.out(direct_interc_51_out));

	direct_interc direct_interc_52_ (
		.in(mult_18x18_slice_A_cfg[16]),
		.out(direct_interc_52_out));

	direct_interc direct_interc_53_ (
		.in(mult_18x18_slice_A_cfg[17]),
		.out(direct_interc_53_out));

	direct_interc direct_interc_54_ (
		.in(mult_18x18_slice_B_cfg[0]),
		.out(direct_interc_54_out));

	direct_interc direct_interc_55_ (
		.in(mult_18x18_slice_B_cfg[1]),
		.out(direct_interc_55_out));

	direct_interc direct_interc_56_ (
		.in(mult_18x18_slice_B_cfg[2]),
		.out(direct_interc_56_out));

	direct_interc direct_interc_57_ (
		.in(mult_18x18_slice_B_cfg[3]),
		.out(direct_interc_57_out));

	direct_interc direct_interc_58_ (
		.in(mult_18x18_slice_B_cfg[4]),
		.out(direct_interc_58_out));

	direct_interc direct_interc_59_ (
		.in(mult_18x18_slice_B_cfg[5]),
		.out(direct_interc_59_out));

	direct_interc direct_interc_60_ (
		.in(mult_18x18_slice_B_cfg[6]),
		.out(direct_interc_60_out));

	direct_interc direct_interc_61_ (
		.in(mult_18x18_slice_B_cfg[7]),
		.out(direct_interc_61_out));

	direct_interc direct_interc_62_ (
		.in(mult_18x18_slice_B_cfg[8]),
		.out(direct_interc_62_out));

	direct_interc direct_interc_63_ (
		.in(mult_18x18_slice_B_cfg[9]),
		.out(direct_interc_63_out));

	direct_interc direct_interc_64_ (
		.in(mult_18x18_slice_B_cfg[10]),
		.out(direct_interc_64_out));

	direct_interc direct_interc_65_ (
		.in(mult_18x18_slice_B_cfg[11]),
		.out(direct_interc_65_out));

	direct_interc direct_interc_66_ (
		.in(mult_18x18_slice_B_cfg[12]),
		.out(direct_interc_66_out));

	direct_interc direct_interc_67_ (
		.in(mult_18x18_slice_B_cfg[13]),
		.out(direct_interc_67_out));

	direct_interc direct_interc_68_ (
		.in(mult_18x18_slice_B_cfg[14]),
		.out(direct_interc_68_out));

	direct_interc direct_interc_69_ (
		.in(mult_18x18_slice_B_cfg[15]),
		.out(direct_interc_69_out));

	direct_interc direct_interc_70_ (
		.in(mult_18x18_slice_B_cfg[16]),
		.out(direct_interc_70_out));

	direct_interc direct_interc_71_ (
		.in(mult_18x18_slice_B_cfg[17]),
		.out(direct_interc_71_out));

endmodule
// ----- END Verilog module for logical_tile_mult_18_mode_default__mult_18_core_mode_mult_18x18__mult_18x18_slice -----

//----- Default net type -----
`default_nettype wire



// ----- END Physical programmable logic block Verilog module: mult_18x18_slice -----
