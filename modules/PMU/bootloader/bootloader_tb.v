//bootloader tb
//


module bootloader_tb;

    reg clk = 1'b0;

    localparam period     = 20;
    localparam halfperiod = 10;

    reg [ 7:0] addr_i = 0;
    reg [31:0] len_i = 0;
    reg en = 0, rw = 0, clr = 1;
    
    bootloader uut
    (
    .clk                    (clk    ),
    .addr_i                 ( addr_i),
    .len_i                  (  len_i),
    .rw                     (     rw),
    .clr                    (    clr),
    .addr_o                 (       ),
    .len_o                  (       )
    );

    initial
    begin 
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end

    initial 
    begin 
    
    clr = 1'b0; 
    #period;

    addr_i = 8'd3;
    len_i  = 32'd400;

    #period;


    #period;
    rw = 1'b1;

    #period;
    #period;
    #period;

    rw = 1'b0;
    #period

    clr = 1'b1;
    #period;
    clr = 1'b0;
    #period;
        
    $stop;
        
    end











endmodule
    
