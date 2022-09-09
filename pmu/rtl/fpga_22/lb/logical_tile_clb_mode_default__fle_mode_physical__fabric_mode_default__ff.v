//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Verilog modules for primitive pb_type: ff
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff -----
module logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff(Test_en,
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
input [0:0] Test_en;
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ff_D;
//----- INPUT PORTS -----
input [0:0] ff_DI;
//----- INPUT PORTS -----
input [0:0] ff_R;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ff_Q;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- CLOCK PORTS -----
input [0:0] ff_C;

//----- BEGIN wire-connection ports -----
wire [0:0] ff_D;
wire [0:0] ff_DI;
wire [0:0] ff_R;
wire [0:0] ff_Q;
wire [0:0] ff_C;
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:1] sofa_plus_dff_0_MODE_SEL;
wire [0:1] sofa_plus_dff_sofa_plus_ccff_mem_undriven_mem_outb;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_dff sofa_plus_dff_0_ (
		.Test_en(Test_en),
		.D(ff_D),
		.DI(ff_DI),
		.R(ff_R),
		.C(ff_C),
		.MODE_SEL(sofa_plus_dff_0_MODE_SEL[0:1]),
		.Q(ff_Q));

	sofa_plus_dff_sofa_plus_ccff_mem sofa_plus_dff_sofa_plus_ccff_mem (
		.config_enable(config_enable),
		.pReset(pReset),
		.prog_clk(prog_clk),
		.ccff_head(ccff_head),
		.ccff_tail(ccff_tail),
		.mem_out(sofa_plus_dff_0_MODE_SEL[0:1]),
		.mem_outb(sofa_plus_dff_sofa_plus_ccff_mem_undriven_mem_outb[0:1]));

endmodule
// ----- END Verilog module for logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff -----

//----- Default net type -----
`default_nettype wire



