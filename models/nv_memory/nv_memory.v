

module nv_memory(fpga_clk, mem_erase, mem_rw, mem_addr_in, mem_data_in, mem_data_out);

input fpga_clk, mem_erase, mem_rw;

input  [7: 0] mem_addr_in;
input  [63:0] mem_data_in;
output [63:0] mem_data_out;

reg [63:0] memory[255:0];

always @(posedge fpga_clk)
    begin
        if(mem_rw)
            memory[mem_addr_in] <= mem_data_in;
    end
    
    assign mem_data_out = memory[mem_addr_in];
    
endmodule
