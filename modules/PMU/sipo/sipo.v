




module sipo #(
    parameter integer AES_DATA_WIDTH = 128,
    parameter integer KEY_DATA_WIDTH = 128,
    parameter integer MEM_ADDR_WIDTH = 8,
    parameter integer MEM_DATA_WIDTH = 32,
    parameter integer MEM_OUT_WIDTH = MEM_ADDR_WIDTH + MEM_DATA_WIDTH

)(
    input                                  clk,
    input                                  rst,
    input                                   en,
    input                                 send,
    input      [1:0]               instruction,
    input                               data_i,
    input      [MEM_DATA_WIDTH-1:0] mem_data_i,
    output reg [AES_DATA_WIDTH-1:0] aes_data_o,
    output reg [KEY_DATA_WIDTH-1:0] key_data_o,
    output reg [MEM_OUT_WIDTH- 1:0] mem_data_o
);

    reg [AES_DATA_WIDTH-1:0] data = 0;
    reg [AES_DATA_WIDTH-1:0] temp = 0;
    
always@(posedge clk or negedge rst)
    begin
    if(rst == 1'b0)
    begin
        data       = 0;
        aes_data_o = 0;
        key_data_o = 0;
        mem_data_o = 0;
    end
        
    if(en == 1'b1)
    begin
        
        // pc to scan chain    
        if(instruction == 2'b00)
        begin
            data = {data[AES_DATA_WIDTH-1:1], data_i};
            if(send == 1'b1)
                aes_data_o = data;
        end

        // pc to memory
        else if(instruction == 2'b01)
        begin
            data = {data[MEM_OUT_WIDTH-1:1], data_i};
            if(send == 1'b1)
                mem_data_o = data[MEM_OUT_WIDTH-1:0];
        end
    
        // memory to aes
        else if(instruction == 2'b10)
        begin
            data = {data[AES_DATA_WIDTH-1:MEM_DATA_WIDTH], mem_data_i};
            if(send == 1'b1)
                aes_data_o = data;
        end

        // pc to key
        else if(instruction == 2'b11)
        begin
            data = {data[KEY_DATA_WIDTH-1:0], data_i};
            if(send ==1'b1)
                key_data_o = data;
        end
    
        
        
        

    end

        
    end
    
    

endmodule
