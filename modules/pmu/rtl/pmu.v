
`default_nettype wire



`define  IDLE  4'b0000
`define  ZERO  4'b0001
`define   ONE  4'b0010
`define   TWO  4'b0011
`define THREE  4'b0100
`define FOUR   4'b0101
`define FIVE   4'b0110




 module pmu (
    input  data_i,
    input  en_i,
    input  rst_i,
    input  tck_i,
    input  checksum_en_i,

    output progclk_o,

    output flag_o_jtag,
    output flag_o_fpga,
    output data_o,

    //from core
    input  data_ccff_i,
    //to jtag
    output data_ccff_o
    );

    (* keep *) reg [3:0] state;
    (* keep *) reg [3:0] next_state;

    reg [63:0] header;
    wire [5:0] counter0_o;
    wire [2:0] counter1_o;

    reg counter0_en_r;
    reg counter1_en_r;
    wire  counter0_en;
    wire  counter1_en;

    wire   capture;
    wire   flag_o;
    reg ccff_en_r;
    reg capture_r;

    reg crc_en_r;
    wire crc_en;
    reg crc_rst_r;
    wire crc_rst;

    assign crc_en = crc_en_r;
    assign crc_rst = crc_rst_r;


    assign data_o = data_i;

    assign capture   = capture_r;
    assign progclk_o = ccff_en_r;

    assign flag_o_jtag = flag_o;
    assign flag_o_fpga = flag_o;
    assign data_ccff_o = data_ccff_i;

    assign counter0_en = counter0_en_r;
    assign counter1_en = counter1_en_r;


    counter_6_bit counter0
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
    .capture_i(capture),
    .flag_o(flag_o)
    );


always @ (posedge tck_i)
begin
    if(~rst_i)
        state <= `IDLE;
    else
        state <= next_state;
end


always @ (state or en_i or counter0_o or counter1_o)
begin
    case(state)
        `IDLE:  // reset state
            begin
                if(en_i) 
                    next_state <= `ZERO;
                else
                    next_state <= `IDLE;
            end
        `ZERO:  // Read header
            /* begin */
            /*     if(en_i) begin */
            /*         if(counter0_o == 6'b111111) begin */
            /*             if(checksum_en_i) */
            /*                 next_state <= `ONE; */
            /*             else */ 
            /*                 next_state <= `FIVE; */
            /*         end */ 
            /*         else */
            /*             next_state <= `ZERO; */
            /*     end else */
            /*         next_state <= `IDLE; */
            /* end */

            begin 
                if(en_i) begin 
                    if(checksum_en_i) begin
                        if(counter0_o == 6'b111111)
                            next_state <= `ONE;
                        else
                            next_state <=  `ZERO;
                    end else 
                        if(counter0_o == 6'b111110)
                            next_state <= `FIVE;
                        else
                            next_state <= `ZERO;

                end else
                    next_state <= `IDLE;
            
            end
        
        `ONE:   // Read CRC key (8-bits)
            begin
                if(en_i) begin
                    if(header[31:0] > 1) begin
                        if(counter1_o == 3'b111)
                            next_state <= `TWO;
                        else
                            next_state <= `ONE;
                    end
                    if(header[31:0] == 2)
                        if(counter1_o == 3'b111)
                            next_state <= `THREE;
                        else
                            next_state <= `ONE;
                    if(header[31:0] == 1)
                        if(counter1_o == 3'b111)
                            next_state <= `FOUR;
                        else
                            next_state <= `ONE;
                end else
                    next_state <= `IDLE;
            end
        `TWO:   // load data (64-bits)
            begin
                if(en_i) begin
                    if(counter0_o == 6'b111111) begin
                        next_state <= `ONE;
                    end else
                        next_state <= `TWO;
                end else
                    next_state <= `IDLE;
            end
        `THREE: // load LAST data (64-bits)
            begin
                if(en_i) begin
                    if(counter0_o == 6'b111110)
                        next_state <= `ONE;
                    else
                        next_state <= `THREE;
                end else
                    next_state <= `IDLE;
            end
        `FOUR: // Finish Sequence.
               // Does last crc check without en needing to be on
            begin
                next_state <= `IDLE;
            end
        `FIVE: // For operation without CRC
            begin
                if(en_i) begin
                    if(header[31:0] >= 1)
                        next_state <= `FIVE;
                    if(header[31:0] == 2 && counter0_o == header[63:32] - 1)
                        next_state = `IDLE;

                end else
                    next_state <= `IDLE;
            end

        default: begin next_state <= `IDLE; end
    endcase

end

always @ (posedge tck_i or state or counter0_o or counter1_o)
begin
    case(state)
        `IDLE:
            begin
                capture_r = 1'b0;
                crc_en_r = 1'b0;
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b0;
                crc_rst_r = 1'b0;
            end
        `ZERO:
            begin
                if(checksum_en_i) crc_en_r <= 1'b1; else crc_en_r <= 1'b0;
                capture_r = 1'b0;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
                crc_rst_r = 1'b1;
            end
        `ONE:
            begin
                //if(checksum_en_i) crc_en_r = 1'b1; else crc_en_r = 1'b0;
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b1;
                crc_rst_r = 1'b1;
                if(counter1_o == 3'b111) begin
                    crc_en_r  <= 1'b1;
                    capture_r <= 1'b1;
                end else begin 
                    capture_r <= 1'b0;
                    crc_en_r  <= 1'b1; 
                end

            end
        `TWO:
            begin
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
                capture_r     = 1'b0;
                if(counter0_o == 6'b000000 || counter0_o == 6'b000001) begin 
                    crc_rst_r <= 1'b1;
                    crc_en_r  <= 1'b1;
                end else begin 
                    crc_rst_r <= 1'b1;
                    crc_en_r  <= 1'b1;
                end


            end
        `THREE:
            begin
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
                if(counter0_o == 0 && counter1_o == 0) begin
                    crc_en_r  = 1'b0;
                    capture_r = 1'b0;
                    crc_rst_r = 1'b1;
                end else begin
                    if(checksum_en_i) crc_en_r = 1'b1; else crc_en_r = 1'b0;
                    capture_r = 1'b0;
                    crc_rst_r = 1'b1;
               end 
            end
        `FOUR:
            begin
                crc_en_r = 1'b0;
                capture_r = 1'b1;
                counter0_en_r = 1'b0;
                counter1_en_r = 1'b0;
                crc_rst_r = 1'b1;
            end
        `FIVE:
            begin 
                crc_en_r  = 1'b0;
                capture_r = 1'b0;
                counter0_en_r = 1'b1;
                counter1_en_r = 1'b0;
                
             end
        default: begin counter0_en_r = 1'b0; counter1_en_r = 1'b0; crc_en_r = 1'b0; end
    endcase


end

always @ (tck_i)
begin
    case(state)
        `IDLE:   ccff_en_r = 1'b0;
        `ZERO:   ccff_en_r = 1'b0;
        `ONE:    ccff_en_r = 1'b0;
        `TWO:
            begin
                if(counter0_o >= header[63:32] && header[31:0] == 1)
                    ccff_en_r = 1'b0;
                else
                    ccff_en_r = tck_i;
            end
        `THREE: 
            begin
                if(counter0_o >= header[63:32] && header[31:0] == 2)
                    ccff_en_r = 1'b0;
                else
                    ccff_en_r = tck_i;
            end
        `FOUR: ccff_en_r = 1'b0;
        `FIVE: 
            begin
                if(counter0_o >= header[63:32] - 2 && header[31:0] == 2)
                    ccff_en_r = 1'b0;
                else
                    ccff_en_r = tck_i;

            end 
        default: ccff_en_r = 1'b0;
    endcase
end

always @ (negedge tck_i)
begin
    case(state)
        `IDLE:   header = 0;
        `ZERO:   header <= {data_i, header[63:1]};
        `ONE:    header = header;
        `TWO:    
            begin
                header[63:32] = header[63:32];
                if(counter0_o == 6'b000000)
                    header[31:0] = header[31:0] - 1;
                else
                    header[31:0] = header[31:0];
            end
        `THREE:  header = header; 
        `FOUR:   header = 0;
        `FIVE: 
            begin 
                if(counter0_o == 6'b111111)
                    header[31:0] = header[31:0] - 1;
                else 
                    header[31:0] = header[31:0];
            end
        default: header =0;
    endcase
end

endmodule



module counter_6_bit (clk_i, en_i, count);

    input  clk_i;
    input  en_i;
    output [5:0] count;

    reg [5:0] counter;

    assign count = counter;

always @ (posedge clk_i)
begin
    if(~en_i)
        counter = 0;
    else
        counter = counter + 1;
end
endmodule

module counter_16_bit (clk_i, en_i, count);

    input  clk_i;
    input  en_i;
    output [15:0] count;

    reg [15:0] counter;

    assign count = counter;

always @ (posedge clk_i)
begin
    if(~en_i)
        counter = 0;
    else
        counter = counter + 1;
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


module crc_8 (clk_i, en_i, rst_i, data_i, capture_i, flag_o);


    input    clk_i;
    input     en_i;
    input    rst_i;
    input   data_i;
    input  capture_i;
    output  flag_o;

    reg [7:0] data;
    reg   flag_o_r;

    assign flag_o = flag_o_r;

always @ (posedge clk_i or en_i)
begin
    if(~en_i) begin
        data    <= data;
    end if(~rst_i) begin
        data    <= 0;
    end else begin
        data[0] <= data_i  ^ data[7];
        data[1] <= data[0] ^ data[7];
        data[2] <= data[1];
        data[3] <= data[2] ^ data[7];
        data[4] <= data[3];
        data[5] <= data[4] ^ data[7];
        data[6] <= data[5] ^ data[7];
        data[7] <= data[6] ^ data[7];
    end
end

always @ (negedge clk_i)
begin
        if(capture_i && data != 8'b00000000)
            flag_o_r = 1'b1;
        else
            flag_o_r = 1'b0;
end
endmodule
