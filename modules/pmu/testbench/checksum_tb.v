

module checksum_tb;

    localparam period     = 20;
    localparam halfperiod = 10;

    //1010100011010011111101100100100111000000110011111010010000010010
    
    reg clk;
    reg [135:0] data_register = 72'b111111001010100011010011111101100100100111000000110011111010010000010010;
    reg rst = 1;
    reg en = 0;
    reg data_i = 0;


    checksum uut
    (
    .clk_i(clk),
    .rst_i(rst),
    .en_i(en),
    .data_i(data_i),
    .data_o(),
    .flag_o()
    );
    
    initial 
    begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    integer i;
    
    initial
    begin
        rst = 1'b0;
        #period;
        rst = 1'b1;
        #period;
        en = 1'b1;
        for(i = 0; i < 72; i = i + 1)
        begin
            data_i = data_register[i];
            #period;
        end
        #period;
        #period;
        #period;
        #period;

    // Change first bit (here its the first bit)
        data_register = 136'b1011101011110001011000110111101001111111101111010100001011100101101010001101001111110110010010011100000011001111101001000001001010001100;
        for(i = 0; i < 72; i = i + 1)
        begin
            data_i = data_register[i];
            #period;
        end
       
        #period;
        #period;
        #period;
        #period;



    $stop;
    end
        
endmodule
