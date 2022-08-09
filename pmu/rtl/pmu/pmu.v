




module pmu 
    (

    // Clock
    input  clk_i,

    //JTAG Interface   
    input  tms_i,
    input  tck_i,
    input  rst_i,
    input  tdi_i,
    output td_o,

    //2x2 FPGA Interface
    output progclk_o,
    output pReset_o,
    output fpga_rst,
    output fpga_clk_en,
    output data_o,
    input  ccff_tail_i,

    output key_ready,
    output core_ready,
    output locked,

    // AES INTERFACE
    output aes_reset_n_w,
    output aes_reset_dec_w,
    output aes_init_w,
    output aes_next_w,
    output [127:0] aes_key_w,
    output [127:0] aes_block_w,
        
    input  [127:0] aes_result_w,
    input  aes_key_ready,
    input  aes_result_valid_w,
   
    
    // SHA INTERFACE
    output sha_reset_n_w,
    output sha_cs_w,
    output sha_we_w,
    output sha_wc_w,
    output [02:0] sha_address_w,
    output [31:0] sha_write_data_w,
    input  sha_digest_valid_w

    );

    //PMU Wires
    wire pmu_tdi_w;
    wire pmu_tck_w;
    wire pmu_rst_w;
    wire pmu_en_w; 
    wire ccff_tail_o;

    
    tap_top tap_core_
    (
    .tms_i(tms_i),
    .tck_i(tck_i),
    .rst_ni(rst_i),
    .td_i(tdi_i),
    .td_o(td_o),

    .shift_dr_o(),
    .update_dr_o(),
    .capture_dr_o(),
    .scan_in_o(),

    .pmu_tdi_o(pmu_tdi_w),
    .pmu_tck_o(pmu_tck_w),
    .pmu_rst_o(pmu_rst_w),
    .pmu_en_o(pmu_en_w),

    .memory_out_i(),     // from reg1 module
    .fifo_out_i(),       // from reg2 module
    .confreg_out_i(),     // from reg3 module
    .clk_byp_out_i(),
    .observ_out_i(),

    .pmu_tdo_i(ccff_tail_o)
    );


    pmu_core pmu_core_
    (
    .clk_i(clk_i),
    .data_i(pmu_tdi_w),
    .rst_i(pmu_rst_w),
    .en_i(pmu_en_w),
    .tck_i(pmu_tck_w),
    .progclk_o(progclk_o),
    .pReset(pReset_o),
    .fpga_rst(fpga_rst),
    .fpga_clk(fpga_clk_en),
    .data_o(data_o),
    .data_ccff_i(ccff_tail_i),
    .data_ccff_o(ccff_tail_o),
    .aes_reset_n(aes_reset_n_w),
    .reset_dec(aes_reset_dec_w),
    .aes_init(aes_init_w),
    .aes_next(aes_next_w),
    .aes_key(aes_key_w),
    .aes_block(aes_block_w),
    .aes_result(aes_result_w),
    .aes_key_ready(aes_key_ready),
    .aes_result_valid(aes_result_valid_w),
    .sha_reset_n(sha_reset_n_w),
    .sha_cs(sha_cs_w),
    .sha_we(sha_we_w),
    .sha_wc(sha_wc_w),
    .sha_address(sha_address_w),
    .sha_write_data(sha_write_data_w),
    .digest_valid(sha_digest_valid_w),
    .key_ready_o(key_ready),
    .core_ready_o(core_ready),
    .locked_o(locked)
    );





endmodule
