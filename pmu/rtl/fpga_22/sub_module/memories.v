//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Memories used in FPGA
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size12_mem -----
module mux_tree_tapbuf_size12_mem(config_readback,
                                  config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[3];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size12_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size10_mem -----
module mux_tree_tapbuf_size10_mem(config_readback,
                                  config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[3];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size10_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size4_mem -----
module mux_tree_tapbuf_size4_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[2];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size4_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size8_mem -----
module mux_tree_tapbuf_size8_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[3];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size8_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size7_mem -----
module mux_tree_tapbuf_size7_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[2];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size7_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size9_mem -----
module mux_tree_tapbuf_size9_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[3];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size9_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size3_mem -----
module mux_tree_tapbuf_size3_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[1];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size3_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size2_mem -----
module mux_tree_tapbuf_size2_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[1];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size2_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size5_mem -----
module mux_tree_tapbuf_size5_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[2];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size5_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size11_mem -----
module mux_tree_tapbuf_size11_mem(config_readback,
                                  config_enable,
                                  pReset,
                                  prog_clk,
                                  ccff_head,
                                  ccff_tail,
                                  mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[3];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size11_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_tapbuf_size6_mem -----
module mux_tree_tapbuf_size6_mem(config_readback,
                                 config_enable,
                                 pReset,
                                 prog_clk,
                                 ccff_head,
                                 ccff_tail,
                                 mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[2];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

endmodule
// ----- END Verilog module for mux_tree_tapbuf_size6_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for mux_tree_size2_mem -----
module mux_tree_size2_mem(config_readback,
                          config_enable,
                          pReset,
                          prog_clk,
                          ccff_head,
                          ccff_tail,
                          mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[1];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

endmodule
// ----- END Verilog module for mux_tree_size2_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type ----
`default_nettype wire

// ----- Verilog module for CUSTOM_DATAFF_CUSTOM_CCFF_mem -----
module CUSTOM_DATAFF_CUSTOM_CCFF_mem(config_readback,
                                     config_enable,
                                     pReset,
                                     prog_clk,
                                     ccff_head,
                                     ccff_tail,
                                     mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[0];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out));

endmodule
// ----- END Verilog module for CUSTOM_DATAFF_CUSTOM_CCFF_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for frac_lut4_arith_CUSTOM_CCFF_mem -----
module frac_lut4_arith_CUSTOM_CCFF_mem(config_readback,
                                       config_enable,
                                       pReset,
                                       prog_clk,
                                       ccff_head,
                                       ccff_tail,
                                       mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[17];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out[0]));

	CUSTOM_CCFF CUSTOM_CCFF_1_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[0]),
		.SCD(mem_out[0]),
		.Q(mem_out[1]));

	CUSTOM_CCFF CUSTOM_CCFF_2_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[1]),
		.SCD(mem_out[1]),
		.Q(mem_out[2]));

	CUSTOM_CCFF CUSTOM_CCFF_3_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[2]),
		.SCD(mem_out[2]),
		.Q(mem_out[3]));

	CUSTOM_CCFF CUSTOM_CCFF_4_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[3]),
		.SCD(mem_out[3]),
		.Q(mem_out[4]));

	CUSTOM_CCFF CUSTOM_CCFF_5_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[4]),
		.SCD(mem_out[4]),
		.Q(mem_out[5]));

	CUSTOM_CCFF CUSTOM_CCFF_6_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[5]),
		.SCD(mem_out[5]),
		.Q(mem_out[6]));

	CUSTOM_CCFF CUSTOM_CCFF_7_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[6]),
		.SCD(mem_out[6]),
		.Q(mem_out[7]));

	CUSTOM_CCFF CUSTOM_CCFF_8_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[7]),
		.SCD(mem_out[7]),
		.Q(mem_out[8]));

	CUSTOM_CCFF CUSTOM_CCFF_9_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[8]),
		.SCD(mem_out[8]),
		.Q(mem_out[9]));

	CUSTOM_CCFF CUSTOM_CCFF_10_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[9]),
		.SCD(mem_out[9]),
		.Q(mem_out[10]));

	CUSTOM_CCFF CUSTOM_CCFF_11_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[10]),
		.SCD(mem_out[10]),
		.Q(mem_out[11]));

	CUSTOM_CCFF CUSTOM_CCFF_12_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[11]),
		.SCD(mem_out[11]),
		.Q(mem_out[12]));

	CUSTOM_CCFF CUSTOM_CCFF_13_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[12]),
		.SCD(mem_out[12]),
		.Q(mem_out[13]));

	CUSTOM_CCFF CUSTOM_CCFF_14_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[13]),
		.SCD(mem_out[13]),
		.Q(mem_out[14]));

	CUSTOM_CCFF CUSTOM_CCFF_15_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[14]),
		.SCD(mem_out[14]),
		.Q(mem_out[15]));

	CUSTOM_CCFF CUSTOM_CCFF_16_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[15]),
		.SCD(mem_out[15]),
		.Q(mem_out[16]));

	CUSTOM_CCFF CUSTOM_CCFF_17_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(mem_out[16]),
		.SCD(mem_out[16]),
		.Q(mem_out[17]));

endmodule
// ----- END Verilog module for frac_lut4_arith_CUSTOM_CCFF_mem -----

//----- Default net type -----
`default_nettype wire



//----- Default net type -----
`default_nettype wire

// ----- Verilog module for EMBEDDED_IO_ISOLN_CUSTOM_CCFF_mem -----
module EMBEDDED_IO_ISOLN_CUSTOM_CCFF_mem(config_readback,
                                         config_enable,
                                         pReset,
                                         prog_clk,
                                         ccff_head,
                                         ccff_tail,
                                         mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[0];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out));

endmodule
// ----- END Verilog module for EMBEDDED_IO_ISOLN_CUSTOM_CCFF_mem -----

//----- Default net type -----
`default_nettype wire




//----- Default net type -----
`default_nettype wire

// ----- Verilog module for frac_mult_18x18_CUSTOM_CCFF_mem -----
module frac_mult_18x18_CUSTOM_CCFF_mem(config_readback,
                                       config_enable,
                                       pReset,
                                       prog_clk,
                                       ccff_head,
                                       ccff_tail,
                                       mem_out);
//----- GLOBAL PORTS -----
input [0:0] config_readback;
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

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----



// ----- BEGIN Local short connections -----
// ----- END Local short connections -----
// ----- BEGIN Local output short connections -----
	assign ccff_tail[0] = mem_out[0];
// ----- END Local output short connections -----

	CUSTOM_CCFF CUSTOM_CCFF_0_ (
		.SCE(config_readback),
		.CFGE(config_enable),
		.RESET_B(pReset),
		.CLK(prog_clk),
		.D(ccff_head),
		.SCD(ccff_head),
		.Q(mem_out));

endmodule
// ----- END Verilog module for frac_mult_18x18_CUSTOM_CCFF_mem -----

//----- Default net type -----
`default_nettype wire




