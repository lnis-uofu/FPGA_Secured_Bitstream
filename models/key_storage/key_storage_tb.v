


`timescale 1ns / 10ps

module key_storage_tb;

    reg clk = 1'b0;

    localparam period     = 20;
    localparam halfperiod = 10;
    
    reg key_write;
    reg [127:0] key_data_in;


    key_storage uut
    (
    .key_write(key_write),
    .key_data_in(key_data_in),
    .key_data_out()
    );

    initial
    begin
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end

    initial 
    begin
    #period;
    #period;
    #period;
    #period;
    
    key_data_in = 128'd 15884;
    key_write = 1'b1;
    
    #period;
    key_write = 1'b0;
    key_data_in = 128'd0;
    #period;
    #period;
    #period;
    #period;
    
    key_write = 1'b1;
    #period;
    #period;
    #period;
    
    $stop;

    end



endmodule



