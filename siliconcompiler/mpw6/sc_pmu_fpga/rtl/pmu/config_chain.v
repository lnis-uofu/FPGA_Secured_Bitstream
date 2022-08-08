
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
    parameter LENGTH   = 2250
)(
    input  progclk,
    input  pReset,
    input  ccff_head,
    output ccff_tail
);


reg [LENGTH-1:0] data = 0;
    
always @ (posedge progclk or pReset)
    begin
        if(pReset)
            data = {ccff_head, data[LENGTH-1:1]};
        else
            data = 0;
    end

    assign ccff_tail = data[0];
endmodule


