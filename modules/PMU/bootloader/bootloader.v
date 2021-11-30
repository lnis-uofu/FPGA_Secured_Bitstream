//bootloader
//
//


module bootloader #(
    parameter integer ADDR_WIDTH  = 8,
    parameter integer DATA_LENGTH = 32
)(
    input                               clk,
    input      [ADDR_WIDTH-1:0]      addr_i,
    input      [DATA_LENGTH-1:0]      len_i,
    input                                rw,
    input                               clr,
    output reg [ADDR_WIDTH-1 :0]     addr_o,
    output reg [DATA_LENGTH-1:0]      len_o
);

reg [ADDR_WIDTH-1 :0] starting_address = 0;
reg [DATA_LENGTH-1:0]   bitstream_len = 0;


always @ (posedge clk)
begin
    if(clr == 1'b1)
    begin
        starting_address <= 0;
        bitstream_len    <= 0;
        addr_o           <= 0;
        len_o            <= 0;
    end
    else if(clr == 1'b0)
    begin 
        if(rw == 1'b1)  //write
        begin 
            starting_address <= addr_i;
            bitstream_len    <=  len_i;
            addr_o           <= 0;
            len_o            <= 0;
        end
        else if(rw == 1'b0)  //read
            addr_o <= starting_address;
             len_o <= bitstream_len;
    end

end

endmodule



