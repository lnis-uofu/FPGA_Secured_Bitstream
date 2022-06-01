


`default_nettype wire
module key_storage (
    input  clk,
    input  rst,
    input  we,
    input  [127:0] write_data,
    output [127:0] read_data
    );

    reg [127:0] key;

always @ (posedge clk)
begin    
    if(~rst)
        key = 0;
    else
        begin 
            if(we)
                key <= write_data;
            else
                key <= key;
        end
end
    assign read_data = key;

endmodule

