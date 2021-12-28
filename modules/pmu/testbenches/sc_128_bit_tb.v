// THIS WILL BE THE TESTBENCH
//



module sc_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    // in this bitstream there is an extra zero at MSB to "pad" such
    // that the data_i is always defined.
    reg [163:0] key = 164'h0000102030405060708090a0b0c0d0e0f00000803;
    reg [417:0] bitstream = 418'h54686973206973206120746f7020736563726574203132382d6269742062697473747265616d20666f7220616e204650474120636f72652054686973206973206120746f7020736563726574203132382d6269742062697473747265616d20666f7220616e204650474120636f72652054686973206973206120746f7020736563726574203132382d6269742062697473747265616d20666f7220616e204650474120636f72652e205665727920536563757265640000000000000000000000000015c0;
    
    pmu uut
    (
    .clk            (clk),
    .data_i         (data_i),
    .en             (en),
    .pwr_up_en      (),
    .tdo            () 
    );

    integer i;

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
    en = 1'b1;
    #period;
    for(i = 0; i < 164; i = i + 1)
    begin 
        data_i = key[i];
        #period;
    end

    for(i = 0; i < 419; i = i + 1)
    begin 
        data_i = bitstream[i];
        #period;
    end

    data_i = 1'b1;    
    
    
    for(i = 0; i < 800; i = i + 1)
    begin 
        #period;
    end
        
    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
