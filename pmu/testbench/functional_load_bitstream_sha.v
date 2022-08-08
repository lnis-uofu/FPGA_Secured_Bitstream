


module functional_load_bitstream_sha;


    reg [255:0] bitstream0     = 256'h0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef;
    reg [255:0] digest0        = 256'h45dfe6e66598cc97357865bd21a9c224f0b3e544b2663ee26683e82158dc0753;
    
    reg [255:0] pmu_header0    = 256'hff484953495354480123456789abcdef0123456789abcdefff48495300120099; // 548 bits *
    reg [255:0] header_digest0 = 256'h5215c97f254c5a00e92e67ce44eccb0c0429b2d30422f0f48ae3a6eb759fade7;

    reg [255:0] fail_digest    = 256'h45dfe6e66598cc97357865bd21a9c224f1b3e544b2663ee26683e82158dc0753;


    reg [255:0] pmu_header1    = 256'hff484953495354480123456789abcdef0123456789abcdefff484953001400f9; // 936 bits *
    reg [255:0] header_digest1 = 256'h30f0d6d5db3ffef61b84b6d515cd38e26546cdb4be2f96ddeb32aa9c4e6f618d;


    reg [255:0] pmu_header2    = 256'hff484953495354480123456789abcdef0123456789abcdefff48495300098239; // 2250 bits * 
    reg [255:0] header_digest2 = 256'h31542799882b9723918838ab1357413ca2a28c667df828e4cb6f0e86d6d4dc67;





    localparam period     = 100;
    localparam halfperiod = 50;

    // MEM Wires
    wire mem_clk, mem_we;
    wire [31:0] mem_data_i, mem_data_o;
    wire [7:0]  mem_address;
    
    reg clk = 0; 
    // FPGA Wires
    wire prog_clk;
    //wire pReset;
    //wire data_o;
    wire ccff_w;
    wire pReset;

    // TEST REGISTERS
    //
    //PMU
    reg tms_i    = 0;
    reg rst_i    = 1;
    reg tdi_i    = 0;
    //FPGA
    wire fpga_rst;
    //reg pReset     = 1;
    reg test_en    = 0;
    assign OUT = {23 {1'b0}};
    reg IO         = 0;
    reg p_clk = 0;
    wire data_o; 

    wire fpga_clk_en;

    //this needs to be added as a pmu output:
    reg fpga_o_clk_en = 0;



    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_IN;
    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT;
    wire [0:`FPGA_IO_SIZE - 1] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR;

	assign gfpga_pad_EMBEDDED_IO_HD_SOC_IN[0:`FPGA_IO_SIZE - 1] = {`FPGA_IO_SIZE {1'b0}};
	assign gfpga_pad_EMBEDDED_IO_HD_SOC_OUT[0:`FPGA_IO_SIZE - 1] = {`FPGA_IO_SIZE {1'b0}};

        pmu pmu_
        (
        .clk_i(clk),
        .tms_i(tms_i),
        .tck_i(clk),
        .rst_i(rst_i),
        .tdi_i(tdi_i),
        .td_o(),
        .progclk_o(prog_clk),
        .pReset_o(pReset),
        .fpga_rst(fpga_rst),
        .fpga_clk_en(fpga_clk_en),
        .data_o(data_o),
        .ccff_tail_i(ccff_wire),
        .key_ready(),
        .core_ready(),
        .locked()
        );

        mem mem_
        (
        .clk(mem_clk),
        .we(mem_we),
        .data_i(mem_data_o),
        .address(mem_address),
        .data_o(mem_data_i)
        );

        /* fpga_top fpga_top_ */
        /* ( */
        /* .clk(clk & fpga_o_clk_en), */
        /* .reset(fpga_rst), //and another wire coming from top caravel level */
        /* .pReset(pReset), */
        /* .prog_clk(prog_clk),  ///prog_clk */
        /* .Test_en(test_en), */
        /* .IO_ISOL_N(IO), */
		/* .gfpga_pad_EMBEDDED_IO_HD_SOC_IN(gfpga_pad_EMBEDDED_IO_HD_SOC_IN[0:`FPGA_IO_SIZE - 1]), */
		/* .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT(gfpga_pad_EMBEDDED_IO_HD_SOC_OUT[0:`FPGA_IO_SIZE - 1]), */
		/* .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(gfpga_pad_EMBEDDED_IO_HD_SOC_DIR[0:`FPGA_IO_SIZE - 1]), */        
        /* .ccff_head(data_o), */
        /* .ccff_tail(ccff_wire) */
        /* ); */


        
    integer i, j;


    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end


    // JTAG HEADER/FOOTER ==================
    reg [10:0] tdi_header = 11'b01101100000;
    reg [4:0] tdi_footer  =  5'b00000;
    reg [10:0] tms_header = 11'b11000000110;
    reg [4:0] tms_footer  =  5'b11111;
    // JTAG HEADER/FOOTER ==================




    // ==================================================
    // LOAD BITSTREAM: 0 ================================

    // RESET 
    task load_bitstream0 ();
    begin
    #period;
    rst_i = 0;
    #period;
    #period;
    rst_i = 1;

    //LOAD JTAG HEADER
    #period;

    for(i = 0; i < 11; i = i + 1)
    begin
        tms_i = tms_header[i];
        tdi_i = tdi_header[i];
        #period;
    end
     // =================
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header0[i];
        #period;

    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = header_digest0[i];
        #period;
    end

    load_256_bits;
    load_256_bits;
    load_256_bits;
        
    //LOAD JTAG FOOTER
    for(i = 0; i < 5; i = i + 1)
    begin
        tms_i = tms_footer[i];
        tdi_i = tdi_footer[i];
        #period;
    end
    #period;
    // =================

    // LOAD BITSTREAM 0: ================================
    // ==================================================
    end
    endtask

    // LOAD BITSTREAM: 1 ================================
    // SHA FAILING
    // RESET 
    task load_bitstream1 ();
    begin
    #period;
    rst_i = 0;
    #period;
    #period;
    rst_i = 1;

    //LOAD JTAG HEADER
    #period;

    for(i = 0; i < 11; i = i + 1)
    begin
        tms_i = tms_header[i];
        tdi_i = tdi_header[i];
        #period;
    end
     // =================
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header0[i];
        #period;

    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = header_digest0[i];
        #period;
    end

    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream0[i];
        #period;
    end
        for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = digest0[i];
        #period;
    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream0[i];
        #period;
    end
        for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = fail_digest[i];
        #period;
    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream0[i];
        #period;
    end
        for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = digest0[i];
        #period;
    end


        
    //LOAD JTAG FOOTER
    for(i = 0; i < 5; i = i + 1)
    begin
        tms_i = tms_footer[i];
        tdi_i = tdi_footer[i];
        #period;
    end
    #period;
    // =================

    // LOAD BITSTREAM 1: ================================
    // ==================================================
    end
    endtask

      

    // ==================================================
    // LOAD BITSTREAM: 2 ================================

    // RESET 
    task load_bitstream2 ();
    begin
    #period;
    rst_i = 0;
    #period;
    #period;
    rst_i = 1;

    //LOAD JTAG HEADER
    #period;

    for(i = 0; i < 11; i = i + 1)
    begin
        tms_i = tms_header[i];
        tdi_i = tdi_header[i];
        #period;
    end
     // =================
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header1[i];
        #period;

    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = header_digest1[i];
        #period;
    end

    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
        
    //LOAD JTAG FOOTER
    for(i = 0; i < 5; i = i + 1)
    begin
        tms_i = tms_footer[i];
        tdi_i = tdi_footer[i];
        #period;
    end
    #period;
    // =================

    // LOAD BITSTREAM 2: ================================
    // ==================================================
    end
    endtask

    // ==================================================
    // LOAD BITSTREAM: 3 ================================

    // RESET 
    task load_bitstream3 ();
    begin
    #period;
    rst_i = 0;
    #period;
    #period;
    rst_i = 1;

    //LOAD JTAG HEADER
    #period;

    for(i = 0; i < 11; i = i + 1)
    begin
        tms_i = tms_header[i];
        tdi_i = tdi_header[i];
        #period;
    end
     // =================
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header2[i];
        #period;

    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = header_digest2[i];
        #period;
    end


    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;
    load_256_bits;

    //LOAD JTAG FOOTER
    for(i = 0; i < 5; i = i + 1)
    begin
        tms_i = tms_footer[i];
        tdi_i = tdi_footer[i];
        #period;
    end
    #period;
    // =================

    // LOAD BITSTREAM 3: ================================
    // ==================================================
    end
    endtask

    task load_256_bits ();
        begin 


        for(i = 0; i < 256; i = i + 1)
        begin
            tms_i = 0;
            tdi_i = bitstream0[i];
            #period;
        end
        for(i = 0; i < 256; i = i + 1)
        begin
            tms_i = 0;
            tdi_i = digest0[i];
            #period;
        end

        end
    endtask


    
    initial begin 

    //load_bitstream0;
    //load_bitstream1;
    //load_bitstream2;
    load_bitstream3;


        
    $stop;
    end





endmodule
