module crc_tb;

    localparam period        = 50;
    localparam halfperiod    = 25;

    reg clk    = 1'b0;
    reg data_i = 1'b0;
    reg en     = 1'b0;


    reg [71:0] data0 = 72'b011100010111110100101111001000000110100101111101001011110010000001101001;
    reg [71:0] data1 = 72'b011100010111110100101111001000000110100101111101001011110010000001101001;
    reg [71:0] data2 = 72'b011100010111110100101111001000000110100101111101001011110010000001101001;
    reg [71:0] data3 = 72'b011100010111110100101111001000000110100101111101001011110010000001101001;
    reg [71:0] data4 = 72'b011100010111110100101111001000000110100101111101001011110010000001101000;

    
    reg capture = 1'b0;
 

    crc_8 uut(
    .clk_i(clk),
    .en_i(en),
    .data_i(data_i),
    .capture(capture),
    .flag_o()
    );




    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end
    integer i;
    
    initial begin 
        #period;
        en = 1'b1;
        #period;
        for(i = 0; i < 72; i = i  + 1) begin 
            data_i = data0[i];
            if(i == 71)
                en = 1'b0;
            if(i == 71) begin
                capture = 1'b1;
                #period;
            end else begin
                #period;
            end
        end
        capture = 1'b0;
        en = 1'b1;
        #period;
        for(i = 0; i < 72; i = i  + 1) begin 
            data_i = data1[i];
            if(i == 71)
                en = 1'b0;
            if(i == 71) begin
                capture = 1'b1;
                #period;
            end else begin
                #period;
            end
        end
        capture = 1'b0;
        en = 1'b1;
        #period;

        for(i = 0; i < 72; i = i  + 1) begin 
            data_i = data2[i];
            if(i == 71)
                en = 1'b0;
            if(i == 71) begin
                capture = 1'b1;
                #period;
            end else begin
                #period;
            end
        end
        capture = 1'b0;
        en = 1'b1;
        #period;
        for(i = 0; i < 72; i = i  + 1) begin 
            data_i = data3[i];
            if(i == 71)
                en = 1'b0;
            if(i == 71) begin
                capture = 1'b1;
                #period;
            end else begin
                #period;
            end
        end
        capture = 1'b0;
        en = 1'b1;
        #period;
        for(i = 0; i < 72; i = i  + 1) begin 
            data_i = data4[i];
            if(i == 71)
                en = 1'b0;
            if(i == 71) begin
                capture = 1'b1;
                #period;
            end else begin
                #period;
            end
        end
        capture = 1'b0;

        #period;

        
    $stop;
    end
endmodule
