(* blackbox *)
module fpga_top(


inout vpp,	// User area 1 1.8V supply
inout gnd,	// User area 1 digital ground

input clk,
input reset,
input config_enable,
input pReset,
input prog_clk,
input Test_en,
input IO_ISOL_N,
input [0:23] gfpga_pad_sofa_plus_io_SOC_IN,
output [0:23] gfpga_pad_sofa_plus_io_SOC_OUT,
output [0:23] gfpga_pad_sofa_plus_io_SOC_DIR,
input ccff_head,
output ccff_tail
);

endmodule



