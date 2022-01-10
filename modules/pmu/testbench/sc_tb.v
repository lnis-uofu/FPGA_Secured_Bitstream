// THIS WILL BE THE TESTBENCH
//
//`include "bitstream.txt"

module sc_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    // in this bitstream there is an extra zero at MSB to "pad" such
    // that the data_i is always defined.
    reg [163:0] key = 164'h0000102030405060708090a0b0c0d0e0f00000803;

    reg [1023+32:0] bitstream = 0;

    
    pmu 
    #(
    .HEADER_WIDTH   (32 ),
    .AES_DATA_WIDTH (128),
    .AES_LATENCY    (10 )
    )
    uut (
    .clk            (clk),
    .data_i         (data_i),
    .en             (en),
    .pwr_up_en      (),
    .tdo            () 
    );

    integer i, count;
    integer file;
    integer bitd;

    initial 
    begin
        file  = $fopen("bitstream.txt", "rb");
        count = $fscanf(file, "%b" ,bitstream);
        $fclose(file);
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

    for(i = 0; i < 1024+32; i = i + 1)
    begin 
        data_i = bitstream[i];
        #period;
    end

    data_i = 1'b0;    
    
    
    for(i = 0; i < 200; i = i + 1)
    begin 
        if(i == 128)
        begin
            en = 1'b0;
        end
        #period;
    end
        
    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
