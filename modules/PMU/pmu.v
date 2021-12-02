

`include "address_generator/address_generator.v"
`include "aes/aes_128.v" 
`include "bootloader/bootloader.v"
`include "key_storage/key_storage.v"
`include "piso/piso.v"
`include "sipo/sipo.v"
`include "../scan_chain/scan_chain.v"
`include "../nv_memory/nv_memory.v"

//parameter         zero = 3'b000;
//parameter          one = 3'b001;
//parameter          two = 3'b010;
//parameter        three = 3'b011;
//parameter         four = 3'b100;
//parameter         five = 3'b101;
//parameter          six = 3'b110;
//parameter        seven = 3'b111; 

//parameter        pc_sc = 4'b0000;
//parameter       pc_mem = 4'b0001;
//parameter       mem_sc = 4'b0010;
//parameter       pc_key = 4'b0011;

module pmu#(
    parameter integer HEADER_WIDTH    = 32,
    parameter integer AES_DATA_WIDTH  = 128
)(
    input  clk,
    input  data_i,
    input  en,
    input  pwr_up_en,
    output tdo
);

parameter         zero = 3'b000;
parameter          one = 3'b001;
parameter          two = 3'b010;
parameter        three = 3'b011;
parameter         four = 3'b100;
parameter         five = 3'b101;
parameter          six = 3'b110;
parameter        seven = 3'b111; 

parameter        pc_sc = 4'b0000;
parameter       pc_mem = 4'b0001;
parameter       mem_sc = 4'b0010;
parameter       pc_key = 4'b0011;

    reg [2 :0]             state = 0;
    reg [2 :0]        next_state = 0;
    //reg [31:0] bitstream_counter = 0;
    //reg [ 5:0]    header_counter = 0;

    reg [31:0]           counter = 0;
    
    reg [HEADER_WIDTH-1:0]header = 0;
    reg [3 :0]  sipo_instruction = 0;
        
    reg                key_write = 0;
    
    reg              sipo_data_i = 0;
    
    wire[127:0]       sipo_key_o;

    
    reg                sipo_send = 0;
    reg                  sipo_en = 0;
    
//import modules
//    address_generator address_generator(
//    .data_i             (       ),
//    .addr_o             (       ),
//    .data_o             (       )
//    );

    inv_aes_128 AES(
    .clk                (    clk),
    .clr                (       ),
    .dat_in          (),
    .dat_out         (),
    .inv_key         ()
    );

    key_storage key_storage(
    .key_write            (key_write),
    .key_data_in         (sipo_key_o),
    .key_data_out        ()
    );
    
    piso piso(
    .clk                 (    clk),
    .rst                 (       ),
    .load                (       ),
    .en                  (       ),
    .data_i           (),
    .data_o          ()
     );

    sipo sipo(
    .clk                (    clk),
    .rst                (       ),
    .en                 (sipo_en),
    .send             (sipo_send),
    .instruction (sipo_instruction),
    .data_i         (sipo_data_i),
    .mem_data_i      (),
    .aes_data_o      (),
    .key_data_o      (sipo_key_o),
    .mem_data_o         (       )
     );

//     bootloader bootloader(
//    .clk                (       ),
//    .addr_i             (       ),
//    .len_i              (       ),
//    .rw                 (       ),
//    .clr                (       ),
//    .addr_o             (       ),
//    .len_o              (       )
//     );
     
//    nv_memory vm_memory(
//    .clk                (       ), 
//    .mem_w              (       ),
//    .mem_addr_in        (       ),
//    .mem_data_in        (       ),
//    .mem_data_out       (       )
//    );
     

    scan_chain scan_chain(
    .clk                (    clk),
    .en                   (),
    .clear              (       ),
    .data_i         (),
    .data_o             (       )
    );
    
    
always @(posedge clk)
begin 
    state = next_state;
    counter = counter + 1;
end

always @(state or en or counter)
begin
    case(state)
    zero : //Idle
            begin
                sipo_data_i          =    0;
                key_write            =    0;
                if(en == 1'b1)
                    begin
                        sipo_en              =    0;
                        counter              =    0;
                        sipo_send            =    0;
                        next_state           =  one;
                    end
            end
    one  : // read header
            begin
                if(counter < HEADER_WIDTH+1)
                    begin 
                        header = {data_i, header[HEADER_WIDTH-1:1]};
                    end
                if(counter == HEADER_WIDTH + 1)
                    begin
                        header = {data_i, header[HEADER_WIDTH-1:1]};
                        counter = 0;
                        if(header[3:0] == pc_sc)
                            begin 
                                next_state <= two;
                            end
                        else if(header[3:0] == pc_mem)
                            begin 
                                next_state = three; 
                            end
                        else if(header[3:0] == mem_sc)
                            begin 
                                next_state = four;
                            end
                        else if(header[3:0] == 4'b0011)
                            begin
                                next_state <= five;
                            end
                    end
                
            end
    //`two  :
    //`three:
    //`four
    five : 
            begin
                sipo_en          =    1'b1;
                sipo_instruction = 4'b0011;
                if(counter < header[31:4])
                    begin
                        sipo_data_i <= data_i;
                    end
                if(counter == 128 + 1)
                    begin
                        sipo_data_i <= data_i;
                        sipo_send    =   1'b1;
                        //key_write    =   1'b1;
                        //next_state   =   zero;
                     end
                if(counter == 128 + 2)
                    begin
                        key_write    =   1'b1;
                        next_state   =   zero;
                    end


            end
    //`six  :
    //`seven:
    endcase
end

        
endmodule
