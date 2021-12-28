// THIS WILL BE THE TESTBENCH
//



module key_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    // in this bitstream there is an extra zero at MSB to "pad" such
    // that the data_i is always defined.

    //reg [163:0] bitstream0 = 164'h000102030405060708090a0b0c0d0e0f00000803;
    //reg [163:0] bitstream0 = 164'h4b472828ae05c3f72cb2c931c20273c400000803;
    reg [163:0] bitstream0   = 164'h13111d7fe3944a17f307a78b4d2b30c500000803;
    
    reg [163:0] bitstream1 = 164'h2c7e5c6a7cc71691e27230e0e451ac4300000800;
    
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
        data_i = bitstream0[i];
        #period;
    end

    en     = 1'b0;
    #period;
    #period;
    #period;
    #period;
    #period;
//    #period;
//    #period;
//    en = 1'b1;
//    #period;
//    for(i = 0; i < 161; i = i + 1)
//    begin
//        data_i = bitstream1[i];
//        #period;
//    end

//    en = 1'b0;
//    #period;
//    for(i = 0; i < 150; i = i + 1)
//    begin 
//        #period;
//    end
//    #period;
//    #period;
//    #period;
    $stop;
        
    end

endmodule
