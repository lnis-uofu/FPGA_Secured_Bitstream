



module functional_push_bitstream;



    reg [31:0] pmu_header = 32'h00000017;



    
    localparam period     = 10;
    localparam halfperiod = 5;

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


    task push_bitstream ();
    begin 
    
    #period;
    rst_i = 0;
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
        tdi_i = pmu_header[i];
        #period;

    end

        for(i = 0; i < 2250; i = i + 1)
    begin

        #period;

    end

    for(i = 0; i < 5; i = i + 1)
    begin
        tms_i = tms_footer[i];
        tdi_i = tdi_footer[i];
        #period;
    end
    #(period * 10);


    end
    endtask


    initial begin 

    push_bitstream;



        
    $stop;
    end


endmodule
