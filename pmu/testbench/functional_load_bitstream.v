


module functional_load_bitstream;


    reg [547:0] bitstream0  = 548'hf123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef012345678;
    reg [935:0] bitstream1  = 936'hf123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef0123456789;
    reg [255:0] bitstream2  = 256'hf123456789abcdef0123546789abcdef0123456789abcdef0123456789abcdef;
    reg [259:0] bitstream3  = 260'hf0123456789abcdef0123546789abcdef0123456789abcdef0123456789abcdef;
    reg [259:0] bitstream4  = 260'hf0123456789abcdef0123546789abcdef0123456789abcdef0123456789abcdef;


    reg [31:0] pmu_header0  = 32'h00000007; // 548 bits *
    reg [31:0] pmu_header1  = 32'h00000007; // 936 bits *
    reg [31:0] pmu_header2  = 32'h00000007; // 256 bits - 0 remainder *
    reg [31:0] pmu_header3  = 32'h00000007; // 256 bits - 1 remainder
    reg [31:0] pmu_header4  = 32'h00000007; // 128 bits - 124 remainder

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
        .clk_i(clk)
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


        
    integer i;


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
    for(i = 0; i < 32; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header0[i];
        #period;

    end
    for(i = 0; i < 548; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream0[i];
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

    // LOAD BITSTREAM 0: ================================
    // ==================================================
    end
    endtask

        
    // ==================================================
    // LOAD BITSTREAM: 1 ================================

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
    for(i = 0; i < 32; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header1[i];
        #period;

    end
    for(i = 0; i < 936; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream1[i];
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
    for(i = 0; i < 32; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header2[i];
        #period;

    end
    for(i = 0; i < 256; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream2[i];
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
    for(i = 0; i < 32; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header3[i];
        #period;

    end
    for(i = 0; i < 257; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream3[i];
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

    // LOAD BITSTREAM 3: ================================
    // ==================================================
    end
    endtask

    // ==================================================
    // LOAD BITSTREAM: 4 ================================

    // RESET 
    task load_bitstream4 ();
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
    for(i = 0; i < 32; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = pmu_header4[i];
        #period;

    end
    for(i = 0; i < 255; i = i + 1)
    begin
        tms_i = 0;
        tdi_i = bitstream4[i];
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

    // LOAD BITSTREAM 4: ================================
    // ==================================================
    end
    endtask

    
    initial begin 

    load_bitstream0;
    load_bitstream1;
    /* load_bitstream2; */
    /* load_bitstream3; */
    /* load_bitstream4; */


        
    $stop;
    end





endmodule
