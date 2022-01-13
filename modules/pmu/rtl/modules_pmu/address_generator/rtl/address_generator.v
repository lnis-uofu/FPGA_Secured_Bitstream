// ┌───────────────────────────────────────────────────┐
// │  File Name :  address_generator.v                 │
// │                                                   │
// │  Author    :  Allen Boston                        │
// │                                                   │
// │  Date      :  December 28, 2021                   │
// │                                                   │
// ├───────────────────────────────────────────────────┤
// │  Breif     :  This device takes an output from    │
// │               SIPO device and splits it into      │
// │               data and address for the nv-memory  │
// │               interface.                          │
// │                                                   │
// │                                                   │
// └───────────────────────────────────────────────────┘

module address_generator #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH =  8,
    parameter integer FIFO_WIDTH = DATA_WIDTH + ADDR_WIDTH
)(
    input      [FIFO_WIDTH-1:0]      data_i,
    output reg [ADDR_WIDTH-1:0]      addr_o,
    output reg [DATA_WIDTH-1:0]      data_o
);


always@(data_i)
    begin
        addr_o <= data_i[ADDR_WIDTH-1:0];
        data_o <= data_i[ADDR_WIDTH+DATA_WIDTH-1: ADDR_WIDTH];
    end
    
endmodule
