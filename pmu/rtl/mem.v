



`default_nettype wire


module mem (
    input  clk,
    input  we,
    input  [31:0] data_i,
    input  [7:0] address,
    output [31:0] data_o
);

    reg [31:0] mem [256:0];

always @ (posedge clk)
begin 
    if(we)
        mem[address] = data_i;
end

    assign data_o = mem[address];
endmodule
