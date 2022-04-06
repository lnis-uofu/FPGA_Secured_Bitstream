

// 0110 0000 = 96
// 1101 1111 = 223
// 0001 1110 = 30
// 0010 1110 = 46
// 1101 0000 = 208
// 0110 0000 = 96
// 0110 0000 = 96
// 0001 0011 = 19
//           +
// ----------------
//             814
// 0000 0011 0010 1110

//   sum = 0010 1110
// carry = 0000 0011
//        + 
// ----------------- 
//         0011 0001
//
//  ones compliment
//  checksum = 1100 1110




module checksum_tb;

    localparam period        = 20;
    localparam halfperiod    = 10;

    reg clk    = 1'b0;
    reg data_i = 1'b0;
    reg en     = 1'b0;
    reg rst    = 1'b1;
    reg [71:0] data0 = 72'b 110011100110000011011111000111100010111011010000011000000110000000010011;
    reg [71:0] data1 = 72'b 110011100110000011011111000111100010111011010000011000000110000000010010;

    checksum cs(
    .clk_i   (clk),
    .rst_i   (rst),
    .en_i    (en),
    .data_i  (data_i),
    .flag_o  ()
    );

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end
    
    integer i;
    
    initial 
    begin
    #period;
    rst = 1'b0;
    #period;
    rst = 1'b1;
    #period;
    en  = 1'b1;
    
    for(i = 0; i < 72; i = i + 1)
    begin
        data_i = data0[i];
        #period;
    end

    #period;
    #period;
    #period;
    #period;
    #period;
    #period;


    for(i = 0; i < 72; i = i + 1)
    begin
        data_i = data1[i];
        #period;
    end



    #period;
    $stop;
    end

    
endmodule

