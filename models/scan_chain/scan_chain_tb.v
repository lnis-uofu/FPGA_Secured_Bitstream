//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//
//      File Name       : scan_chain_tb.v
//      Brief           : testbench for mock scan chain
//
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//



`timescale 1ns / 10ps


module scan_chain_tb;

    reg clk = 1'b0;

    localparam period      = 20;
    localparam halfperiod  = 10;

    reg d;
    reg out;
    reg en;
    reg clear;
    
    scan_chain uut
    (
    .pmu_tck_in(clk),
    .sc_data_in(d),
    .sc_en(en),
    .clear(clear),
    .sc_data_out()        
    );

    reg [9:0] bitstream = 10'b1011011011;
    integer i;
    // Start of simulation
    initial
    begin
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end
    
    initial 
    begin

    en = 1'b1;

    // shift in    
    for(i = 0; i < 11; i = i + 1)
        begin
            d = bitstream[i];
            #period;
            if(i == 9)
                en = 1'b0;
        end

    #period;
    #period;

    en = 1'b1;
    // shift out
    for(i = 0; i < 11; i = i+1)
    begin 
        d = 1'b0;
        #period
        if(i == 9)
            en = 1'b0;
    end

    #period;
    
    // shift in again
    en = 1'b1;
    for(i = 0; i < 11; i = i + 1)
        begin
            d = bitstream[i];
            #period;
            if(i == 9)
                en = 1'b0;
        end
    
    #period;
    // clear shift register
    clear = 1'b1;
    #period;
    #period;
    #period;
        
    $stop;
    end
endmodule

