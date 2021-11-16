



module piso #(
    parameter integer INPUT_DATA_WIDTH = 128
)(
    input                                 clk,
    input                                 rst,
    input                                load,
    input                                  en,
    input       [INPUT_DATA_WIDTH-1:0] data_i,
    output                             data_o
);


    reg [INPUT_DATA_WIDTH-1:0] data = 0;
    reg [INPUT_DATA_WIDTH-1:0] temp = 0;

always@(posedge clk or negedge rst)
    begin
        if(load == 1'b1) begin
            data <= data_i; end
        else if(rst == 1'b0) begin
            data = 0; end
        else if(en == 1'b1)
        begin
            temp = data >> 1;
            data = temp;    
        end
    end

    assign data_o = data[0];

endmodule

