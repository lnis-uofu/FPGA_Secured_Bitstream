



module piso #(
    parameter integer AES_DATA_WIDTH = 128
)(
    input                                 clk,
    input                                 rst,
    input                                load,
    input                                  en,
    input         [AES_DATA_WIDTH-1:0] data_i,
    output                             data_o
);


    reg [AES_DATA_WIDTH-1:0] data = 0;
    reg [AES_DATA_WIDTH-1:0] temp = 0;

always@(posedge clk or negedge rst)
    begin
        if(rst == 1'b0)
        begin
            data = 0;
            temp = 0;
        end

        else if(load == 1'b1)
        begin
            data <= data_i;    
        end
        
        else if(en == 1'b1)
        begin
            temp = data >> 1;
            data = temp;
        end
    end

    assign data_o = data[0];

endmodule

