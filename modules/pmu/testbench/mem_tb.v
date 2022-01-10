// THIS WILL BE THE TESTBENCH
//
//`include "bitstream.txt"

module mem_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
    reg pwr    = 0;
  


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
    .pwr_up_en      (pwr),
    .tdo            () 
    );

    integer i, count;
    integer file;
    integer bitd;

    initial 
    begin
        file  = $fopen("bitstream.txt", "rb");
        count = $fscanf(file, "%b" ,bitstream);
        $displayb(bitstream);
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


    for(i = 0; i < 1024+32; i = i + 1)
    begin 
        data_i = bitstream[i];
        #period;
    end

    data_i = 1'b0;    
    
    

    #period;
    en = 1'b0;

    #period;
    #period;
    #period;
    #period;
    #period;

    #period;
    #period;
    #period;
    #period;
    #period;

    pwr = 1'b1;
    
    #period;
    pwr = 1'b0;
    for(i = 0; i < 5000; i = i + 1)
    begin 
        #period;
    end

       

    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
