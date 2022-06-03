








`timescale 1 ns / 1 ps
`define UNIT_DELAY #0


module functional_fpga;



    localparam period     = 100;
    localparam halfperiod = 50;
    reg clk = 1'b0;

    reg o_clk_en = 0; 
    reg p_clk_en = 0;
    reg pReset = 0;
    reg fpga_rst = 0;
    reg test_en = 0;
    reg IO = 0;
    reg data_o = 0;
    
    wire [23:0] IN;
    wire [23:0] OUT;

    assign IN  = {24 {1'b0}};
    assign OUT = {24 {1'b0}};

        fpga_top fpga_top_
        (
        .clk(clk & o_clk_en),
        .reset(fpga_rst),
        .pReset(pReset),
        .prog_clk(clk & p_clk_en),  ///prog_clk
        .Test_en(test_en),
        .IO_ISOL_N(IO),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_IN(IN),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT(),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(OUT),
        .ccff_head(data_o),
        .ccff_tail()
        );





    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    //FPGA Test    
    initial begin 


    #period;
    #period;
    pReset   = 1;
    fpga_rst = 1;
    #period;
    pReset   = 1;
    fpga_rst = 1;

    #period;

    #halfperiod;
    data_o = 1;
    #halfperiod;
    p_clk_en = 1;
    #period;
    #halfperiod
    data_o = 0;
    #halfperiod;

    for(i = 0; i  < 2281; i = i + 1)
    begin 
        #period;
    end

    #period;
    #period;
    
    $stop;
    
    end
    
endmodule

