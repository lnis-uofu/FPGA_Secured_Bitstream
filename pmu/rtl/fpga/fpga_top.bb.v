(* blackbox *)
module fpga_top (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

//----- GLOBAL PORTS -----
input [0:0] clk,
//----- GLOBAL PORTS -----
input [0:0] reset,
//----- GLOBAL PORTS -----
input [0:0] pReset,
//----- GLOBAL PORTS -----
input [0:0] prog_clk,
//----- GLOBAL PORTS -----
input [0:0] Test_en,
//----- GLOBAL PORTS -----
input [0:0] IO_ISOL_N,
//----- GPIN PORTS -----
input [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_IN,
//----- GPOUT PORTS -----
output [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT,
//----- GPOUT PORTS -----
output [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR,
//----- INPUT PORTS -----
input [0:0] ccff_head,
//----- OUTPUT PORTS -----
output [0:0] ccff_tail
);

endmodule
