module functional_crc8;

    localparam period     = 20;
    localparam halfperiod = 10;

    // 32 - bits of data + 8 bits CRC key
    /* reg [135:0] test_vector  = 136'h000123456789abcdef0123456789abcdef; */
    /* reg [135:0] test_vector1 = 136'h720123456789abcdef0123456789abcdef; */

    reg [135:0]  test_vector  = 136'b0000000000000000000000000000100000000111000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000;
    reg [135:0]  test_vector1 = 136'b1111001000000000000000000000100000000111000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000000;


    //reg [135:0] test_vector     = 136'h003ad77bb40d7a3660a89ecaf32466ef97; 

    reg clk = 1'b0;
    reg crc_en = 1'b0;
    reg crc_rst_i = 1'b0;
    reg data_i = 1'b0;

    
    crc_8 crc
    (
    .clk_i(clk),
    .en_i(crc_en),
    .rst_i(crc_rst_i),
    .data_i(data_i)
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
    crc_en    = 1'b1;
    #period;

    for(i = 0; i < 137; i = i + 1)
    begin 
        if(i < 136) begin 
            data_i = test_vector[i];
            #period;
        end else 
            data_i = 1'b0;
    end
    crc_en = 1'b0;
    
    #period;
    #period;
        
    crc_rst_i = 1'b0;
    #period;
    crc_rst_i = 1'b1;
    crc_en    = 1'b1;
    #period;
    for(i = 0; i < 137; i = i + 1)
    begin 
        if(i < 136) begin 
            data_i = test_vector1[i];
            #period;
        end else 
            data_i = 1'b0;
    end


    $display(crc.data);
    $stop;
    
    end
    
endmodule
