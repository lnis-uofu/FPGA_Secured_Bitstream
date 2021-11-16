




module address_generator_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;


    reg [39:0] data_i;
    
    address_generator uut
    (
    .data_i         (data_i),
    .addr_o               (),
    .data_o               ()
    );


    initial 
    begin
        clk = 0;
        forever
            #halfperiod clk = ~clk;
    end

    initial
    begin

    data_i = 0;
    
    #period;
    #period;

        data_i = 40'b0000000000000000110000000000000010101010;

    #period;

        data_i = 40'b1100000000000000000000000000011100010000;

    #period;

        $stop;
    end
endmodule

