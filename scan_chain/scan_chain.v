
module scan_chain(
    input clk,
    input d,
    input en,
    output out 
);

reg [99:0] data = 0;
    
always @ (posedge clk)
    begin
    if(en)
        data <= {d, data[99:1]};
    end
assign out = data[0];
    
endmodule
