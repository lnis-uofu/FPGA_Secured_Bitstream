


module key_storage #(
    parameter integer KEY_LENGTH = 128
)(
    input                          key_write,
    input  reg  [KEY_LENGTH-1:0] key_data_in,
    output reg  [KEY_LENGTH-1:0] key_data_out = 0
);

reg [KEY_LENGTH-1:0] key = 0;

always@(key_write)
    begin
        if(key_write) begin
            //key = 0;
            key <= key_data_in;
        end
        key_data_out <= key;
    end

endmodule
