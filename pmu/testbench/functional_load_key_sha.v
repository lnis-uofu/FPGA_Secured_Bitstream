`timescale 1 ns / 1 ps
`define UNIT_DELAY #10
`define FPGA_IO_SIZE 24


module functional_load_key_sha;

    reg [547-1:0] temp_tdi;
    reg [547-1:0] temp_tms;
  
    localparam period     = 100;
    localparam halfperiod = 50;
    reg clk = 1'b0;

    // MEM Wires
    wire mem_clk, mem_we;
    wire [31:0] mem_data_i, mem_data_o;
    wire [7:0]  mem_address;
    
    
    // FPGA Wires
    wire config_enable_w;
    wire prog_clk;
    //wire pReset;
    //wire data_o;
    wire ccff_w;
    wire pReset;

     // AES WIRES
    wire aes_reset_n_w;
    wire aes_reset_dec_w;
    wire aes_init_w;
    wire aes_next_w;
    wire aes_wc_w;
    wire aes_we_w;
    wire [1:0]  aes_address_w;
    wire [31:0] aes_write_data_w;
    wire [31:0] aes_read_data_w;

    // SHA WIRES
    wire sha_reset_n_w;
    wire sha_cs_w;
    wire sha_we_w;
    wire sha_wc_w;
    wire [2:0] sha_address_w;
    wire [31:0] sha_write_data_w;
    wire sha_digest_valid_w;

    // TEST REGISTERS
    //
    //PMU
    reg tms_i    = 0;
    reg rst_i    = 1;
    reg tdi_i    = 0;
    //FPGA
    wire fpga_rst;
    reg test_en    = 0;
    assign OUT = {23 {1'b0}};
    reg IO         = 0;
    reg p_clk = 0;
    wire data_o; 

 
    //this needs to be added as a pmu output:

    
    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_IN;
    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT;
    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR;

	assign gfpga_pad_EMBEDDED_IO_HD_SOC_IN[0:`FPGA_IO_SIZE - 1] = {`FPGA_IO_SIZE {1'b0}};
	assign gfpga_pad_EMBEDDED_IO_HD_SOC_OUT[0:`FPGA_IO_SIZE - 1] = {`FPGA_IO_SIZE {1'b0}};

    reg fpga_o_clk_en = 0;
    
    
         pmu pmu_
        (
        .tms_i(tms_i),
        .tck_i(clk),
        .rst_i(rst_i),
        .tdi_i(tdi_i),
        .td_o(),
        .config_enable(config_enable_w),
        .progclk_o(prog_clk),
        .pReset_o(pReset),
        .fpga_rst(fpga_rst),
        .fpga_clk_en(fpga_clk_en),
        .data_o(data_o),
        .ccff_tail_i(ccff_wire),
        .key_ready(),
        .core_ready(),
        .locked(),
        .aes_reset_n(aes_reset_n_w),
        .reset_dec(aes_reset_dec_w),
        .aes_init(aes_init_w),
        .aes_next(aes_next_w),
        .aes_wc(aes_wc_w),
        .aes_we(aes_we_w),
        .aes_address(aes_address_w),
        .aes_write_data(aes_write_data_w),
        .aes_read_data(aes_read_data_w),
        .aes_result_valid(aes_result_valid_w),
        .aes_key_ready(aes_ready_w),
        .sha_reset_n_w(sha_reset_n_w),
        .sha_cs_w(sha_cs_w), 
        .sha_we_w(sha_we_w),
        .sha_wc_w(sha_wc_w),
        .sha_address_w(sha_address_w),
        .sha_write_data_w(sha_write_data_w),
        .sha_digest_valid_w(sha_digest_valid_w)
        );

        aes aes128_
        (
        .clk(clk),
        .reset_n(aes_reset_n_w),
        .reset_dec(aes_reset_dec_w),
        .init(aes_init_w),
        .next(aes_next_w),
        .wc(aes_wc_w),
        .we(aes_we_w),
        .address(aes_address_w),
        .write_data(aes_write_data_w),
        .read_data(aes_read_data_w),
        .key_ready(aes_ready_w),
        .result_valid(aes_result_valid_w)
        );
       
        sha256 sha256_
        (
        .clk(clk),
        .reset_n(sha_reset_n_w),
        .cs(sha_cs_w),
        .we(sha_we_w),
        .wc(sha_wc_w),
        .address(sha_address_w),
        .write_data(sha_write_data_w),
        .digest_valid(sha_digest_valid_w)
        );

        fpga_top fpga_top_
        (
        .clk(clk & fpga_o_clk_en),
        .reset(fpga_rst), 
        .config_enable(config_enable_w),
        .pReset(pReset),
        .prog_clk(prog_clk),  ///prog_clk
        .Test_en(test_en),
        .IO_ISOL_N(IO),
		.gfpga_pad_sofa_plus_io_SOC_IN(gfpga_pad_EMBEDDED_IO_HD_SOC_IN[0:`FPGA_IO_SIZE - 1]),
		.gfpga_pad_sofa_plus_io_SOC_OUT(gfpga_pad_EMBEDDED_IO_HD_SOC_OUT[0:`FPGA_IO_SIZE - 1]),
		.gfpga_pad_sofa_plus_io_SOC_DIR(gfpga_pad_EMBEDDED_IO_HD_SOC_DIR[0:`FPGA_IO_SIZE - 1]),        
        .ccff_head(data_o),
        .ccff_tail(ccff_wire)
        );


    integer i, file, count, tdi, tms;
    
    initial begin 
        file  = $fopen("../../scripts/outputs/output.txt", "rb");
        count = $fscanf(file, "%b %b", temp_tdi, temp_tms);
    end

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end




    initial begin
    // RESET 
        #period;
        rst_i = 0;
        #period;
        rst_i = 1;
        #period;
    // INSTRUCTION
        for(i = 0; i < 547; i = i + 1)
        begin 
            tdi_i = temp_tdi[i];
            tms_i = temp_tms[i];
            #period;
        end
        #(period * 10);
    $stop;
    end

  
endmodule 
