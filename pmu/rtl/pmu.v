
`default_nettype wire


// C -> CRC enable
// A -> AES enable

`define IDLE                 4'b0000
`define DECODE               4'b0001
`define LOAD_KEY             4'b0010
`define LOAD_KEY_C           4'b0011
`define LOAD_BITSTREAM       4'b0100 
`define LOAD_BITSTREAM_C     4'b0101
`define LOAD_BITSTREAM_A     4'b0110
`define LOAD_BITSTREAM_CA    4'b0111
`define WRITE_NVM            4'b1000
`define READ_NVM             4'b1001
`define EVAL_CRC             4'b1010
`define EVAL_AES             4'b1011
`define EVAL_CRC_AES         4'b1100
`define RESET                4'b1101
`define KEY_INIT             4'b1110
`define LOCK                 4'b1111



 module pmu (
    input  data_i,
    input  rst_i,
    input  en_i,
    input  tck_i,

    output progclk_o,
    output flag_o_jtag,
    output flag_o_fpga,
    output data_o,

    //from core
    input  data_ccff_i,
    //to jtag
    output data_ccff_o,

    //mem ports
    input  [31:0] mem_data_in,
    output [7:0]  mem_address_o,
    output [31:0] mem_data_o,
    output mem_we,
    output mem_clk
     
    );
    
    assign mem_clk = tck_i;
     
    reg [3:0] state;
    reg [3:0] next_state;

    reg [63:0] header;
    wire [6:0] counter0_o;
    wire [2:0] counter1_o;

    reg data_o_r;
    assign data_o = data_o_r;

    reg  [127:0] temp_data_reg;
    reg  [127:0] aes_i_reg;
    reg  [127:0] aes_o_reg;
    wire [127:0] temp_data;
    wire [127:0] key_wire;
    wire [127:0] block_wire;
    wire [127:0] result_wire;
     
    
    assign temp_data  = temp_data_reg;
    assign block_wire = aes_i_reg; 
     
    reg  progclk_o_reg;
    assign progclk_o = progclk_o_reg;
     
    reg head_valid;
    reg core_ready; // Indicates a finished squence
    reg key_ready;
    reg core_valid; // Indicates a correct sequence ())
    reg key_valid;
    reg mem_w_ready;

    reg counter0_en_r;
    reg counter1_en_r;
    wire  counter0_en;
    wire  counter1_en;
    assign counter0_en = counter0_en_r;
    assign counter1_en = counter1_en_r;


    // CRC8 Wires
    wire crc_en, crc_rst;
    wire [7:0] crc_data_o;
    reg  crc_en_r, crc_rst_r;
    assign crc_en = crc_en_r;
    assign crc_rst = crc_rst_r;
    

    // AES Wires
    wire aes_rst, aes_init, aes_next, aes_dec_rst;
    reg  aes_init_r, aes_next_r, aes_dec_rst_r;

    assign aes_rst  = rst_i;
    assign aes_init = aes_init_r;
    assign aes_next = aes_next_r;
    assign aes_dec_rst = aes_dec_rst_r;

    //key storage wires
    reg key_rst_r;
    wire key_rst;
    reg key_write_en_r;
    wire key_write_en;

    assign key_rst = key_rst_r;
    assign key_write_en = key_write_en_r;


    //NVM wires

    reg  [31:0] mem_data_o_r;
    assign mem_data_o = mem_data_o_r;


    reg  [7:0] mem_address_r;
    assign mem_address_o = mem_address_r;


    reg  mem_we_r;
    assign mem_we = mem_we_r;

     
    counter_7_bit counter0
    (
    .clk_i(tck_i),
    .en_i(counter0_en),
    .count(counter0_o)
    );

    counter_3_bit counter1
    (
    .clk_i(tck_i),
    .en_i(counter1_en),
    .count(counter1_o)
    );

    crc_8 crc
    (
    .clk_i(tck_i),
    .en_i(crc_en),
    .rst_i(crc_rst),
    .data_i(data_i),
    .data_o(crc_data_o)
    );

    aes_core aes
    (
    .clk(tck_i),
    .reset_n(aes_rst),
    .reset_dec(aes_dec_rst),
    .init(aes_init),
    .next(aes_next),
    .key(key_wire),
    .block(block_wire),
    .result(result_wire),
    .result_valid()
    );

    key_storage key
    (
    .clk(tck_i),
    .rst(key_rst),
    .we(key_write_en),
    .write_data(temp_data),
    .read_data(key_wire)
    );

always @ (posedge tck_i)
begin
    if(~rst_i)
        state <= `RESET;
    else
        state <= next_state;
end


    
always @ (state, en_i, counter0_o, counter1_o)
begin 
    
    case(state)
        `IDLE:  // reset state
            begin
                if(en_i) 
                    next_state <= `DECODE;
                else
                    next_state <= `IDLE;
            end
        `DECODE:  // Read/decode header
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111) begin
                        if(header[35:32] == `LOAD_KEY_C || header[35:32] == `LOAD_BITSTREAM_C || header[35:32] == `LOAD_BITSTREAM_CA)
                            next_state = `EVAL_CRC;
                        else 
                            next_state <= header[35:32];
                    end else 
                        next_state  <= `DECODE;
                end else
                    next_state <= `IDLE;
            end
        `LOAD_KEY:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111)
                        next_state <= `KEY_INIT;
                    else 
                        next_state <= `LOAD_KEY;
                end else
                    next_state <=   `IDLE;
            end
        `LOAD_KEY_C:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111)
                        next_state <= `EVAL_CRC;
                    else 
                        next_state <= `LOAD_KEY_C;
                end else
                    next_state <=   `IDLE;
            end

        `LOAD_BITSTREAM: //Operation w/o CRC or AES
            begin
                if(en_i) begin
                    if(header[31:0] == 0 && counter0_o == header[42:36])
                        next_state <= `IDLE;
                    else
                        next_state <= `LOAD_BITSTREAM;
                end else
                    next_state <= `IDLE;
            end
        `LOAD_BITSTREAM_C:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111)
                        next_state <= `EVAL_CRC;
                    else
                        next_state <= `LOAD_BITSTREAM_C;
                end else 
                    next_state <= `IDLE;

            end
        `LOAD_BITSTREAM_A:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111)
                        next_state <= `EVAL_AES;
                    else
                        next_state <= `LOAD_BITSTREAM_A;
                end else 
                    next_state <= `IDLE;
            end
        `LOAD_BITSTREAM_CA:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b1111111)
                        next_state <= `EVAL_CRC;
                    else
                        next_state <= `LOAD_BITSTREAM_CA;
                end else 
                    next_state <= `IDLE;
            end
        `WRITE_NVM:
            begin
                if(header[31:0] == 0 & counter0_o == 7'b0000000)
                    next_state <= `IDLE;
                else
                    next_state <=`WRITE_NVM;
            end
        `READ_NVM:
            begin
                if(header[31:0] == 0 & counter0_o == 7'b0110101)
                    next_state <= `IDLE;
                else
                    next_state <=`READ_NVM;
             end
        `EVAL_CRC:
            begin
                if(counter1_o == 3'b111) begin 
                    case(header[35:32])
                        `LOAD_KEY_C:
                            begin 
                                if(crc_data_o == 8'b00000000) begin
                                   if(~head_valid)
                                        next_state <= `LOAD_KEY_C;
                                    else
                                        next_state <= `KEY_INIT;
                                end else
                                        next_state <= `LOCK;
                                end
                        `LOAD_BITSTREAM_C:
                                begin 
                                    if(crc_data_o == 8'b00000000) begin 
                                        if(header[31:0] == 32'h00000000)
                                            next_state <= `IDLE;
                                        else 
                                            next_state <= `LOAD_BITSTREAM_C;
                                    end else
                                        next_state <= `LOCK;
                                end
                        `LOAD_BITSTREAM_CA:
                                begin 
                                    if(crc_data_o == 8'b00000000) begin 
                                        if(header[31:0] == 32'h00000000)
                                            next_state <= `IDLE;
                                        else 
                                            next_state <= `LOAD_BITSTREAM_CA;
                                    end else
                                        next_state <= `LOCK;
                                end
                        `EVAL_CRC_AES:
                               begin 
                                    if(crc_data_o == 8'b00000000)
                                        next_state <= `EVAL_CRC_AES;
                                   else
                                        next_state <= `LOCK;
                                end
                        endcase 
                    end else 
                        next_state <= `EVAL_CRC;
            end
        `EVAL_AES:
            begin 
                if(header[31:0] == 32'h00000000 & counter0_o == 7'b0110101)  
                    next_state <= `IDLE;
                else
                    next_state <= `EVAL_AES;
            end
        `EVAL_CRC_AES:
            begin
                if(counter0_o == 7'b1111111)
                    next_state <= `EVAL_CRC;
                else begin
                    if(counter0_o == 7'b0110101 && header[31:0] == 32'h00000000)
                        next_state <= `IDLE;
                    else 
                        next_state <= `EVAL_CRC_AES;
                end
            end
        `RESET:
            next_state = `IDLE;
        `KEY_INIT:
            begin
                if(counter0_o == 7'b0001101)
                    next_state <= `IDLE;
                else
                    next_state <= `KEY_INIT;
            end
        `LOCK:
            begin
                if(en_i)
                    next_state <= `LOCK;
                else
                    next_state <= `IDLE;
            end
        default: next_state <= `IDLE;
    endcase 
end


always @ (state, counter0_o, counter1_o)
begin 
    case(state)
        `IDLE:  // reset state
            begin
                crc_en_r      = 1'b0;  
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b0;
            end
        `DECODE:  // Read/decode header
            begin
                crc_en_r      = 1'b1;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `LOAD_KEY:
            begin 
                crc_en_r      = 1'b0;    
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `LOAD_KEY_C:
            begin 
                crc_en_r      = 1'b1; 
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `LOAD_BITSTREAM:
            begin
                crc_en_r      = 1'b0;  
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;

            end
        `LOAD_BITSTREAM_C:
            begin 
                crc_en_r      = 1'b1;  
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;

            end
        `LOAD_BITSTREAM_A:
            begin 
                crc_en_r      = 1'b0;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;

            end
        `LOAD_BITSTREAM_CA:
            begin 
                crc_en_r      = 1'b1;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `WRITE_NVM:
            begin
                crc_en_r      = 1'b0;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `READ_NVM:
            begin
                crc_en_r      = 1'b0;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `EVAL_CRC:
            begin
                crc_en_r      = 1'b1;
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b1;
            end
        `EVAL_AES:
            begin 
                crc_en_r      = 1'b0; 
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `EVAL_CRC_AES:
            begin
                crc_en_r      = 1'b1; 
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `RESET:
            begin 
                crc_en_r      = 1'b0;    
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b0;
            end
        `KEY_INIT:
            begin 
                crc_en_r      = 1'b0;    
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
            end
        `LOCK:
            begin 
                crc_en_r      = 1'b0;    
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
        end
    endcase 
end

always @ (posedge tck_i)
begin 
    case(state)
        `IDLE:  // reset state
            begin
                mem_w_ready = mem_w_ready;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg      = 0;
                aes_o_reg      = 0;
                aes_dec_rst_r  = 0;
                core_ready     = core_ready;
                key_ready      = key_ready;
                core_valid     = core_valid;
                key_valid      = key_valid;
                header         = header;
                aes_init_r     = aes_init_r;
                aes_next_r     = 0;
                crc_rst_r      = crc_rst_r;
                key_rst_r      = key_rst_r;
                key_write_en_r = 0;
                head_valid     = 0;

            end
        `DECODE:  // Read/decode header
            begin
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 0;
                mem_address_r = 0;
                mem_we_r     = 0;
                mem_data_o_r = 0;
                aes_i_reg      = aes_i_reg;
                aes_o_reg = aes_o_reg;
                core_ready     = core_ready;
                core_valid     = core_valid;
                key_ready      = key_ready;
                key_valid      = key_valid;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1; 
                key_rst_r      = 1;
                key_write_en_r = 0;
                head_valid     = 0;

                if(counter0_o < 7'b0111111 || counter0_o == 7'b1111111)
                    header = header;
                else
                    header = {data_i, header[63:1]};
            end
        `LOAD_KEY:
            begin
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 0;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;
                head_valid    = 1;
                core_ready    = 0;
                core_valid    = 0;
                key_ready     = 0;
                header = header;
                aes_init_r    = 0;
                aes_next_r    = 0;
                crc_rst_r     = 0; 
                key_rst_r     = 1;
                if(counter0_o == 7'b1111110 ||counter0_o == 7'b1111111) begin
                    key_valid      = 1;
                    key_write_en_r = 1;
                end else begin
                    key_write_en_r = 0;
                    key_valid      = 0;
                end
            end
        `LOAD_KEY_C:
            begin
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 0;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;
                head_valid     = 1;
                core_ready     = 0;
                core_valid     = 0;
                key_ready      = 0;
                header         = header;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1; 
                key_rst_r      = 1;
                key_write_en_r = 0;

            end
        `LOAD_BITSTREAM: //FOR Operation w/o CRC or AES
            begin
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 0;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;

                head_valid    = 1;
                aes_init_r    = 0;
                aes_next_r    = 0;
                crc_rst_r     = 1;
                key_ready     = 0;
                key_rst_r     = 1;
                key_write_en_r = 0;
                header =header;
                if(header[31:0] == 0 && counter0_o == header[42:36]) begin
                    core_ready = 1'b1;
                    core_valid = 1'b1;
                end
                if(counter0_o == 7'b1111111) begin
                    header[31:00] = header[31:00] - 1;
                    header[63:32] = header[63:32];
                end else
                    header = header;
   
            end
        `LOAD_BITSTREAM_C:
            begin
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 0;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg      = aes_i_reg;
                aes_o_reg      = aes_o_reg;
                head_valid     = 1;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1;
                key_ready      = 0;
                key_rst_r      = 1;
                key_write_en_r = 0;
                if(header[31:0] == 32'h00000001 && counter0_o == header[63:36]) begin
                    core_ready = 1'b1;
                    core_valid = 1'b0;
                end 
                if(counter0_o == 7'b1111111) begin
                    header[31:00] = header[31:00] - 1;
                    header[63:32] = header[63:32];
                    if(crc_data_o == 8'h00)
                        core_valid = 1;
                    else 
                        core_valid = 0;
                end else begin
                    core_valid = 0;
                    header     = header;
                end
                    

            end
        `LOAD_BITSTREAM_A:
            begin 
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 1;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_o_reg = aes_o_reg;
                head_valid     = 1;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_rst_r      = 1;
                key_write_en_r = 0;
                core_valid     = 0;
                header = header;
                if(counter0_o == 7'b1111110)
                    aes_i_reg = temp_data_reg;
                else
                    aes_i_reg = aes_i_reg;
            end
        `LOAD_BITSTREAM_CA:
            begin 
                mem_w_ready = mem_w_ready;
                aes_dec_rst_r = 1;

                mem_address_r = 0;
                mem_we_r     = 0;
                mem_data_o_r = 0;
                aes_o_reg = aes_o_reg;
                head_valid     = 1;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_rst_r      = 1;
                key_write_en_r = 0;
                core_valid     = 0;
                header[63:36] = header[63:36];
                header[35:32] = `EVAL_CRC_AES;
                header[31:00] = header[31:00]; 
                if(counter0_o == 7'b1111110)
                    aes_i_reg = temp_data_reg;
                else
                    aes_i_reg = aes_i_reg;

            end
        `WRITE_NVM:
            begin
                aes_dec_rst_r = 0;

                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;
                head_valid     = 1;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_rst_r      = 1;
                key_write_en_r = 0;
                core_valid     = 0;
                mem_address_r  = header[51:44];
                case(counter0_o)
                    31:      begin mem_data_o_r = temp_data_reg[127:95]; mem_we_r = 1; header[51:44] = header[51:44] + 1; header = header; end 
                    32:      begin mem_data_o_r = mem_data_o_r;          mem_we_r = 0; header[51:44] = header[51:44];     header[43] = 0;  end 
                    63:      begin mem_data_o_r = temp_data_reg[127:95]; mem_we_r = 1; header[51:44] = header[51:44] + 1; header = header; end 
                    95:      begin mem_data_o_r = temp_data_reg[127:95]; mem_we_r = 1; header[51:44] = header[51:44] + 1; header = header; end 
                    127:     begin 
                        mem_data_o_r = temp_data_reg[127:95];
                        mem_we_r = 1; 
                        header[63:52] = header[63:52]; 
                        if(~header[43])
                            header[51:44] = header[51:44] + 1;
                        else
                            header[51:44] = header[51:44];
                        header[31:0] = header[31:0] - 1; 
                    end 
                    default: begin mem_data_o_r = mem_data_o_r; mem_we_r = 0; header = header; end
                endcase
                if(header[31:0] == 0 & counter0_o == 7'b0000000)
                    mem_w_ready = 1;
                else 
                    mem_w_ready = 0;

            end
        `READ_NVM:
            begin
                aes_dec_rst_r = 1;
                aes_init_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_valid      = key_valid;
                key_rst_r      = 1;
                key_write_en_r = 0;
                mem_address_r  = header[51:44];
                case(counter0_o)
                    0:  begin header[51:44] = header[51:44] + 1; header[31:0] = header[31:0];     header[43] = header[43]; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; end
                    1:  begin header[51:44] = header[51:44] + 1; header[31:0] = header[31:0];     header[43] = header[43]; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; end 
                    2:  begin header[51:44] = header[51:44] + 1; header[31:0] = header[31:0];     header[43] = header[43]; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; end
                    3:  begin header[51:44] = header[51:44] + 1; header[31:0] = header[31:0];     header[43] = header[43]; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; end
                    4:  begin
                        aes_next_r = 1;
                        aes_i_reg = temp_data_reg;
                        aes_o_reg = aes_o_reg;
                        header[51:44] = header[51:44];
                        if(~header[43])
                            header[31:0] = header[31:0] - 1;
                        header[43] = header[43]; 
                    end
                    57: begin header[51:44] = header[51:44];     header[31:0] = header[31:0];     header[43] = 0; aes_i_reg = aes_i_reg; aes_o_reg = result_wire; end 
                    default begin header[51:44] = header[51:44]; header[31:0] = header[31:0];     header[43] = header[43]; aes_i_reg = aes_i_reg; aes_next_r = 0; aes_o_reg = aes_o_reg; end
                endcase
                if(header[31:0] == 32'h00000000 & counter0_o > header[42:36]) begin 
                    core_ready = 1;
                    core_valid = 1;
                end else begin 
                    core_ready = 0;
                    core_valid = 0;
                end
            end
        `EVAL_CRC:
            begin
                aes_dec_rst_r = 0;

                mem_w_ready = mem_w_ready;
                mem_address_r = 0;
                mem_we_r      = 0;

                mem_data_o_r = 0;
                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;

                head_valid = head_valid;

                header         = header;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 1; 
                key_rst_r      = 1;
                case(header[35:32])
                    `LOAD_KEY_C:
                        begin
                            core_ready     = core_ready;
                            core_valid     = core_valid;
                            if(counter1_o == 3'b111 && crc_data_o == 8'b00000000 && head_valid) begin 
                                key_write_en_r = 1;
                                key_valid      = 1;
                            end else begin
                                key_write_en_r = 0;
                                key_valid      = 0;
                            end 
                        end
                    `LOAD_BITSTREAM_C:
                        begin 
                            key_ready      = key_ready;
                            key_write_en_r = 1'b0;
                            key_valid      = key_valid;
                            if(counter1_o == 3'b111 && crc_data_o != 8'b00000000) begin 
                                core_valid = 1'b0;
                                core_ready = 1'b0;
                            end else begin
                                core_valid = 1'b1;
                                core_ready = core_ready; 
                        end 
                        end

                endcase 
              end
        `EVAL_AES:
            begin 
                aes_dec_rst_r = 0;
                mem_w_ready = mem_w_ready;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_dec_rst_r  = 1;
                head_valid     = 1;
                aes_init_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_rst_r      = 1;
                key_write_en_r = 0;
                if(counter0_o == 7'b1111111) begin
                    header[31:00] = header[31:00] - 1;
                    header[63:32] = header[63:32];
                end else if (counter0_o == 7'b0110101) begin
                    header[43] = 1'b0;
                end else 
                    header = header;
                
                   if(header[31:0] != 0) begin 
                    case(counter0_o)
                        0:   begin aes_next_r = 1; aes_i_reg = aes_i_reg;aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                        53:  begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = result_wire; core_ready = 0; core_valid = 0; end
                        126: begin aes_next_r = 0; aes_i_reg = temp_data_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end
                        default: begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                    endcase
                end else begin
                    case(counter0_o)
                        0:   begin aes_next_r = 0; aes_i_reg = aes_i_reg;aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                        53:  begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = result_wire; core_ready = 1; core_valid = 1; end
                        default: begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                    endcase
                end
            end
        `EVAL_CRC_AES:
            begin
                aes_dec_rst_r = 1;

                mem_w_ready = mem_w_ready;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_dec_rst_r  = 1;
                head_valid     = 1;
                aes_init_r     = 0;
                crc_rst_r      = 1;
                key_ready      = key_ready;
                key_rst_r      = 1;
                key_write_en_r = 0;
                if(counter0_o == 7'b1111111) begin
                    header[31:00] = header[31:00] - 1;
                    header[63:32] = header[63:32];
                end else if (counter0_o == 7'b0110101) begin
                    header[43] = 1'b0;
                end else 
                    header = header;

                if(header[31:0] != 0) begin 
                    case(counter0_o)
                        0:   begin aes_next_r = 1; aes_i_reg = aes_i_reg;aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                        53:  begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = result_wire; core_ready = 0; core_valid = 0; end
                        126: begin aes_next_r = 0; aes_i_reg = temp_data_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end
                        default: begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                    endcase
                end else begin
                    case(counter0_o)
                        0:   begin aes_next_r = 0; aes_i_reg = aes_i_reg;aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                        53:  begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = result_wire; core_ready = 1; core_valid = 1; end
                        default: begin aes_next_r = 0; aes_i_reg = aes_i_reg; aes_o_reg = aes_o_reg; core_ready = 0; core_valid = 0; end 
                    endcase
                end
            end
        `RESET:
            begin
                mem_w_ready = 0;
                aes_dec_rst_r = 0;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg      = 0;
                aes_o_reg      = 0;
                head_valid     = 0;
                core_ready     = 0;
                key_ready      = 0;
                core_valid     = 0;
                key_valid      = 0;
                header         = 0;
                aes_init_r     = 0;
                aes_next_r     = 0;
                crc_rst_r      = 0; 
                key_rst_r      = 0;
                key_write_en_r = 0;

            end
        `KEY_INIT:
            begin 
                mem_w_ready = mem_w_ready;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg = aes_i_reg;
                aes_o_reg = aes_o_reg;
                head_valid  = 1;
                core_ready    = 0;
                key_ready     = 0;
                key_valid = key_valid;
                aes_next_r    = 0;
                crc_rst_r     = 1; 
                key_rst_r     = 1;
                key_write_en_r = 0;
                header = header;
                case(counter0_o)
                        0: aes_init_r = 1'b1;
                        3: aes_init_r = 1'b1;
                    default: aes_init_r = 1'b0;
                endcase
                if(counter0_o == 7'b0001101)
                    key_ready = 1'b1;
                else
                    key_ready = 1'b0;
            end
        `LOCK:
            begin
                mem_w_ready = mem_w_ready;

                mem_address_r = 0;
                mem_we_r     = 0;

                mem_data_o_r = 0;
                aes_i_reg      = aes_i_reg;
                aes_o_reg      = 0;
                aes_dec_rst_r  = aes_dec_rst_r;
                core_ready     = core_ready;
                key_ready      = key_ready;
                core_valid     = core_valid;
                key_valid      = key_valid;
                header         = header;
                aes_init_r     = aes_init_r;
                aes_next_r     = aes_next;
                crc_rst_r      = crc_rst_r;
                key_rst_r      = key_rst_r;
                key_write_en_r = 0;
                head_valid     = head_valid;
            end


    endcase 
end

always @ (tck_i)
begin 
    if(~tck_i) begin
    case(next_state)
        `IDLE:  // reset state
            begin
                temp_data_reg = 0;
                data_o_r        = 0;
            end
        `DECODE:  // Read/decode header
            begin
                temp_data_reg = 0;
                data_o_r        = 0;
            end
        `LOAD_KEY:
            begin
                temp_data_reg = {data_i, temp_data_reg[127:1]};
                data_o_r        = 0;
            end
        `LOAD_KEY_C:
            begin
                temp_data_reg = {data_i, temp_data_reg[127:1]};
                data_o_r        = 0;
            end
        `LOAD_BITSTREAM: //FOR Ooperation w/o CRC or AES
            begin
                temp_data_reg = 0;
                data_o_r      = data_i;
            end
        `LOAD_BITSTREAM_C:
            begin 
                temp_data_reg = 0;
                data_o_r        = 0;
            end
        `LOAD_BITSTREAM_A:
            begin 
                temp_data_reg = {data_i, temp_data_reg[127:1]};
                data_o_r        = 0;
            end
        `LOAD_BITSTREAM_CA:
            begin 
                temp_data_reg = {data_i, temp_data_reg[127:1]};
                data_o_r      = 0;
            end
        `WRITE_NVM:
            begin
                temp_data_reg = {data_i, temp_data_reg[127:1]};
                data_o_r      = 0;
            end
        `READ_NVM:
            begin
                data_o_r      = 0;
                case(counter0_o)
                    1: temp_data_reg[031:00] = mem_data_in;
                    2: temp_data_reg[063:32] = mem_data_in;
                    3: temp_data_reg[095:64] = mem_data_in;
                    4: temp_data_reg[127:96] = mem_data_in;
                    default: temp_data_reg   = temp_data_reg;

                endcase
            end
        `EVAL_CRC:
            begin
                temp_data_reg = temp_data_reg;
                data_o_r        = 0;
            end
        `EVAL_AES:
            begin
                if(header[43]) begin 
                    data_o_r = 0;
                end else
                    data_o_r = aes_o_reg[counter0_o - 7'b0110101];

                if(header[31:0] == 32'h00000001 || header[31:0] == 32'h00000000 || (header[31:0] == 32'h00000002 & counter0_o == 7'b1111111))
                    temp_data_reg = temp_data_reg;
                else
                    temp_data_reg = {data_i, temp_data_reg[127:1]};
            end
        `EVAL_CRC_AES:
            begin
                if(header[43]) begin 
                    data_o_r = 0;
                end else
                    data_o_r = aes_o_reg[counter0_o - 7'b0110101];

                if((header[31:0] == 32'h00000001 & counter0_o <= 54) || header[31:0] == 32'h00000000)
                    temp_data_reg = temp_data_reg;
                else
                    temp_data_reg = {data_i, temp_data_reg[127:1]};
            end
        `LOCK:
            begin 
                temp_data_reg = 0;
                data_o_r      = 0;
            end
    endcase 
    end else begin 
                temp_data_reg = temp_data_reg;
                data_o_r      = data_o_r;

    end
end

    
always @ (tck_i)
begin 
    case(next_state)
        `IDLE:  // reset state
            begin
                progclk_o_reg = 0;
            end
        `DECODE:  // Read/decode header
            begin
                progclk_o_reg = 0;
            end
        `LOAD_KEY:
            begin
                progclk_o_reg = 0;
            end
        `LOAD_KEY_C:
            begin
                progclk_o_reg = 0;
            end
        `LOAD_BITSTREAM: //FOR Ooperation w/o CRC or AES
            begin
                progclk_o_reg = tck_i;
            end
        `LOAD_BITSTREAM_C:
            begin
                if(header[31:0] == 32'h00000001 & counter0_o > header[42:36])
                    progclk_o_reg = 0;
                else
                    progclk_o_reg = tck_i;
            end
        `LOAD_BITSTREAM_A:
            begin 
                progclk_o_reg = 0;
            end
        `LOAD_BITSTREAM_CA:
            begin 
                progclk_o_reg = 0;
            end
        `WRITE_NVM:
            begin
                progclk_o_reg = 0;        
            end
        `READ_NVM:
            begin
                if(header[43] || counter0_o == 1 || counter0_o == 2 || counter0_o == 3 || counter0_o == 4 || (header[31:0] == 32'h00000000 & counter0_o > header[42:36]))
                    progclk_o_reg = 0;
                else
                    progclk_o_reg = tck_i;
            end
        `EVAL_CRC:
            begin
                 progclk_o_reg = 0;
            end
        `EVAL_AES:
            begin 
                if(header[43] == 0)
                    progclk_o_reg = tck_i;
                else
                    progclk_o_reg = 0;
            end
        `EVAL_CRC_AES:
            begin
                if(header[43] == 0)
                    progclk_o_reg = tck_i;
                else
                    progclk_o_reg = 0;
            end
        `LOCK:
            begin
                 progclk_o_reg = 0;
            end
    endcase 
end



endmodule
 



module counter_3_bit (clk_i, en_i, count);

    input  clk_i;
    input  en_i;
    output [2:0] count;

    reg [2:0] counter;

    assign count = counter;

always @ (posedge clk_i)
begin
    if(~en_i)
        counter = 0;
    else
        counter = counter + 1;
end
endmodule

module counter_7_bit (clk_i, en_i, count);

    input  clk_i;
    input  en_i;
    output [6:0] count;

    reg [6:0] counter;

    assign count = counter;

always @ (posedge clk_i)
begin
    if(~en_i)
        counter = 0;
    else
        counter = counter + 1;
end
endmodule
