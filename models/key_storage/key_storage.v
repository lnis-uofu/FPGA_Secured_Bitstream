


module key_storage(key_write, key_data_in, key_data_out);

input key_write;
input  [127:0] key_data_in;
output [127:0] key_data_out;

reg [127:0] key;

always@(posedge key_write)
    begin
        if(key_write)
        begin
            key = 0;
            key = key_data_in;
    end
   
    assign key_data_out = key;
endmodule
