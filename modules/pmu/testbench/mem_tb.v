
module mem_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
    reg pwr    = 0;
  


    reg [128+63:0] bitstream = 0;

    
    pmu 
    #(
    .HEADER_WIDTH   (64 ),
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
        file  = $fopen("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_bitstream.txt", "rb");
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


    for(i = 0; i < 193; i = i + 1)
    begin 
        data_i = bitstream[i];
        if(i == 192)
            data_i = 0;
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
    for(i = 0; i < 1000; i = i + 1)
    begin 
        #period;
    end

       
    $stop;
        
    end

endmodule
