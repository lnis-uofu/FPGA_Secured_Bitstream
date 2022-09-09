


(* blackbox *)

module pmu
    (
    inout vpp,  // User area 1 1.8V supply
    inout gnd,  // User area 1 digital ground
    // Clock

    //JTAG Interface
    input  tms_i,
    input  tck_i,
    input  rst_i,
    input  tdi_i,
    output td_o,

    //2x2 FPGA Interface
    output config_enable,
    output progclk_o,
    output pReset_o,
    output fpga_rst,
    output fpga_clk_en,
    output data_o,
    input  ccff_tail_i,

    output key_ready,
    output core_ready,
    output locked,

    //AES PORTS
    output aes_reset_n,
    output reset_dec,
    output aes_init,
    output aes_next,
    output aes_wc,
    output aes_we,
    output [1:0]  aes_address,
    output [31:0] aes_write_data,

    input  [31:0] aes_read_data,
    input  aes_key_ready,
    input  aes_result_valid,


    // SHA INTERFACE
    output sha_reset_n_w,
    output sha_cs_w,
    output sha_we_w,
    output sha_wc_w,
    output [02:0] sha_address_w,
    output [31:0] sha_write_data_w,
    input  sha_digest_valid_w

    );





endmodule
