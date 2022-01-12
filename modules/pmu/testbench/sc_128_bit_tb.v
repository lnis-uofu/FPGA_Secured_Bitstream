// THIS WILL BE THE TESTBENCH
//



module sc_128_bit_tb;

    reg clk = 1'b0;

    localparam period       = 20;
    localparam halfperiod   = 10;

    reg data_i = 0;
    reg en     = 0;

    reg [128+31:0] key       = 0;
    reg [128+35:0] bitstream = 0;
  
    
    
    pmu uut
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
        file  = $fopen("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_key_128.txt", "rb");
        count = $fscanf(file, "%b", key);
        $fclose(file);
        file  = $fopen("/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_bitstream.txt", "rb");
        count = $fscanf(file, "%b", bitstream);
        $fclose(file);
        $display("%b", bitstream[163:4]);
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
  
    for(i = 0; i < 161; i = i + 1)
    begin 
        data_i = bitstream[i];
        if(i == 160)
            data_i = 0;
        #period;
    end

    data_i = 1'b1;    
    
    #period;        
    #period;
    #period;
    #period;
    $stop;
        
    end

endmodule
