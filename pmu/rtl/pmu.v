




module pmu 
    (

    //JTAG Interface   
    input  tms_i,
    input  tck_i,
    input  rst_i,
    input  tdi_i,
    output td_o,

    //NVM  Interface
    input  [31:0] mem_data_i,
    output [31:0] mem_data_o,
    output [07:0] mem_address_o,
    output mem_we_o,
    output mem_clk_o,

    //2x2 FPGA Interface
    output progclk_o,
    output pReset_o,
    output data_o,
    input  ccff_tail_i
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

    //SHA Wires
    wire sha_reset_n_w;
    wire sha_init_w;
    wire sha_next_w;
    wire sha_mode_w;
    wire [255:0] sha_block_w;
    wire sha_ready_w;
    wire [255:0] sha_digest_w;
    wire sha_digest_valid_w;

    //MEM Wires
    wire [31:0] mem_data_o_w;

    assign mem_data_o = mem_data_o_w;
    
    wire ccff_tail_o;
    assign td_o = ccff_tail_o;

    
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
    .data_i(pmu_tdi_w),
    .rst_i(pmu_rst_w),
    .en_i(pmu_en_w),
    .tck_i(pmu_tck_w),
    .progclk_o(progclk_o),
    .pReset(pReset_o),
    .data_o(data_o),
    .data_ccff_i(ccff_tail_i),
    .data_ccff_o(ccff_tail_o),
    .mem_data_in(mem_data_i),
    .mem_address_o(mem_address_o),
    .mem_data_o(mem_data_o_w),
    .mem_we(mem_we_o),
    .mem_clk(mem_clk_o),
    .aes_reset_n(aes_reset_n_w),
    .reset_dec(aes_reset_dec_w),
    .aes_init(aes_init_w),
    .aes_next(aes_next_w),
    .aes_key(aes_key_w),
    .aes_block(aes_block_w),
    .aes_result(aes_result_w),
    .aes_result_valid(aes_result_valid_w),
    .sha_reset_n(sha_reset_n_w),
    .sha_init(sha_init_w),
    .sha_next(sha_next_w),
    .sha_mode(sha_mode_w),
    .sha_block(sha_block_w),
    .sha_ready(sha_ready_w),
    .digest(sha_digest_w),
    .digest_valid(sha_digest_valid_w)
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
    .result_valid(aes_result_valid_w)
    );

    sha256_core   sha256_core_
    (
    .clk(tck_i),
    .reset_n(sha_reset_n_w),
    .init(sha_init_w),
    .next(sha_next_w),
    .mode(sha_mode_w),
    .block(sha_block_w),
    .ready(sha_ready_w),
    .digest(sha_digest_w),
    .digest_valid(sha_digest_valid_w)
    );




endmodule
