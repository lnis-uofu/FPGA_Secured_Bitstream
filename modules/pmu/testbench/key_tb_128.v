
module key_tb_128;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    reg [128+31:0] key = 0;
    
    pmu 
    #(
    .HEADER_WIDTH   (32),
    .AES_DATA_WIDTH (128),
    .AES_LATENCY    (10)
    )
    uut
    (
    .clk            (clk),
    .data_i         (data_i),
    .en             (en),
    .pwr_up_en      (),
    .tdo            () 
    );

    integer i, file, count;

    initial 
    begin
        file  = $fopen("../testbench/textfiles/encoded_key_128.txt", "rb");
        count = $fscanf(file, "%b", key);
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
    for(i = 0; i < 161; i = i + 1)
    begin 
        data_i = key[i];
        if(i == 160)
            data_i = 0;
        #period;
    end
    en     = 1'b0;
    data_i = 0;

    
    for(i = 0; i < 130; i = i + 1)
    begin 
        #period;
    end
    $stop;
        
    end

endmodule
