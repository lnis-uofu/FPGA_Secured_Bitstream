




module pmu 
    (
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
    output locked
    );

    //PMU Wires
    wire pmu_tdi_w;
    wire pmu_tck_w;
    wire pmu_rst_w;
    wire pmu_en_w;

    //AES Wires
    wire aes_reset_n_w;
    wire aes_reset_dec_w;
    wire aes_init_w;
    wire aes_next_w;
    wire [127:0] aes_key_w;
    wire [127:0] aes_block_w;
    wire [127:0] aes_result_w;
    wire aes_result_valid_w;
    wire ready_w;

    //SHA Wires
    wire sha_reset_n_w;
    wire sha_cs_w; 
    wire sha_we_w;
    wire sha_wc_w;
    wire [02:0] sha_address_w;
    wire [31:0] sha_write_data_w;
    wire sha_digest_valid_w;

    //MEM Wires
    wire [31:0] mem_data_o_w;

    assign mem_data_o = mem_data_o_w;
    
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
    .clk_i(clk_i)
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
    .aes_key_ready(ready_w),
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

    aes_core aes_core_
    (
    .clk(tck_i),
    .reset_n(aes_reset_n_w),
    .reset_dec(aes_reset_dec_w),
    .init(aes_init_w),
    .next(aes_next_w),
    .key(aes_key_w),
    .block(aes_block_w),
    .result(aes_result_w),
    .key_ready(ready_w),
    .result_valid(aes_result_valid_w)
    );

    sha256   sha256_
    (
    .clk(tck_i),
    .reset_n(sha_reset_n_w),
    .cs(sha_cs_w),
    .we(sha_we_w),
    .wc(sha_wc_w),
    .address(sha_address_w),
    .write_data(sha_write_data_w),
    .digest_valid(sha_digest_valid_w)
    );




endmodule
