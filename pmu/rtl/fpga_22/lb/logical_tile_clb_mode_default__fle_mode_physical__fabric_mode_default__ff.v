//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: ff
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype none

// ----- Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff -----
module logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff(Test_en,
                                                                                 config_readback,
                                                                                 config_enable,
                                                                                 pReset,
                                                                                 prog_clk,
                                                                                 ff_D,
                                                                                 ff_DI,
                                                                                 ff_R,
                                                                                 ccff_head,
                                                                                 ff_Q,
                                                                                 ccff_tail,
                                                                                 ff_C);
//----- GLOBAL PORTS -----
input wire [0:0] Test_en;
//----- GLOBAL PORTS -----
input wire [0:0] config_readback;
//----- GLOBAL PORTS -----
input wire [0:0] config_enable;
//----- GLOBAL PORTS -----
input wire [0:0] pReset;
//----- GLOBAL PORTS -----
input wire [0:0] prog_clk;
//----- INPUT PORTS -----
input wire [0:0] ff_D;
//----- INPUT PORTS -----
input wire [0:0] ff_DI;
//----- INPUT PORTS -----
input wire [0:0] ff_R;
//----- INPUT PORTS -----
input wire [0:0] ccff_head;
//----- OUTPUT PORTS -----
output wire [0:0] ff_Q;
//----- OUTPUT PORTS -----
output wire [0:0] ccff_tail;
//----- CLOCK PORTS -----
input wire [0:0] ff_C;

//----- BEGIN wire-connection ports -----
/* wire [0:0] ff_D; */
/* wire [0:0] ff_DI; */
/* wire [0:0] ff_R; */
/* wire [0:0] ff_Q; */
/* wire [0:0] ff_C; */
/* //----- END wire-connection ports ----- */


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] CUSTOM_DATAFF_0_mode;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	CUSTOM_DATAFF CUSTOM_DATAFF_0_ (
		.SE(Test_en),
		.D(ff_D),
		.SI(ff_DI),
		.R(ff_R),
		.CK(ff_C),
		.MODE(CUSTOM_DATAFF_0_mode),
		.Q(ff_Q));

	CUSTOM_DATAFF_CUSTOM_CCFF_mem CUSTOM_DATAFF_CUSTOM_CCFF_mem (
		.config_readback(config_readback),
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out(CUSTOM_DATAFF_0_mode));

endmodule
// ----- END Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff -----

//----- Default net type -----
`default_nettype none



