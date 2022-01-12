// ┌───────────────────────────────────────────────────┐
// │  File Name :  sipo.v                              │
// │                                                   │
// │  Author    :  Allen Boston                        │
// │                                                   │
// │  Date      :  December 28, 2021                   │
// │                                                   │
// ├───────────────────────────────────────────────────┤
// │  Breif     :  Serial In Parallel Out              │
// │               Has 4 functions:                    │
// │               - Host PC to Configuration Chain    │
// │               - Host PC to NV-Memory              │
// │               - NV-Memory to Decryption Module    │
// │               - Host PC to Key Storage            │
// └───────────────────────────────────────────────────┘

module sipo #(
    parameter integer AES_DATA_WIDTH = 128,
    parameter integer KEY_DATA_WIDTH = 128,
    parameter integer MEM_ADDR_WIDTH = 8,
    parameter integer MEM_DATA_WIDTH = 32
)(
    input                                  clk,
    input                                  rst,
    input                                   en,
    input                                 send,
    input      [3:0]               instruction,
    input                               data_i,
    input      [MEM_DATA_WIDTH-1:0] mem_data_i,
    output     [KEY_DATA_WIDTH-1:0] key_data_o,
    output reg [AES_DATA_WIDTH-1:0] aes_data_o = 0,
    output reg [MEM_DATA_WIDTH-1:0] mem_data_o = 0
);

    reg [KEY_DATA_WIDTH-1:0] key_data_r = 0;

    assign key_data_o = key_data_r;
    
    reg [AES_DATA_WIDTH-1:0] data = 0;

always@(posedge clk or negedge rst)
    begin
        if(rst == 1'b0)
        begin
        data       = 0;
        aes_data_o = 0;
        key_data_r = 0;
        mem_data_o = 0;
        end
        
        if(en == 1'b1)
        begin
           case(instruction)
                0:begin // pc to scan chain 
                    data = {data_i, data[AES_DATA_WIDTH-1:1]}; 
                    if(send == 1'b1) 
                    begin 
                        aes_data_o <= data[AES_DATA_WIDTH-1:0]; 
                        mem_data_o <= 0; 
                        //key_data_r <= 0; 
                    end 
                end
                
                1:begin  //pc to memory
                    data = {data_i, data[MEM_DATA_WIDTH-1:1]}; 
                    if(send == 1'b1) 
                    begin 
                        mem_data_o <= data[MEM_DATA_WIDTH-1:0]; 
                        aes_data_o <= 0; 
                        key_data_r <= 0; 
                    end 
                end

                2:begin // memory to aes
                    data = {data[AES_DATA_WIDTH-1:MEM_ADDR_WIDTH], mem_data_i}; 
                    if(send == 1'b1) 
                    begin 
                        aes_data_o <= data[AES_DATA_WIDTH-1:0];
                        mem_data_o <= 0; 
                        key_data_r <= 0; 
                    end 
                end 

                3:begin // pc to key
                    data <= {data_i, data[KEY_DATA_WIDTH-1:1]};
                    if(send == 1'b1) 
                    begin
                        key_data_r = data[KEY_DATA_WIDTH-1:0]; 
                        aes_data_o = 0; 
                        mem_data_o = 0;
                    end
                end 

                default: begin aes_data_o = 0; key_data_r = 0; mem_data_o = 0; end
            endcase
        end
    end
endmodule
