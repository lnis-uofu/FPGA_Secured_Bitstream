// THIS WILL BE THE TESTBENCH
//



module pmu_tb;

    parameter  KEY_LENGTH       = 128;
    parameter  BITSTREAM_LENGTH = 128;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i    = 1'b0;
    reg en        = 1'b0;
    reg clk       = 1'b0;
    reg pwr_up_en = 1'b1;
    reg rst       = 1'b1;
    
    reg [KEY_LENGTH-1   :0]                 inv_key = 0;
    reg [KEY_LENGTH-1   :0]                     key = 0;
    reg [KEY_LENGTH-1+64:0]             encoded_key = 0; 
    reg [BITSTREAM_LENGTH-1+64:0] encoded_bitstream = 0; //This is also encrypted
    reg [BITSTREAM_LENGTH-1   :0]         bitstream = 0;
    
    
    pmu uut
    (
    .clk            (clk),
    .data_i         (data_i),
    .en             (en),
    .pwr_up_en      (pwr_up_en),
    .rst            (rst),
    .program_complete(),
    .tdo            () 
    );

    integer i, file, count;

    initial 
    begin
        file  = $fopen("../testbench/textfiles/encoded_key_128.txt"  , "rb");
        count = $fscanf(file, "%b", encoded_key);
        $fclose(file);
        file  = $fopen("../testbench/textfiles/encoded_bitstream.txt", "rb");
        count = $fscanf(file, "%b", encoded_bitstream);
        $fclose(file);
        file  = $fopen("../testbench/textfiles/bitstream.txt"        , "rb");
        count = $fscanf(file, "%b", bitstream);
        $fclose(file);
        file  = $fopen("../testbench/textfiles/inv_key.txt"          , "rb");
        count = $fscanf(file, "%b", inv_key);
        $fclose(file);
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial 
    begin
   
    #period;
    rst = 1'b0;
    #period;
    rst = 1'b1;
    #period;
    #period;
    #period;
    en = 1'b1;
    #period;
    for(i = 0; i < 193; i = i + 1)
    begin 
        data_i = encoded_key[i];
        if(i == 192)
            data_i = 0;
        #period;
    end

    en = 1'b0;
    #period;
    #period;
    #period;
    #period;
    en = 1'b1;
    #period;
  
    for(i = 0; i < 193; i = i + 1)
    begin 
        data_i = encoded_bitstream[i];
        if(i == 192)
        data_i = 0;
        #period;
    end
    
    #period;
    en = 1'b0;
    
    // Change instruction to load memory
    encoded_bitstream[3:0] = 4'b0001;
    
         
    for(i = 0; i < 138; i = i + 1)
    begin
        #period;
    end

    en = 1'b1; 
    #period;
    #period;


    for(i = 0; i < 193; i = i + 1)
    begin
        data_i = encoded_bitstream[i];
        if(i == 192)
        data_i = 0;
        #period;
    end

    #period;
    #period;
    #period;
    en = 1'b0;
 
    for(i = 0; i < 33; i = i + 1)
    begin
        #period;
    end

    #period;
    #period;
    #period;

        
    pwr_up_en = 1'b0;
    #period;
    pwr_up_en = 1'b1;

    for(i = 0; i < 200; i = i + 1)
    begin
        #period;
    end
    

    $stop;
        
    end

endmodule
