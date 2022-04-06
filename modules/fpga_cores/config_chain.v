
// ┌───────────────────────────────────────────────────┐
// │  File Name :  config_chain.v                      │
// │                                                   │
// │  Author    :  Allen Boston                        │
// │                                                   │
// │  Date      :  December 28, 2021                   │
// │                                                   │
// ├───────────────────────────────────────────────────┤
// │  Breif     :  Shift Register to model the         │
// │               configuration chain in a FPGA       │
// │               core.                               │
// │                                                   │
// │                                                   │
// │                                                   │
// └───────────────────────────────────────────────────┘


module config_chain #(
    parameter SC_LENGTH   = 128
)(
    input clk,
    input  se,
    input  pReset,
    input  data_i,
    output data_o
);


reg [SC_LENGTH-1:0] data = 0;
    
always @ (posedge clk or negedge pReset)
    begin
        if (se == 1'b1)
            begin
                data = {data_i, data[SC_LENGTH-1:1]};
            end
    end

    assign data_o = data[0];
    
endmodule


