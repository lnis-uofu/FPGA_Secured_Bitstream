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
    reg en    = 1'b0;
    reg clear = 1'b1;
    
    scan_chain uut
    (
    .clk         (clk  ),
    .data_i      (d    ),
    .en          (en   ),
    .clear       (clear),
    .data_o      (     )        
    );

    reg [9:0] bitstream = 5'b11011;
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

    en = 1'b0;
    d  = 1'b0;
    #period;
    en = 1'b1;
        
        
        
        
        
    // shift in    
    for(i = 0; i < 5; i = i + 1)
        begin
            d = bitstream[i];
            #period;
            if(i == 4)
            begin
                d  = 1'b0;
                en = 1'b0;
            end
        end

    #period;
    #period;
    en = 1'b1;
        
    // shift out
    for(i = 0; i < 5; i = i+1)
    begin 
        d = 1'b0;
        #period
        if(i == 4)
        begin
            d  = 1'b0;
            en = 1'b0;
        end
    end

    #period;
    #period;
    en = 1'b1;

    // shift in again
    for(i = 0; i < 5; i = i + 1)
        begin
            d = bitstream[i];
            #period;
            if(i == 4)
            begin
                en = 1'b0;
                d  = 1'b0;
            end
        end
        
    d = 1'b0;
    #period;
    #period;
        
    // clear shift register
    clear = 1'b0;
    #period;
    #period;
    #period;
        
    $stop;
    end
endmodule

