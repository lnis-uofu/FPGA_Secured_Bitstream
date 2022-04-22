module crc_8 (clk_i, en_i, rst_i, data_i, capture_i, flag_o);

    input    clk_i;
    input     en_i;
    input    rst_i;
    input   data_i;
    input  capture_i;
    output  flag_o;

    reg [7:0] data;
    reg   flag_o_r;

    assign flag_o = flag_o_r;

always @ (posedge clk_i or en_i)
begin
    if(~en_i) begin
        data    <= data;
    end if(~rst_i) begin
        data    <= 0;
    end else begin
        data[0] <= data_i  ^ data[7];
        data[1] <= data[0] ^ data[7];
        data[2] <= data[1];
        data[3] <= data[2] ^ data[7];
        data[4] <= data[3];
        data[5] <= data[4] ^ data[7];
        data[6] <= data[5] ^ data[7];
        data[7] <= data[6] ^ data[7];
    end
end

always @ (negedge clk_i)
begin
    if(capture_i) begin 
        if(data != 8'b00000000)
            flag_o_r = 1'b1;
    end else
            flag_o_r = 1'b0;
end
endmodule
