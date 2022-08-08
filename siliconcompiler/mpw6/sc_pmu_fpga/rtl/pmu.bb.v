(* blackbox *)
module pmu (

    inout vpp,	// User area 1 1.8V supply
    inout gnd,	// User area 1 digital ground
    //JTAG Interface   
    input  tms_i,
    input  tck_i,
    input  rst_i,
    input  tdi_i,
    output td_o,

    //NVM  Interface
    input  [31:0] mem_data_i,
    output [31:0] mem_data_o,
    output [7:0] mem_address_o,
    output mem_we_o,
    output mem_clk_o,

    //2x2 FPGA Interface
    output progclk_o,
    output pReset_o,
    output fpga_rst,
    output fpga_clk_en,
    output data_o,
    input  ccff_tail_i,

    output key_ready,
    output core_ready,
    output locked
    );
endmodule
