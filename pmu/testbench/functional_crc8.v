module functional_crc8;

    localparam period     = 20;
    localparam halfperiod = 10;

    // 32 - bits of data + 8 bits CRC key
    reg [23:0] test_vector  = 24'b000000000110100101101001;
    reg [23:0] test_vector1 = 24'b101110110110100101101001;



    reg clk = 1'b0;
    reg crc_en = 1'b0;
    reg crc_rst_i = 1'b0;
    reg data_i = 1'b0;
    reg capture_i = 1'b0;
    
    crc_8 crc
    (
    .clk_i(clk),
    .en_i(crc_en),
    .rst_i(crc_rst_i),
    .data_i(data_i),
    .capture_i(capture_i),
    .flag_o()
    ); 

    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin 
    
    #period;
    #period;
    crc_rst_i = 1'b1;
    #period;

    for(i = 0; i < 25; i = i + 1)
    begin 
        if(i < 24) begin 
            data_i = test_vector[i];
            #period;
        end else 
            data_i = 1'b0;
    end
    crc_rst_i = 1'b0;
    #period;
    crc_rst_i = 1'b1;
    #period;
    for(i = 0; i < 25; i = i + 1)
    begin 
        if(i < 24) begin 
            data_i = test_vector1[i];
            #period;
        end else 
            data_i = 1'b0;
    end


    $display(crc.data);
    $stop;
    
    end
    
endmodule
