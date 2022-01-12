

`include "../rtl/modules_pmu/address_generator/rtl/address_generator.v"
`include "../../cryptography/aes/aes_128.v" 
`include "../rtl/modules_pmu/bootloader/rtl/bootloader.v"
`include "../rtl/modules_pmu/key_storage/rtl/key_storage.v"
`include "../rtl/modules_pmu/piso/rtl/piso.v"
`include "../rtl/modules_pmu/sipo/rtl/sipo.v"
`include "../../fpga_cores/scan_chain/rtl/scan_chain.v"
`include "../../nv_memory/rtl/nv_memory.v"

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
    parameter integer AES_DATA_WIDTH  = 128,
    parameter integer AES_LATENCY     = 10,
    parameter integer MEM_DATA_WIDTH  = 32,
    parameter integer MEM_ADDR_WIDTH  = 8,
    parameter integer MEM_START_ADDR  = 1,
    parameter integer SIPO_MEM_COUNT  = AES_DATA_WIDTH/MEM_DATA_WIDTH
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


    // Encoding and FSM registers
    reg  [2  :0]                           state = 0;
    reg  [2  :0]                      next_state = 0;
    reg  [31 :0]                         counter = 0;
    reg  [3  :0]                sipo_instruction = 0;
    reg  [HEADER_WIDTH-1:0]               header = 0;
    
    // Key Storage
    reg                                key_write = 0;
    wire [127:0]                          key_data_o;
    
    // SIPO
    reg                              sipo_data_i = 0;
    reg                                sipo_send = 0;
    reg                                  sipo_en = 0;
    reg                                 sipo_rst = 0;
    reg  [31 :0]                 sipo_mem_data_i = 0;
    wire [127:0]                          sipo_key_o;
    wire [127:0]                          sipo_aes_o;
    wire [31 :0]                          sipo_mem_o;

    
    // AES
    wire [127:0]                          aes_data_o;
    
    // PISO
    reg                                  piso_en = 0;
    reg                                piso_load = 0;
    wire                                 piso_data_o; 

    // Scan Chin
    reg                                    sc_en = 0;

    //NVM
    reg  [7  :0]                     mem_address = 0;
    reg                              mem_w       = 0;
    wire [MEM_ADDR_WIDTH-1:0]             mem_addr_i;
    wire [MEM_DATA_WIDTH-1:0]             mem_data_i;
    wire [MEM_DATA_WIDTH-1:0]             mem_data_o;

    // bootloader
    reg                        bootloader_rw     = 0;
    reg                        bootloader_clr    = 0;
    reg  [31 :0]               bootloader_len_i  = 0;
    reg  [MEM_ADDR_WIDTH-1:0]  bootloader_addr_i = 0;
    wire [31 :0]                    bootloader_len_o;
    wire [MEM_ADDR_WIDTH-1:0]      bootloader_addr_o;

    //reg/wires specifically for mem to sc instruction
    reg  [31 :0]            aes_mem_data_counter = 0;
    reg  [7  :0]                       temp_addr = 0;
    
//import modules
    address_generator address_generator(
    .data_i             ({sipo_mem_o, mem_address}),
    .addr_o             (mem_addr_i),
    .data_o             (mem_data_i)
    );

    inv_aes_128 AES(
    .clk                (    clk),
    .clr                (       ),
    .dat_in          (sipo_aes_o),
    .dat_out         (aes_data_o),
    .inv_key         (key_data_o)
    );

    key_storage key_storage(
    .key_write            (key_write),
    .key_data_in         (sipo_key_o),
    .key_data_out        (key_data_o)
    );
    
    piso piso(
    .clk                 (    clk),
    .rst                 (       ),
    .load              (piso_load),
    .en                  (piso_en),
    .data_i           (aes_data_o),
    .data_o          (piso_data_o)
     );

    sipo sipo(
    .clk                (    clk),
    .rst               (sipo_rst),
    .en                 (sipo_en),
    .send             (sipo_send),
    .instruction (sipo_instruction),
    .data_i         (sipo_data_i),
    .mem_data_i      (mem_data_o),
    .aes_data_o      (sipo_aes_o),
    .key_data_o      (sipo_key_o),
    .mem_data_o      (sipo_mem_o)
     );

     bootloader bootloader(
    .clk                (    clk),
    .addr_i             (bootloader_addr_i),
    .len_i              (bootloader_len_i),
    .rw                 (bootloader_rw),
    .clr                (bootloader_clr),
    .addr_o             (bootloader_addr_o),
    .len_o              (bootloader_len_o)
     );
     
    nv_memory nv_memory(
    .clk                (clk    ), 
    .mem_w              (mem_w  ),
    .mem_addr_in        (mem_addr_i),
    .mem_data_in        (mem_data_i),
    .mem_data_out       (mem_data_o)
    );
     

    scan_chain scan_chain(
    .clk                (    clk),
    .en                   (sc_en),
    .clear              (       ),
    .data_i         (piso_data_o)
    //.data_o             (       ) // if JTAG
    );
    
    
always @(posedge clk)
begin 
    state = next_state;
    counter = counter + 1;
end

always @(state or en or counter or pwr_up_en)
begin
    //Power-Up Condition
    if(pwr_up_en)
        begin
        counter    =              0;
        temp_addr  = MEM_START_ADDR;
        next_state =           four;
        end

    case(state)
    zero : //Idle
            begin
                sipo_data_i          =    0;
                key_write            =    0;
                piso_load            =    0;
                piso_en              =    0;
                sipo_send            =    0;
                sipo_en              =    0;
                sipo_rst             =    0;
                mem_w                =    0;

                if(en == 1'b1)
                    begin
                        sipo_send            =    0;
                        counter              =    0;
                        sipo_rst             =    1;
                        next_state           =  one;
                    end
            end
    one  : // read header
            begin
                sipo_rst             =    1;
                if(counter < HEADER_WIDTH+1)
                    begin 
                        header = {data_i, header[HEADER_WIDTH-1:1]};
                    end
                if(counter == HEADER_WIDTH+1)
                    begin
                        header = {data_i, header[HEADER_WIDTH-1:1]};
                        counter = 0;
                        if(header[3:0] == 4'b1010)
                            begin 
                                next_state <= two;
                            end
                        else if(header[3:0] == 4'b0001)
                            begin 
                                bootloader_clr = 1'b1;
                                next_state = three; 
                            end
                        else if(header[3:0] == 4'b0010)
                            begin 
                                next_state = five;
                            end
                    end
            end
    two  : //PC to SC
            begin
                sipo_en          =    1'b1;
                piso_load        =    1'b0;
                sipo_instruction = 4'b0000;
                if(counter < header[31:4])
                    begin
                        sipo_data_i <= data_i;
                        sipo_send   <=   1'b0;
                        piso_load   <=   1'b0;
                    end
                if(counter%AES_DATA_WIDTH == 0 & counter != 0 & counter != (header[31:4] + AES_DATA_WIDTH))
                    begin
                        sipo_data_i <= data_i;
                        sipo_send    =   1'b1;
                        piso_load   <=   1'b0;
                    end
                if(counter == AES_DATA_WIDTH)
                    begin
                        sipo_data_i <= data_i;
                        sipo_send   <=   1'b1;
                     end
                //if(counter == 139)
                if(counter%AES_DATA_WIDTH == AES_LATENCY + 1 & counter != AES_LATENCY + 1 & counter != header[31:4]+ AES_LATENCY + AES_DATA_WIDTH)
                    begin
                        sipo_data_i <= data_i;
                        piso_load  <=   1'b1;
                        piso_en    <=   1'b1;
                        sc_en      <=   1'b1;
                    end
                if(counter == header[31:4] + AES_LATENCY + AES_DATA_WIDTH)
                    begin
                        sc_en      =   1'b0;
                        next_state =   zero;
                    end
            end
                
    three: // PC to MEM 
            begin
                sipo_en          =    1'b1;                
                sipo_send        =    1'b0;
                sipo_rst         =    1'b1;
                mem_w            =    1'b0;
                sipo_instruction = 4'b0001;
                bootloader_clr   =    1'b0;
                

                // initilize the bootloader and starting mem for programming
                if(counter == 1)
                    begin
                        bootloader_rw      =              1'b1;
                        bootloader_len_i   =      header[31:4];
                        bootloader_addr_i  =    MEM_START_ADDR;
                        mem_address        =    MEM_START_ADDR;
                    end
                if(counter == 2)
                    begin
                        bootloader_rw    = 1'b0;
                    end
                if(counter < header[31:4])
                    begin
                        sipo_data_i     <= data_i;
                    end
                if(counter%MEM_DATA_WIDTH == 0 & counter != 0)
                    begin 
                        //mem_address = mem_address + 1;
                        sipo_data_i <= data_i;
                        sipo_send    =   1'b1;
                    end
                if(counter%MEM_DATA_WIDTH == 1 & counter != 1)
                    begin
                        mem_w       =            1'b1;
                        if(counter > 33)
                            mem_address = mem_address + 1;
                    end                 
                if(counter == header[31:4])
                    begin
                        sipo_send   = 1'b1;
                    end
                if(counter == header[31:4]+1)
                    begin
                        mem_w      <= 1'b1;
                        next_state <= zero;
                    end
            end
    four: // MEM to SC
            begin
                sipo_en    = 1'b1;
                piso_load  = 1'b0;
                sipo_send  = 1'b0;
                sipo_instruction = 4'b0010;
                if(aes_mem_data_counter < bootloader_len_o)
                begin
                    if(counter == SIPO_MEM_COUNT)
                        begin
                            sc_en = 1'b0;
                            mem_address <= MEM_START_ADDR;
                            sipo_send = 1'b1;
                        end
                    if(counter == SIPO_MEM_COUNT+AES_LATENCY)
                        begin
                            if(aes_mem_data_counter == 0)
                                begin 
                                    piso_en = 1'b1;
                                end
                            sc_en = 1'b1;
                            piso_load = 1'b1;
                            mem_address = mem_address + 1;
                        end
                    if(counter == SIPO_MEM_COUNT+AES_LATENCY+AES_DATA_WIDTH)
                        begin
                            sc_en = 1'b0;
                            aes_mem_data_counter = aes_mem_data_counter + 1;
                            counter = 0;
                    
                        end
                end
                if(aes_mem_data_counter == bootloader_len_o)
                    begin
                        piso_en = 1'b0;
                        sc_en   = 1'b0;
                        aes_mem_data_counter = 0;
                        next_state = zero;
                    end
            end
    five: // Load Key
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
                     end
                if(counter == 128 + 2)
                    begin
                        key_write    =   1'b1;
                        sipo_send    =   1'b0;
                        next_state   =   zero;
                    end
            end

    endcase
end    
endmodule
