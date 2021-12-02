// THIS WILL BE THE TESTBENCH
//



module pmu_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    // in this bitstream there is an extra zero at MSB to "pad" such
    // that the data_i is always defined.
    reg [163:0] bitstream = 164'h0123456789abcdef0123456789abcdef00000803;

    
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
    for(i = 0; i < 161; i = i + 1)
    begin 
        data_i = bitstream[i];
        #period;
    end

    en     = 1'b0;
    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
