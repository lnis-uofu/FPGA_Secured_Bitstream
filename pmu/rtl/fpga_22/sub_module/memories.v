//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Memories used in FPGA
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Tue Aug 16 10:20:30 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size8_mem -----
module mux_tree_tapbuf_size8_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size8_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size6_mem -----
module mux_tree_tapbuf_size6_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:2] mem_out;
//----- OUTPUT PORTS -----
output [0:2] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size6_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size10_mem -----
module mux_tree_tapbuf_size10_mem(config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out,
                                  mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size10_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size14_mem -----
module mux_tree_tapbuf_size14_mem(config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out,
                                  mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size14_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size13_mem -----
module mux_tree_tapbuf_size13_mem(config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out,
                                  mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size13_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size2_mem -----
module mux_tree_tapbuf_size2_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:1] mem_out;
//----- OUTPUT PORTS -----
output [0:1] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size2_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size7_mem -----
module mux_tree_tapbuf_size7_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:2] mem_out;
//----- OUTPUT PORTS -----
output [0:2] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size7_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size9_mem -----
module mux_tree_tapbuf_size9_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size9_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size4_mem -----
module mux_tree_tapbuf_size4_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:2] mem_out;
//----- OUTPUT PORTS -----
output [0:2] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size4_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size3_mem -----
module mux_tree_tapbuf_size3_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:1] mem_out;
//----- OUTPUT PORTS -----
output [0:1] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size3_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size11_mem -----
module mux_tree_tapbuf_size11_mem(config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out,
                                  mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size11_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size12_mem -----
module mux_tree_tapbuf_size12_mem(config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out,
                                  mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:3] mem_out;
//----- OUTPUT PORTS -----
output [0:3] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size12_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size5_mem -----
module mux_tree_tapbuf_size5_mem(config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out,
                                 mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:2] mem_out;
//----- OUTPUT PORTS -----
output [0:2] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size5_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_size30_mem -----
module mux_tree_size30_mem(config_enable,
                           pReset,
                           prog_clk,
                           ccff_head,
                           ccff_tail,
                           mem_out,
                           mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:4] mem_out;
//----- OUTPUT PORTS -----
output [0:4] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;
wire [0:0] sofa_plus_ccff_3_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(sofa_plus_ccff_3_Q),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

	sofa_plus_ccff sofa_plus_ccff_4_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_3_Q),
		.SI(sofa_plus_ccff_3_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[4]),
		.CFGQ(mem_out[4]));

endmodule
// ----- END Verilog module for mux_tree_size30_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_size2_mem -----
module mux_tree_size2_mem(config_enable,
                          pReset,
                          prog_clk,
                          ccff_head,
                          ccff_tail,
                          mem_out,
                          mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:1] mem_out;
//----- OUTPUT PORTS -----
output [0:1] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_size2_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_size18_mem -----
module mux_tree_size18_mem(config_enable,
                           pReset,
                           prog_clk,
                           ccff_head,
                           ccff_tail,
                           mem_out,
                           mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:4] mem_out;
//----- OUTPUT PORTS -----
output [0:4] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;
wire [0:0] sofa_plus_ccff_3_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(sofa_plus_ccff_3_Q),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

	sofa_plus_ccff sofa_plus_ccff_4_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_3_Q),
		.SI(sofa_plus_ccff_3_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[4]),
		.CFGQ(mem_out[4]));

endmodule
// ----- END Verilog module for mux_tree_size18_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sofa_plus_dff_sofa_plus_ccff_mem -----
module sofa_plus_dff_sofa_plus_ccff_mem(config_enable,
                                        pReset,
                                        prog_clk,
                                        ccff_head,
                                        ccff_tail,
                                        mem_out,
                                        mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:1] mem_out;
//----- OUTPUT PORTS -----
output [0:1] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

endmodule
// ----- END Verilog module for sofa_plus_dff_sofa_plus_ccff_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for frac_lut4_arith_sofa_plus_ccff_mem -----
module frac_lut4_arith_sofa_plus_ccff_mem(config_enable,
                                          pReset,
                                          prog_clk,
                                          ccff_head,
                                          ccff_tail,
                                          mem_out,
                                          mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:17] mem_out;
//----- OUTPUT PORTS -----
output [0:17] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----


wire [0:0] sofa_plus_ccff_0_Q;
wire [0:0] sofa_plus_ccff_10_Q;
wire [0:0] sofa_plus_ccff_11_Q;
wire [0:0] sofa_plus_ccff_12_Q;
wire [0:0] sofa_plus_ccff_13_Q;
wire [0:0] sofa_plus_ccff_14_Q;
wire [0:0] sofa_plus_ccff_15_Q;
wire [0:0] sofa_plus_ccff_16_Q;
wire [0:0] sofa_plus_ccff_1_Q;
wire [0:0] sofa_plus_ccff_2_Q;
wire [0:0] sofa_plus_ccff_3_Q;
wire [0:0] sofa_plus_ccff_4_Q;
wire [0:0] sofa_plus_ccff_5_Q;
wire [0:0] sofa_plus_ccff_6_Q;
wire [0:0] sofa_plus_ccff_7_Q;
wire [0:0] sofa_plus_ccff_8_Q;
wire [0:0] sofa_plus_ccff_9_Q;

// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(sofa_plus_ccff_0_Q),
		.CFGQN(mem_outb[0]),
		.CFGQ(mem_out[0]));

	sofa_plus_ccff sofa_plus_ccff_1_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_0_Q),
		.SI(sofa_plus_ccff_0_Q),
		.Q(sofa_plus_ccff_1_Q),
		.CFGQN(mem_outb[1]),
		.CFGQ(mem_out[1]));

	sofa_plus_ccff sofa_plus_ccff_2_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_1_Q),
		.SI(sofa_plus_ccff_1_Q),
		.Q(sofa_plus_ccff_2_Q),
		.CFGQN(mem_outb[2]),
		.CFGQ(mem_out[2]));

	sofa_plus_ccff sofa_plus_ccff_3_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_2_Q),
		.SI(sofa_plus_ccff_2_Q),
		.Q(sofa_plus_ccff_3_Q),
		.CFGQN(mem_outb[3]),
		.CFGQ(mem_out[3]));

	sofa_plus_ccff sofa_plus_ccff_4_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_3_Q),
		.SI(sofa_plus_ccff_3_Q),
		.Q(sofa_plus_ccff_4_Q),
		.CFGQN(mem_outb[4]),
		.CFGQ(mem_out[4]));

	sofa_plus_ccff sofa_plus_ccff_5_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_4_Q),
		.SI(sofa_plus_ccff_4_Q),
		.Q(sofa_plus_ccff_5_Q),
		.CFGQN(mem_outb[5]),
		.CFGQ(mem_out[5]));

	sofa_plus_ccff sofa_plus_ccff_6_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_5_Q),
		.SI(sofa_plus_ccff_5_Q),
		.Q(sofa_plus_ccff_6_Q),
		.CFGQN(mem_outb[6]),
		.CFGQ(mem_out[6]));

	sofa_plus_ccff sofa_plus_ccff_7_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_6_Q),
		.SI(sofa_plus_ccff_6_Q),
		.Q(sofa_plus_ccff_7_Q),
		.CFGQN(mem_outb[7]),
		.CFGQ(mem_out[7]));

	sofa_plus_ccff sofa_plus_ccff_8_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_7_Q),
		.SI(sofa_plus_ccff_7_Q),
		.Q(sofa_plus_ccff_8_Q),
		.CFGQN(mem_outb[8]),
		.CFGQ(mem_out[8]));

	sofa_plus_ccff sofa_plus_ccff_9_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_8_Q),
		.SI(sofa_plus_ccff_8_Q),
		.Q(sofa_plus_ccff_9_Q),
		.CFGQN(mem_outb[9]),
		.CFGQ(mem_out[9]));

	sofa_plus_ccff sofa_plus_ccff_10_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_9_Q),
		.SI(sofa_plus_ccff_9_Q),
		.Q(sofa_plus_ccff_10_Q),
		.CFGQN(mem_outb[10]),
		.CFGQ(mem_out[10]));

	sofa_plus_ccff sofa_plus_ccff_11_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_10_Q),
		.SI(sofa_plus_ccff_10_Q),
		.Q(sofa_plus_ccff_11_Q),
		.CFGQN(mem_outb[11]),
		.CFGQ(mem_out[11]));

	sofa_plus_ccff sofa_plus_ccff_12_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_11_Q),
		.SI(sofa_plus_ccff_11_Q),
		.Q(sofa_plus_ccff_12_Q),
		.CFGQN(mem_outb[12]),
		.CFGQ(mem_out[12]));

	sofa_plus_ccff sofa_plus_ccff_13_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_12_Q),
		.SI(sofa_plus_ccff_12_Q),
		.Q(sofa_plus_ccff_13_Q),
		.CFGQN(mem_outb[13]),
		.CFGQ(mem_out[13]));

	sofa_plus_ccff sofa_plus_ccff_14_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_13_Q),
		.SI(sofa_plus_ccff_13_Q),
		.Q(sofa_plus_ccff_14_Q),
		.CFGQN(mem_outb[14]),
		.CFGQ(mem_out[14]));

	sofa_plus_ccff sofa_plus_ccff_15_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_14_Q),
		.SI(sofa_plus_ccff_14_Q),
		.Q(sofa_plus_ccff_15_Q),
		.CFGQN(mem_outb[15]),
		.CFGQ(mem_out[15]));

	sofa_plus_ccff sofa_plus_ccff_16_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_15_Q),
		.SI(sofa_plus_ccff_15_Q),
		.Q(sofa_plus_ccff_16_Q),
		.CFGQN(mem_outb[16]),
		.CFGQ(mem_out[16]));

	sofa_plus_ccff sofa_plus_ccff_17_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(sofa_plus_ccff_16_Q),
		.SI(sofa_plus_ccff_16_Q),
		.Q(ccff_tail),
		.CFGQN(mem_outb[17]),
		.CFGQ(mem_out[17]));

endmodule
// ----- END Verilog module for frac_lut4_arith_sofa_plus_ccff_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sofa_plus_io_sofa_plus_ccff_mem -----
module sofa_plus_io_sofa_plus_ccff_mem(config_enable,
                                       pReset,
                                       prog_clk,
                                       ccff_head,
                                       ccff_tail,
                                       mem_out,
                                       mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:0] mem_out;
//----- OUTPUT PORTS -----
output [0:0] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(ccff_tail),
		.CFGQN(mem_outb),
		.CFGQ(mem_out));

endmodule
// ----- END Verilog module for sofa_plus_io_sofa_plus_ccff_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for frac_mult_18_18_sofa_plus_ccff_mem -----
module frac_mult_18_18_sofa_plus_ccff_mem(config_enable,
                                          pReset,
                                          prog_clk,
                                          ccff_head,
                                          ccff_tail,
                                          mem_out,
                                          mem_outb);
//----- GLOBAL PORTS -----
input [0:0] config_enable;
//----- GLOBAL PORTS -----
input [0:0] pReset;
//----- GLOBAL PORTS -----
input [0:0] prog_clk;
//----- INPUT PORTS -----
input [0:0] ccff_head;
//----- OUTPUT PORTS -----
output [0:0] ccff_tail;
//----- OUTPUT PORTS -----
output [0:0] mem_out;
//----- OUTPUT PORTS -----
output [0:0] mem_outb;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
// ----- END Local output short connections -----

	sofa_plus_ccff sofa_plus_ccff_0_ (
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SI(ccff_head),
		.Q(ccff_tail),
		.CFGQN(mem_outb),
		.CFGQ(mem_out));

endmodule
// ----- END Verilog module for frac_mult_18_18_sofa_plus_ccff_mem -----

//----- Default net type -----
`default_nettype wire




