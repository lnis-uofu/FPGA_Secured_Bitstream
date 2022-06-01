`default_nettype wire


module crc_8 (clk_i, en_i, rst_i, data_i, data_o);

    input wire   clk_i;
    input wire    en_i;
    input wire   rst_i;
    input wire  data_i;
    output wire [7:0] data_o;



    reg [7:0] data;


// shoulde be negedge
always @ (clk_i , en_i)
begin
    if(~en_i) begin
        data    <= data;
        if(~rst_i)
            data    <= 0;
    end else if(~clk_i) begin
        data[0] <= data_i  ^ data[7];
        data[1] <= data[0] ^ data[7];
        data[2] <= data[1];
        data[3] <= data[2] ^ data[7];
        data[4] <= data[3];
        data[5] <= data[4] ^ data[7];
        data[6] <= data[5] ^ data[7];
        data[7] <= data[6] ^ data[7];
    end else
        data = data;
end
    assign data_o = data;

endmodule
