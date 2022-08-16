

`default_nettype wire

`define RESET                   5'b00000
`define IDLE                    5'b00001
`define LOCK                    5'b00010
`define DECODE                  5'b00011
`define EVAL_SHA                5'b00100
`define LOAD_KEY                5'b00101 // DONE
`define KEY_INIT                5'b00110 // This is the instruction for loading a key with SHA authentication 
`define LOAD_BITSTREAM          5'b00111 // DONE
`define AES_OUT                 5'b01000 // DONE
/* 5'b01001 */
/* 5'b01010 */
/* 5'b01011 */
/* 5'b01100 */
`define LOAD_BITSTREAM_AES      5'b01101 // DONE
/* 5'b01110 */
/* 5'b01111 */
`define PUSH_BITSTREAM          5'b10111 
                             /* 5'b11000 */
`define LOAD_BITSTREAM_SHA      5'b11001 // DONE
`define LOAD_BITSTREAM_SHA_AES  5'b11010



 module pmu_core (
    input  clk_i,
     
    input  data_i,
    input  rst_i,
    input  en_i,
    input  tck_i,

    output config_readback,
    output config_enable,
    output progclk_o,
    output pReset,
    output fpga_rst,
    output fpga_clk,
    output data_o,


    //from core
    input  data_ccff_i,
    //to jtag
    output data_ccff_o,

    //AES PORTS
    output aes_reset_n,
    output reset_dec,
    output aes_init,
    output aes_next,
    output aes_wc,
    output aes_we,
    output [1:0]  aes_address,
    output [31:0] aes_write_data,
    
    input  [31:0] aes_read_data,
    input  aes_result_valid,
    input  aes_key_ready,

    //SHA PORTS
    output sha_reset_n,
    output sha_cs,
    output sha_we,
    output sha_wc,
    output [02:0] sha_address,
    output [31:0] sha_write_data,
    input  digest_valid,

    output key_ready_o,
    output core_ready_o,
    output locked_o
    );

    // State Registers
    reg  [4:0] state, next_state;

    // Header Register
    reg  [31:0] header;

    //Temporary Data register (buffers)
    reg  [127:0] temp_data_r; 
    reg  [127:0] temp_key_r;
    reg  [127:0] buffer_o_r;
    wire [31:0] temp_data_w;
    assign temp_data_w = temp_data_r; 

    // Counter Wires/Register
    reg  counter0_en_r, counter1_en_r;
    wire counter0_en, counter1_en;
    assign counter0_en = counter0_en_r;
    assign counter1_en = counter1_en_r;
    wire [6:0] counter0_o;
    wire [7:0] counter1_o;

    // SHA
    reg sha_cs_r, sha_we_r, sha_wc_r, sha_reset_r; 
    reg  [2:0] sha_address_r;
    assign sha_reset_n    = sha_reset_r;
    assign sha_cs = sha_cs_r;
    assign sha_we = sha_we_r;
    assign sha_wc = sha_wc_r;
    assign sha_write_data = temp_data_r[127:96];
    assign sha_address = sha_address_r;
                 
    // AES
    reg  aes_reset_r, reset_dec_r, aes_init_r, aes_next_r;
    assign aes_reset_n = aes_reset_r;
    assign reset_dec   = reset_dec_r;
    assign aes_init    = aes_init_r;
    assign aes_next    = aes_next_r;
    assign aes_block   = temp_data_r;

    reg aes_wc_r, aes_we_r;
    assign aes_wc = aes_wc_r;
    assign aes_we = aes_we_r;

    reg [1:0] aes_address_r;
    reg [31:0] aes_mux_r;
    assign aes_address = aes_address_r;
    assign aes_write_data = aes_mux_r;

    // Key Memory Wires/Register
    reg  key_rst_r, key_we_r;
    wire key_rst_w, key_we_w;
    wire [127:0] key_write_data;
    assign key_rst_w = key_rst_r;
    assign key_we_w  = key_we_r;
    assign key_write_data = temp_key_r;
    wire [127:0] aes_key;

    // Status Wires/Register
    assign key_ready_o = aes_key_ready;
    reg core_ready_r;
    assign core_ready_o = core_ready_r;
    reg sha_status_r;
    reg aes_status_r;
    reg stop_r;
    reg locked_r;
    assign locked_o = locked_r;
    wire sha_status_w;
    assign sha_status_w = sha_status_r;
     
    // FPGA INTERFACE Wires/Register
    reg config_readback_r;
    reg config_enable_r;
    reg progclk_o_r;
    reg pReset_r;
    reg data_o_r;
    reg ccff_en_r;
    assign config_readback = config_readback_r;
    assign config_enable  = config_enable_r;
    assign progclk_o = progclk_o_r & tck_i;
    assign pReset = pReset_r;
    assign fpga_rst = rst_i;
    assign fpga_clk = clk_i & core_ready_r;
    assign data_o = data_o_r;
    assign data_ccff_o = data_ccff_i & ccff_en_r;
    

      
    counter_7_bit counter0
    (
    .clk_i(tck_i),
    .en_i(counter0_en),
    .count(counter0_o)
    );

    counter_8_bit counter1
    (
    .clk_i(tck_i),
    .en_i(counter1_en),
    .count(counter1_o)
    );

    key_storage key
    (
    .clk(tck_i),
    .rst(key_rst_w),
    .we(key_we_w),
    .write_data(key_write_data),
    .read_data(aes_key)
    );


always @ (posedge tck_i, negedge rst_i)
begin
    if(~rst_i)
        state <= `RESET;
    else
        state <= next_state;
end


//always @ (*)
always @ (negedge tck_i) //make en_i come clk cycle earlier?
begin 
    case(state)
        `RESET: //Reset state
            if(rst_i)
                next_state = `IDLE;
            else
                next_state = `RESET;
        `IDLE:  //PMU locked
            begin
                if(en_i)
                    next_state <= `DECODE;
                else
                    next_state <= `IDLE;
            end
        `LOCK:
            begin 
                if(~en_i)
                    next_state <= `IDLE;
                else
                    next_state <= `LOCK;
            end
        `DECODE:  // Read/decode header/public sha key
            begin 
                if(en_i) begin
                    if(counter1_o == 8'h1e) begin
                        if(header[4:0] == `LOAD_KEY || header[4:0] == `LOAD_BITSTREAM ||  header[4:0] == `LOAD_BITSTREAM_AES || header[4:0] == `PUSH_BITSTREAM)
                            next_state  <= header[4:0];
                        else 
                            next_state <= `DECODE;
                    end else if(counter1_o == 8'hff)
                        next_state <= `EVAL_SHA;
                    else 
                        next_state <= `DECODE;
                end else
                    next_state <= `IDLE;
            end
        `EVAL_SHA:
            begin 
                if(en_i) begin
                    if(counter1_o == 8'b11111111) begin
                        if(digest_valid)
                            next_state <= header[4:0];
                        else 
                            next_state <= `LOCK;
                    end else
                        next_state <= `EVAL_SHA;
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
        `KEY_INIT:
            begin 
                if(en_i) begin
                    if(counter0_o == 7'b0010010)
                        next_state <= `IDLE;
                    else
                        next_state <= `KEY_INIT;
                end else
                    next_state <= `IDLE;    
            end
        `LOAD_BITSTREAM:
            begin  
                if(en_i)
                    next_state <= `LOAD_BITSTREAM;
                else 
                    next_state <= `IDLE;
            end
        `LOAD_BITSTREAM_SHA:
            begin 
                if(en_i) begin 
                    if(counter1_o == 8'hff) 
                        next_state <= `EVAL_SHA;
                    else
                        next_state <= `LOAD_BITSTREAM_SHA;
                end else
                    next_state <= `IDLE;
            end
        `LOAD_BITSTREAM_AES:
            begin 
                if(en_i) begin 
                    if(header[14:5] == 0 && counter0_o == 7'h34)
                        next_state <= `AES_OUT;
                    else 
                        next_state <= `LOAD_BITSTREAM_AES;
                end else
                    next_state <= `IDLE;
            end
        `AES_OUT:
            begin 
                if(en_i) begin
                        next_state <= `AES_OUT;
                end else
                    next_state <= `IDLE;
            end
        `LOAD_BITSTREAM_SHA_AES:
            begin
                if(en_i) begin
                    if(counter1_o == 8'hff)
                        next_state <= `EVAL_SHA;
                    else
                        next_state <= `LOAD_BITSTREAM_SHA_AES;
                end else
                    next_state <= `IDLE;
            end
        `PUSH_BITSTREAM:
            begin 
                if(en_i)
                    next_state <= `PUSH_BITSTREAM;
                else
                    next_state <= `IDLE;
            end
        default: next_state = `IDLE;
    endcase
end

always @ (posedge tck_i)
begin 
    case(state)
        `RESET:                  locked_r = 0;
        `IDLE:                   locked_r = 0;
        `LOCK:                   locked_r = 1;
        `DECODE:                 locked_r = 0;
        `EVAL_SHA:               locked_r = 0;
        `LOAD_KEY:               locked_r = 0;
        `KEY_INIT:               locked_r = 0;
        `LOAD_BITSTREAM:         locked_r = 0;
        `LOAD_BITSTREAM_AES:     locked_r = 0;
        `LOAD_BITSTREAM_SHA:     locked_r = 0;
        `LOAD_BITSTREAM_SHA_AES: locked_r = 0;
        `PUSH_BITSTREAM:         locked_r = 0;
            default:             locked_r = 0;
    endcase
end


always @ (tck_i)
begin 
    case(state)
        `RESET:                  ccff_en_r = 0;
        `IDLE:                   ccff_en_r = 0;
        `LOCK:                   ccff_en_r = 0;
        `DECODE:                 ccff_en_r = 0;
        `EVAL_SHA:               ccff_en_r = 0;
        `LOAD_KEY:               ccff_en_r = 0;
        `KEY_INIT:               ccff_en_r = 0;
        `LOAD_BITSTREAM:         ccff_en_r = 0;
        `LOAD_BITSTREAM_AES:     ccff_en_r = 0;
        `LOAD_BITSTREAM_SHA:     ccff_en_r = 0;
        `LOAD_BITSTREAM_SHA_AES: ccff_en_r = 0;
        `PUSH_BITSTREAM:         ccff_en_r = 1;
            default:             ccff_en_r = 0;
    endcase
end

always @ (posedge tck_i) // yosys does not like
begin 
    case(next_state)
        `RESET:                 counter0_en_r = 0;
        `IDLE:                  counter0_en_r = 0;        
        `LOCK:                  counter0_en_r = 0;
        `DECODE:            
            begin 
                /* if((counter1_o == 8'h1e && header[4:0] == `LOAD_BITSTREAM_AES) || (counter1_o == 8'h1e && header[4:0] == `LOAD_KEY) || (counter1_o == 8'h1e && header[4:0] == `LOAD_BITSTREAM)) */
                    counter0_en_r = 0; 
                /* else */
                /*     counter0_en_r = 1; */
            end
        `EVAL_SHA:             counter0_en_r = 0;
        `LOAD_KEY:             counter0_en_r = 1;
        `KEY_INIT:             counter0_en_r = 1;
        `LOAD_BITSTREAM:       counter0_en_r = 0;
        `LOAD_BITSTREAM_SHA:
            begin
                if(header[14:5] == 0 && counter1_o < 8'hfd)
                    counter0_en_r = 1;
                else
                    counter0_en_r = 0;
            end
        `LOAD_BITSTREAM_AES: 
            begin
                /* if(counter1_o == 51) */
                    counter0_en_r = 1;
                /* else */
                /*     counter0_en_r = counter0_en_r; */
            end
        `AES_OUT:             counter0_en_r = 0;
        `LOAD_BITSTREAM_SHA_AES:
            begin
                if(header[14:5] == 0 && counter1_o >= 8'hb2)
                    counter0_en_r = 1;
                else
                    counter0_en_r = 0;
            end
        `PUSH_BITSTREAM:      counter0_en_r = 0;
              default:        counter0_en_r = 0;
    endcase
end

  
always @ (posedge tck_i) 
begin
    case(next_state)
        `RESET:                 counter1_en_r = 0;
        `IDLE:                  counter1_en_r = 0;        
        `LOCK:                  counter1_en_r = 0;
        `DECODE:                counter1_en_r = 1;
        `EVAL_SHA:              counter1_en_r = 1;
        `LOAD_KEY:              counter1_en_r = 0;
        `KEY_INIT:              counter1_en_r = 0;
        `LOAD_BITSTREAM:        counter1_en_r = 0;
        `LOAD_BITSTREAM_SHA:    counter1_en_r = 1;
        `LOAD_BITSTREAM_AES:
            begin 
               if(header[14:5] == 0 && counter0_o >= 7'h31)
                    counter1_en_r = 1;
                else
                    counter1_en_r = 0;
            end
        `AES_OUT:               counter1_en_r = 1;
       `LOAD_BITSTREAM_SHA_AES: counter1_en_r = 1;
        `PUSH_BITSTREAM:        counter1_en_r = 0;
        default:                counter1_en_r = 0;
    endcase
end


always @ (counter0_o)
begin 
    case(state)
        `RESET:           stop_r = 0;
        `IDLE:            stop_r = 0;
        `LOCK:            stop_r = 0;
        `DECODE:          stop_r = 0;
        `EVAL_SHA:        stop_r = stop_r;
        `LOAD_KEY:        stop_r = 0;
        `KEY_INIT:        stop_r = 0;
        `LOAD_BITSTREAM:  stop_r = 0;
        `LOAD_BITSTREAM_SHA:
            begin
                if(counter0_o == (header[21:15]) && header[14:5] == 0)
                    stop_r = 1;
                else
                    stop_r = stop_r; 
            end
        `LOAD_BITSTREAM_AES: stop_r = 0;
        `AES_OUT:
            begin
                if(counter0_o == (header[21:15] - 1) && header[14:5] == 0)
                    stop_r = 1;
                else
                    stop_r = stop_r; 
            end
        `LOAD_BITSTREAM_SHA_AES:
            begin
                if(counter0_o == (header[21:15]) && header[14:5] == 0)
                    stop_r = 1;
                else
                    stop_r = stop_r; 
            end
        `PUSH_BITSTREAM:  stop_r = 0;
         default:         stop_r = 0;
    endcase
end

always @ (negedge tck_i)
begin
    case(state)
        `RESET:              aes_next_r = 0;
        `IDLE:               aes_next_r = 0;
        `LOCK:               aes_next_r= 0;
        `DECODE:             aes_next_r = 0;
        `EVAL_SHA:           aes_next_r = 0;
        `LOAD_KEY:           aes_next_r = 0;
        `KEY_INIT:           aes_next_r = 0;
        `LOAD_BITSTREAM:     aes_next_r = 0;
        `LOAD_BITSTREAM_SHA: aes_next_r = 0;
        `LOAD_BITSTREAM_AES:
            begin
                if(counter0_o == 7'h7e)
                    aes_next_r = 1;
                else
                    aes_next_r = 0;
            end
        `AES_OUT:            aes_next_r = 0;
        `LOAD_BITSTREAM_SHA_AES: 
            begin
                if(counter1_o == 125 || counter1_o == 253)
                    aes_next_r = 1;
                else
                    aes_next_r = 0;
            end
        `PUSH_BITSTREAM:            aes_next_r = 0;
         default:                   aes_next_r = 0;
    endcase
end

always @ (posedge tck_i) 
begin
    case(state)
        `RESET:                 aes_wc_r = 0;
        `IDLE:                  aes_wc_r = 0;        
        `LOCK:                  aes_wc_r = 0;
        `DECODE:                aes_wc_r = 0;
        `EVAL_SHA:              aes_wc_r = 0;
        `LOAD_KEY:              aes_wc_r = 0;
        `KEY_INIT:              aes_wc_r = 0;
        `LOAD_BITSTREAM:        aes_wc_r = 0;
        `LOAD_BITSTREAM_SHA:    aes_wc_r = 0;
        `LOAD_BITSTREAM_AES:    aes_wc_r = 1;
        `AES_OUT:               aes_wc_r = 0;
       `LOAD_BITSTREAM_SHA_AES: aes_wc_r = 1;
        `PUSH_BITSTREAM:        aes_wc_r = 0;
        default:                aes_wc_r = 0;
    endcase
end

always @ (posedge tck_i) 
begin
    case(state)
        `RESET:                 aes_we_r = 0;
        `IDLE:                  aes_we_r = 0;        
        `LOCK:                  aes_we_r = 0;
        `DECODE:                aes_we_r = 0;
        `EVAL_SHA:              aes_we_r = 0;
        `LOAD_KEY:              aes_we_r = 0;
        `KEY_INIT:
            begin 
                case(counter0_o)
                     0: aes_we_r = 1;
                     1: aes_we_r = 1;
                     2: aes_we_r = 1;
                     3: aes_we_r = 1;
                    default:aes_we_r = 0;
                endcase
            end
        `LOAD_BITSTREAM:        aes_we_r = 0;
        `LOAD_BITSTREAM_SHA:    aes_we_r = 0;
        `LOAD_BITSTREAM_AES:
            begin 
                if(header != 0) begin 
                    case(counter0_o)
                     30:  aes_we_r = 1;
                     62:  aes_we_r = 1;
                     94:  aes_we_r = 1;
                    126:  aes_we_r = 1;
                    default:aes_we_r = 0;
                    endcase
                end else
                    aes_we_r = 0;
            end
        `AES_OUT:               aes_we_r = 0;
       `LOAD_BITSTREAM_SHA_AES: 
            begin 
                if(header != 0) begin 
                    case(counter1_o)
                     29:  aes_we_r = 1;
                     61:  aes_we_r = 1;
                     93:  aes_we_r = 1;
                    125:  aes_we_r = 1;
                    157:  aes_we_r = 1;
                    189:  aes_we_r = 1;
                    221:  aes_we_r = 1;
                    253:  aes_we_r = 1;

                    default:aes_we_r = 0;
                    endcase
                end else
                    aes_we_r = 0;
            end
        `PUSH_BITSTREAM:        aes_we_r = 0;
        default:                aes_we_r = 0;
    endcase
end

always @ (posedge tck_i) 
begin
    case(state)
        `RESET:                 aes_address_r = 0;
        `IDLE:                  aes_address_r = 0;        
        `LOCK:                  aes_address_r = 0;
        `DECODE:                aes_address_r = 0;
        `EVAL_SHA:
            begin 
                case(counter1_o)
                        50: aes_address_r = 0;
                        51: aes_address_r = 1;
                        52: aes_address_r = 2;
                        53: aes_address_r = 3;
                        54: aes_address_r = 0;
                    default: aes_address_r = aes_address_r;
                endcase
                
            end
        `LOAD_KEY:              aes_address_r = 0;
        `KEY_INIT:
            begin
                case(counter0_o)
                    0: aes_address_r = 0; 
                    1: aes_address_r = 1;
                    2: aes_address_r = 2;
                    3: aes_address_r = 3;
                    default: aes_address_r = aes_address_r;
                endcase
            end
        `LOAD_BITSTREAM:        aes_address_r = 0;
        `LOAD_BITSTREAM_SHA:    aes_address_r = 0;
        `LOAD_BITSTREAM_AES:
            begin
                case(counter0_o)
                    /* 31: aes_address_r  = 1; */
                    /* 49: aes_address_r  = 0; */
                    52: aes_address_r  = 1;
                    53: aes_address_r  = 2;
                    54: aes_address_r  = 3;
                    62: aes_address_r  = 1;
                    63: aes_address_r  = 2;
                    95: aes_address_r  = 3;
                    127: aes_address_r = 0;
                    default: aes_address_r = aes_address_r;
                endcase
            end
        `AES_OUT:
            begin 
                case(counter1_o)
                    2: aes_address_r = 1;
                    3: aes_address_r = 2;
                    4: aes_address_r = 3;
                default: aes_address_r = aes_address_r;
                endcase
            end
        `LOAD_BITSTREAM_SHA_AES:
                        begin
                case(counter1_o)
                     30: aes_address_r  = 1;
                     /* 51: aes_address_r  = 0; */
                     /* 52: aes_address_r  = 1; */
                     /* 53: aes_address_r  = 2; */
                     /* 54: aes_address_r  = 3; */
                     //56: aes_address_r  = 1;                       
                     62: aes_address_r  = 2;
                     94: aes_address_r  = 3;
                    126: aes_address_r  = 0;
                    //158: aes_address_r  = 1;
                    178: aes_address_r  = 0;
                    179: aes_address_r  = 1;
                    180: aes_address_r  = 2;
                    181: aes_address_r  = 3;
                    182: aes_address_r  = 1;
                    190: aes_address_r  = 2;
                    222: aes_address_r  = 3;
                    254: aes_address_r  = 0;
                    default: aes_address_r = aes_address_r;
                endcase
            end
        `PUSH_BITSTREAM:        aes_address_r = 0;
        default:                aes_address_r = 0;
    endcase
end

always @ (tck_i)
begin 
    case(state)
        `RESET:                  aes_mux_r = 0;
        `IDLE:                   aes_mux_r = 0;
        `LOCK:                   aes_mux_r = 1;
        `DECODE:                 aes_mux_r = 0;
        `EVAL_SHA: 
            if(header[4:0] == `KEY_INIT)
                aes_mux_r = temp_key_r[127:96];
            else
                aes_mux_r = temp_data_r;
        `LOAD_KEY:               aes_mux_r = temp_key_r[127:96];
        `KEY_INIT:
            begin 
                case(counter0_o)
                    0: aes_mux_r = temp_key_r[31:0]; 
                    1: aes_mux_r = temp_key_r[63:32]; 
                    2: aes_mux_r = temp_key_r[95:64]; 
                    3: aes_mux_r = temp_key_r[127:96]; 
                    default: aes_address_r = aes_address_r;
                endcase
            end
        `LOAD_BITSTREAM:         aes_mux_r = 0;
        `LOAD_BITSTREAM_AES:     aes_mux_r = temp_data_r[127:96];
        `LOAD_BITSTREAM_SHA:     aes_mux_r = 0;
        `LOAD_BITSTREAM_SHA_AES: aes_mux_r = temp_data_r[127:96];
        `PUSH_BITSTREAM:         aes_mux_r = 0;
            default:             aes_mux_r = 0;
    endcase
end

always @ (posedge tck_i) //yosys does not like
begin 
    case(state)
         `RESET:
            begin
                sha_reset_r   = 0;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;

                sha_address_r = 0;
                key_rst_r     = 0;
                aes_reset_r   = 0;
                reset_dec_r   = 0;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0; 
                pReset_r      = 0;
            end
        `IDLE:
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;

                sha_address_r = 0;
                key_rst_r     = 1;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0; 
                pReset_r      = 1;
            end
        `LOCK:
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0; 
                pReset_r      = 0;

            end
        `DECODE:  // Read/decode header
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 1;
                case(counter1_o)
                     30: sha_address_r = sha_address_r + 1;
                     62: sha_address_r = sha_address_r + 1;
                     94: sha_address_r = sha_address_r + 1;
                    126: sha_address_r = sha_address_r + 1;
                    158: sha_address_r = sha_address_r + 1;
                    190: sha_address_r = sha_address_r + 1;
                    222: sha_address_r = sha_address_r + 1;
                    254: sha_address_r = sha_address_r + 1;
                default: sha_address_r = sha_address_r;
                endcase
                key_rst_r     = 1;
                case(counter1_o)
                     29: sha_we_r = 1;
                     61: sha_we_r = 1;
                     93: sha_we_r = 1;
                    125: sha_we_r = 1;
                    157: sha_we_r = 1;
                    189: sha_we_r = 1;
                    221: sha_we_r = 1;
                    253: sha_we_r = 1;
                    default: sha_we_r = 0;
                endcase
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r = 0;
                aes_status_r  = 0; 
                pReset_r       = 1;
            end
        `EVAL_SHA:
            begin
                sha_reset_r   = 1;
                sha_wc_r      = 0;
                case(counter1_o)
                      9: begin sha_address_r = sha_address_r;     sha_cs_r = 1; end
                     30: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                     62: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                     94: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                    126: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                    158: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                    190: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                    222: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                    254: begin sha_address_r = sha_address_r + 1; sha_cs_r = 0; end
                default: begin sha_address_r = sha_address_r;     sha_cs_r = 0; end
                endcase
                key_rst_r     = 1;
                case(counter1_o)
                     29: sha_we_r = 1;
                     61: sha_we_r = 1;
                     93: sha_we_r = 1;
                    125: sha_we_r = 1;
                    157: sha_we_r = 1;
                    189: sha_we_r = 1;
                    221: sha_we_r = 1;
                    253: sha_we_r = 1;
                    default: sha_we_r = 0;
                endcase
                aes_reset_r   = 1;
                reset_dec_r     = 1;
                aes_init_r    = 0;
                sha_status_r = sha_status_r;
                aes_status_r = aes_status_r;
            end
        `LOAD_KEY:
            begin  
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                sha_we_r      = 0;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0;
                pReset_r      = 1;
            end
        `KEY_INIT:
            begin 
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                if(counter0_o == 7'b0000011)
                    aes_init_r = 1;
                else
                    aes_init_r = 0;
                sha_status_r  = 0;
                aes_status_r  = 0;
                pReset_r      = 1;
            end
        `LOAD_BITSTREAM:
            begin  
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0;
                pReset_r      = 1; 
            end
        `LOAD_BITSTREAM_SHA:  // Read/decode header
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 1;
                case(counter1_o)
                     30: sha_address_r = sha_address_r + 1;
                     62: sha_address_r = sha_address_r + 1;
                     94: sha_address_r = sha_address_r + 1;
                    126: sha_address_r = sha_address_r + 1;
                    158: sha_address_r = sha_address_r + 1;
                    190: sha_address_r = sha_address_r + 1;
                    222: sha_address_r = sha_address_r + 1;
                    254: sha_address_r = sha_address_r + 1;
                default: sha_address_r = sha_address_r;
                endcase
                key_rst_r     = 1;
                case(counter1_o)
                     29: sha_we_r = 1;
                     61: sha_we_r = 1;
                     93: sha_we_r = 1;
                    125: sha_we_r = 1;
                    157: sha_we_r = 1;
                    189: sha_we_r = 1;
                    221: sha_we_r = 1;
                    253: sha_we_r = 1;
                    default: sha_we_r = 0;
                endcase
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                if(counter1_o == 8'h02)
                    sha_status_r = 1;
                else
                    sha_status_r = sha_status_r;
                aes_status_r  = 0;
                pReset_r       = 1;
            end

        `LOAD_BITSTREAM_AES:
            begin  
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                sha_we_r      = 0;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                if(counter0_o == 'h34 && aes_status_r)
                    sha_status_r  = 1;
                else
                    sha_status_r  = sha_status_r;

                if(counter0_o == 'h7f)
                    aes_status_r  = 1;
                else
                    aes_status_r  = aes_status_r;
                pReset_r      = 1;
            end
        `AES_OUT:
            begin  
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                sha_we_r      = 0;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0;
                pReset_r      = 1;
            end
        `LOAD_BITSTREAM_SHA_AES:  // Read/decode header
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 1;
                case(counter1_o)
                     30: sha_address_r = sha_address_r + 1;
                     62: sha_address_r = sha_address_r + 1;
                     94: sha_address_r = sha_address_r + 1;
                    126: sha_address_r = sha_address_r + 1;
                    158: sha_address_r = sha_address_r + 1;
                    190: sha_address_r = sha_address_r + 1;
                    222: sha_address_r = sha_address_r + 1;
                    254: sha_address_r = sha_address_r + 1;
                default: sha_address_r = sha_address_r;
                endcase
                key_rst_r     = 1;
                case(counter1_o)
                     29: sha_we_r = 1;
                     61: sha_we_r = 1;
                     93: sha_we_r = 1;
                    125: sha_we_r = 1;
                    157: sha_we_r = 1;
                    189: sha_we_r = 1;
                    221: sha_we_r = 1;
                    253: sha_we_r = 1;
                    default: sha_we_r = 0;
                endcase
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                if(counter1_o == 8'h02)
                    sha_status_r = 1;
                else
                    sha_status_r = sha_status_r;
                aes_status_r  = 0;
                pReset_r       = 1;
            end
        `PUSH_BITSTREAM:
            begin
                sha_reset_r   = 1;
                sha_cs_r      = 0;
                sha_wc_r      = 0;
                sha_we_r      = 0;
                sha_address_r = 0;
                key_rst_r     = 1;
                aes_reset_r   = 1;
                reset_dec_r   = 1;
                aes_init_r    = 0;
                sha_status_r  = 0;
                aes_status_r  = 0; 
                pReset_r      = 1;
            end
    endcase 
end

always @ (negedge tck_i)
begin 
    case(state)
        `RESET:                  buffer_o_r   = 0;
        `IDLE:                   buffer_o_r   = 0;
        `LOCK:                   buffer_o_r   = 0;
        `DECODE:                 buffer_o_r   = 0;
        `EVAL_SHA:
            begin 
                if(header[4:0] == `LOAD_BITSTREAM_SHA_AES) begin
                    case(counter1_o)
                    51: 
                        begin
                            buffer_o_r[127:32] <= buffer_o_r[127:32];
                            buffer_o_r[31:0]   <= aes_read_data;
                        end
                    52:
                        begin 
                            buffer_o_r[127:63]  <= 0;
                            buffer_o_r[62:31]   <= aes_read_data;
                            buffer_o_r[30:0]    <= buffer_o_r[31:1];
                        end
                    53:
                        begin
                            buffer_o_r[127:94]  <= 0;
                            buffer_o_r[93:62]   <= aes_read_data;
                            buffer_o_r[61:0]    <= buffer_o_r[62:1];
                        end
                    54:
                        begin
                            buffer_o_r[127:125] <= 0;
                            buffer_o_r[124:93]  <= aes_read_data;
                            buffer_o_r[92:0]    <= buffer_o_r[93:1];

                        end
                    default: buffer_o_r = {1'b0, buffer_o_r[127:1]};
                endcase

                    /* buffer_o_r = aes_read_data; */
                /* else if(header[4:0] == `LOAD_BITSTREAM_SHA_AES && counter1_o <= 8'hb1) */
                    /* buffer_o_r = {1'b0, buffer_o_r[127:1]}; */
                    end else
                    buffer_o_r = buffer_o_r;
            end
        `LOAD_KEY:               buffer_o_r   = 0;
        `KEY_INIT:               buffer_o_r   = 0;
        `LOAD_BITSTREAM:         buffer_o_r   = 0;
        `LOAD_BITSTREAM_SHA:     buffer_o_r   = 0;
        `LOAD_BITSTREAM_AES: 
            begin 
                case(counter0_o)
                    52: 
                        begin
                            buffer_o_r[127:32] <= buffer_o_r[127:32];
                            buffer_o_r[31:0]   <= aes_read_data;
                        end
                    53:
                        begin 
                            buffer_o_r[127:63]  <= 0;
                            buffer_o_r[62:31]   <= aes_read_data;
                            buffer_o_r[30:0]    <= buffer_o_r[31:1];
                        end
                    54:
                        begin
                            buffer_o_r[127:94]  <= 0;
                            buffer_o_r[93:62]   <= aes_read_data;
                            buffer_o_r[61:0]    <= buffer_o_r[62:1];
                        end
                    55:
                        begin
                            buffer_o_r[127:125] <= 0;
                            buffer_o_r[124:93]  <= aes_read_data;
                            buffer_o_r[92:0]    <= buffer_o_r[93:1];

                        end
                    default: buffer_o_r = {1'b0, buffer_o_r[127:1]};
                endcase
            end
        `AES_OUT:
            begin
                case(counter1_o)
                    2: 
                        begin
                            buffer_o_r[127:32] <= buffer_o_r[127:32];
                            buffer_o_r[31:0]   <= aes_read_data;
                        end
                    3:
                        begin 
                            buffer_o_r[127:63]  <= 0;
                            buffer_o_r[62:31]   <= aes_read_data;
                            buffer_o_r[30:0]    <= buffer_o_r[31:1];
                        end
                    4:
                        begin
                            buffer_o_r[127:94]  <= 0;
                            buffer_o_r[93:62]   <= aes_read_data;
                            buffer_o_r[61:0]    <= buffer_o_r[62:1];
                        end
                    5:
                        begin
                            buffer_o_r[127:125] <= 0;
                            buffer_o_r[124:93]  <= aes_read_data;
                            buffer_o_r[92:0]    <= buffer_o_r[93:1];

                        end

                    default: buffer_o_r = {1'b0, buffer_o_r[127:1]};
                endcase
            end
        `LOAD_BITSTREAM_SHA_AES: 
            begin 
                case(counter1_o)
                    179: 
                        begin
                            buffer_o_r[127:32] <= buffer_o_r[127:32];
                            buffer_o_r[31:0]   <= aes_read_data;
                        end
                    180:
                        begin 
                            buffer_o_r[127:63]  <= 0;
                            buffer_o_r[62:31]   <= aes_read_data;
                            buffer_o_r[30:0]    <= buffer_o_r[31:1];
                        end
                    181:
                        begin
                            buffer_o_r[127:94]  <= 0;
                            buffer_o_r[93:62]   <= aes_read_data;
                            buffer_o_r[61:0]    <= buffer_o_r[62:1];
                        end
                    182:
                        begin
                            buffer_o_r[127:125] <= 0;
                            buffer_o_r[124:93]  <= aes_read_data;
                            buffer_o_r[92:0]    <= buffer_o_r[93:1];
                        end
                    default: buffer_o_r = {1'b0, buffer_o_r[127:1]};
                endcase
            end
        `PUSH_BITSTREAM: buffer_o_r = 0;
    endcase 
end

always @ (posedge tck_i) //yosys does not like
begin 
    case(state)
        `RESET:                  temp_data_r   = 0;
        `IDLE:  begin if(en_i)
                    temp_data_r = {data_i, temp_data_r[127:1]};
                else
                    temp_data_r = 0;end
        `LOCK:                   temp_data_r   = 0;
        `DECODE:                 temp_data_r = {data_i, temp_data_r[127:1]};
        `EVAL_SHA:               temp_data_r = {data_i, temp_data_r[127:1]};
        `LOAD_KEY:               temp_data_r = temp_data_r;
        `KEY_INIT:               temp_data_r = temp_data_r;
        `LOAD_BITSTREAM:         temp_data_r = temp_data_r;
        `LOAD_BITSTREAM_SHA:     temp_data_r = {data_i, temp_data_r[127:1]};
        `LOAD_BITSTREAM_AES:     temp_data_r = {data_i, temp_data_r[127:1]};
        `AES_OUT:                temp_data_r = {data_i, temp_data_r[127:1]};
        `LOAD_BITSTREAM_SHA_AES: temp_data_r = {data_i, temp_data_r[127:1]};
        `PUSH_BITSTREAM:         temp_data_r = 0;
    endcase 
end

always @ (posedge tck_i) // yosys does not like
begin 
    case(next_state)
        `RESET:     header = 0;
        `IDLE:  
            begin 
                if(en_i) 
                    header = {data_i, header[31:1]};
                else
                    header = 0;
            end
        `LOCK:      header = 0;
        `DECODE:
            begin 
                if(counter1_o <= 8'h1d)
                    header = {data_i, header[31:1]};
                else
                    header = header;
            end
        `EVAL_SHA:
           begin 
                if(counter1_o == 8'hfd && header[14:5] != 10'b1111111111 && header[4:0] == `LOAD_BITSTREAM_SHA && sha_status_r) begin
                    header[31:15] = header[31:15]; 
                    header[14:05] = header[14:05] - 1;
                    header[04:00] = header[04:00];
                end else if (header[4:0] == `LOAD_BITSTREAM_SHA_AES && (counter1_o == 8'hb1 || counter1_o == 8'h32) && sha_status_r && header[14:5] != 10'b1111111111) begin 
                    header[31:15] = header[31:15]; 
                    header[14:05] = header[14:05] - 1;
                    header[04:00] = header[04:00];
                end else
                    header = header;
            end

        `LOAD_KEY:  header = header;
        `KEY_INIT:  header = header;
        `LOAD_BITSTREAM:    header = header; 
        `LOAD_BITSTREAM_SHA: 
            begin 
                if(counter1_o == 8'h7d && header[14:5] != 10'b1111111111 && sha_status_r) begin
                    header[31:15] = header[31:15]; 
                    header[14:05] = header[14:05] - 1;
                    header[04:00] = header[04:00];
                end else
                    header = header;
            end
        `LOAD_BITSTREAM_AES:
            begin
                if(counter0_o == 7'h7e && aes_status_r) begin 
                    header[31:15] = header[31:15]; 
                    header[14:05] = header[14:05] - 1;
                    header[04:00] = header[04:00];
                end else 
                    header = header;
            end
        `AES_OUT: header = header; 
       `LOAD_BITSTREAM_SHA_AES: header = header;
         `PUSH_BITSTREAM: header = header;
        default: header = 0;
    endcase 
end

always @ (posedge tck_i)
begin 
    case(next_state)
        `RESET: temp_key_r    = 0;
        `IDLE:  temp_key_r    = 0;
        `LOCK:  temp_key_r    = 0;
        `DECODE:   
            begin
                if(counter1_o > 8'b00011100 && counter1_o < 8'b10011110 && header[4:0] == `KEY_INIT)
                    temp_key_r = {data_i, temp_key_r[127:1]};
                else
                    temp_key_r = temp_key_r;
            end
        `EVAL_SHA: temp_key_r = temp_key_r;
        `LOAD_KEY:
            begin 
                temp_key_r = {data_i, temp_key_r[127:1]};
            end
        `KEY_INIT: temp_key_r  = temp_key_r;
        `LOAD_BITSTREAM: temp_key_r  = 0;
        `LOAD_BITSTREAM_SHA: temp_key_r  = 0;
        `LOAD_BITSTREAM_AES:        temp_key_r  = 0;
        `AES_OUT: temp_key_r  = 0;
        `LOAD_BITSTREAM_SHA: temp_key_r  = 0;
        `LOAD_BITSTREAM_SHA_AES: temp_key_r  = 0;
        `PUSH_BITSTREAM:         temp_key_r  = 0;
        default: temp_key_r = temp_key_r;
    endcase
end
    
always @ (tck_i)
begin 
    case(state)
        `RESET:core_ready_r  = 0;
        `IDLE:core_ready_r  = core_ready_r;
        `LOCK:core_ready_r  = core_ready_r;
        `DECODE:core_ready_r  = core_ready_r;
        `EVAL_SHA:
            begin
                if(header[4:0] ==`LOAD_BITSTREAM_SHA_AES && counter1_o == 8'hff && digest_valid && header[21:15] == 10'b1111111111)
                    core_ready_r = 1;
                else
                    core_ready_r = core_ready_r;
            end
        `LOAD_KEY:core_ready_r  = core_ready_r;
        `KEY_INIT:core_ready_r  = core_ready_r;
        `LOAD_BITSTREAM:
            begin 
                if(next_state == `IDLE)
                    core_ready_r = 1;
                else
                    core_ready_r = 0;
            end
        `LOAD_BITSTREAM_SHA:       core_ready_r = 0;
        `LOAD_BITSTREAM_AES:       core_ready_r = 0;
        `AES_OUT:  
            if(counter0_o == header[21:15] - 1)
                core_ready_r = 1;
            else
                core_ready_r = core_ready_r;
        `LOAD_BITSTREAM_SHA_AES:       core_ready_r = 0;
        `PUSH_BITSTREAM:         core_ready_r = 0;
            default:core_ready_r  = core_ready_r;
    endcase
end

always @ (negedge tck_i)
begin
    case(state)
        `RESET:    key_we_r      = 0;
        `IDLE:     key_we_r      = 0;
        `LOCK:     key_we_r      = 0;
        `DECODE:   key_we_r      = 0;
        `EVAL_SHA: 
            begin 
               if(header[4:0] == `KEY_INIT && counter1_o == 8'hfe)
                    key_we_r = 1;
                else
                    key_we_r = 0;
            end
        `LOAD_KEY:
            begin 
                if(counter0_o == 7'b1111111)
                    key_we_r    = 1;
                    else
                    key_we_r    = 0;
            end
        `KEY_INIT:       key_we_r = 0;
        `LOAD_BITSTREAM: key_we_r      = 0;
        `LOAD_BITSTREAM_SHA: key_we_r      = 0;
        `LOAD_BITSTREAM_AES: key_we_r      = 0;
        `AES_OUT: key_we_r      = 0;
        `LOAD_BITSTREAM_SHA_AES: key_we_r = 0;
        `PUSH_BITSTREAM:         key_we_r = 0;
        default: key_we_r = 0;
    endcase
end

 
always @ (tck_i, data_i, next_state, buffer_o_r)
begin 
    case(state)
        `RESET:
            begin
                progclk_o_r       = 0;
                data_o_r          = 0;
                config_readback_r = 0;
                config_enable_r   = 0;
            end
        `IDLE:
            begin 
                progclk_o_r       = 0;
                data_o_r          = 0;
                config_readback_r = 0;
                config_enable_r   = 0;

            end
        `LOCK:
            begin
                progclk_o_r = 0;
                data_o_r    = 0;
                config_readback_r = 0;
                config_enable_r   = 0;
            end
        `DECODE:
            begin
                if(counter1_o >= 8'h1e && (header[4:0] == `LOAD_BITSTREAM)) begin 
                    progclk_o_r = 1;
                    data_o_r    = data_i;
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end else begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end
            end
        `EVAL_SHA:
            begin 
                if((counter1_o >= 8'hfe && (header[4:0] == `LOAD_BITSTREAM_SHA)) && header[14:5] != 10'b1111111111) begin 
                    progclk_o_r = 1;
                    data_o_r    = data_i;
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end else if(counter1_o <= 8'hb2 && sha_status_r && header[14:5] != 10'b1111111111) begin 
                    if(stop_r) begin 
                        progclk_o_r = 0;
                        data_o_r    = 0;
                        config_readback_r = 0;
                        config_enable_r   = 0;
                    end else begin 
                        progclk_o_r = 1;
                        data_o_r    = buffer_o_r[0];
                        config_readback_r = 0;
                        config_enable_r   = 1;
                    end 
                 end else begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end
            end
        `LOAD_KEY:
            begin 
                progclk_o_r = 0;
                data_o_r    = 0;
                config_readback_r = 0;
                config_enable_r   = 0;
            end
        `KEY_INIT:
            begin 
                progclk_o_r = 0;
                data_o_r    = 0;
                config_readback_r = 0;
                config_enable_r   = 0;
            end
        `LOAD_BITSTREAM:
            begin
                if(~en_i) begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end else begin
                    data_o_r    = data_i;
                    progclk_o_r = 1;
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end
            end
        `LOAD_BITSTREAM_SHA:
            begin
                if(stop_r) begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end else begin 
                    progclk_o_r = 1;
                    data_o_r    = data_i;
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end
            end
        `LOAD_BITSTREAM_AES:
            begin
                if(sha_status_r) begin 
                    progclk_o_r = 1;
                    data_o_r    = buffer_o_r[0];
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end else begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end
            end
        `AES_OUT:
            begin
                if(en_i) begin 
                    progclk_o_r = 1;
                    data_o_r    = buffer_o_r[0];
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end else begin 
                    progclk_o_r = 0;
                    data_o_r = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end
            end
        `LOAD_BITSTREAM_SHA_AES:
            begin
                if(counter1_o >= 8'hb3 && ~stop_r) begin 
                    progclk_o_r = 1;
                    data_o_r    = buffer_o_r[0];
                    config_readback_r = 0;
                    config_enable_r   = 1;
                end else begin 
                    progclk_o_r = 0;
                    data_o_r    = 0;
                    config_readback_r = 0;
                    config_enable_r   = 0;
                end
            end
        `PUSH_BITSTREAM:
            begin
                progclk_o_r = 1;
                data_o_r    = 0;
                config_readback_r = 0;
                config_enable_r   = 1;
            end
        default: begin progclk_o_r = 0; data_o_r = 0; end
    endcase

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

module counter_8_bit (clk_i, en_i, count);

    input  clk_i;
    input  en_i;
    output [7:0] count;

    reg [7:0] counter;

    assign count = counter;

always @ (posedge clk_i)
begin
    if(~en_i)
        counter = 0;
    else
        counter = counter + 1;
end
endmodule
