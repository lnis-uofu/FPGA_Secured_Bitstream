
module key_tb_256;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;
  
    reg [256+31:0] key = 0;
    
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

    integer i;

    initial 
    begin
        file  = $fopen("../testbench/textfiles/key_256.txt", "rb");
        count = $fscan(file, "%b", bitstream);
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
    for(i = 0; i < 289; i = i + 1)
    begin 
        data_i = key[i];
        #period;
    end

    en     = 1'b0;
    #period;
    #period;
    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
