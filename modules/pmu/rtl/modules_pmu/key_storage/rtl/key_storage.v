// ┌───────────────────────────────────────────────────┐
// │  File Name :  key_storage.v                       │
// │                                                   │
// │  Author    :  Allen Boston                        │
// │                                                   │
// │  Date      :  December 28, 2021                   │
// │                                                   │
// ├───────────────────────────────────────────────────┤
// │  Breif     :  Non-Volatile memory element used    │
// │               to store cryptographic key data.    │
// │                                                   │
// │                                                   │
// │                                                   │
// │                                                   │
// └───────────────────────────────────────────────────┘


module key_storage_128 #(
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
            key <= key_data_in;
            key_data_out <= key;
        end
    key_data_out <= key;
    end

endmodule

module key_storage_256 #(
    parameter integer KEY_LENGTH = 256
)(
    input                          key_write,
    input  reg  [KEY_LENGTH-1:0] key_data_in,
    output reg  [KEY_LENGTH-1:0] key_data_out = 0
);

reg [KEY_LENGTH-1:0] key = 0;

always@(key_write)
    begin
        if(key_write) begin
            key <= key_data_in;
            key_data_out <= key;
        end
    key_data_out <= key;
    end

endmodule
