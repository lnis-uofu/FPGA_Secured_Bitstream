

// Custom memory interface wrapping the upstream Secworks aes_core for the PMU.
// AES-256: the key is loaded as eight 32-bit words (address 0-7, wc=0) and a
// 128-bit ciphertext block as four words (address 0-3, wc=1). The core is
// operated decrypt-only (encdec=0) with a 256-bit key (keylen=1).

module aes(

    input        clk,
    input        reset_n,
    input        reset_dec, // retained for interface compatibility (unused)

    input        init,
    input        next,
    input        wc,
    input        we,

    input   [2:0] address,
    input  [31:0] write_data,
    output [31:0] read_data,

    output      key_ready,

    output      result_valid
);
    // Memories
    reg [31:0] key_reg    [7:0];
    reg [31:0] block_reg  [3:0];
    reg [31:0] result_reg [3:0];

    reg [31:0] read_reg;

    wire [127:0] aes_result_w;
    wire aes_result_valid_w;
    wire aes_ready_w;

    assign result_valid = aes_result_valid_w;
    assign key_ready = aes_ready_w;

    assign read_data = result_reg[address[1:0]];

   aes_core aes_core_
    (
        .clk(clk),
        .reset_n(reset_n),
        .encdec(1'b0),   // decrypt-only in the PMU
        .init(init),
        .next(next),
        .ready(aes_ready_w),
        .key({key_reg[7], key_reg[6], key_reg[5], key_reg[4], key_reg[3], key_reg[2], key_reg[1], key_reg[0]}),
        .keylen(1'b1),   // 256-bit key
        .block({block_reg[3], block_reg[2], block_reg[1], block_reg[0]}),
        .result(aes_result_w),
        .result_valid(aes_result_valid_w)
    );


always @ (posedge clk)
begin
    if(~reset_n || ~aes_result_valid_w) begin
        result_reg[3] = 0;
        result_reg[2] = 0;
        result_reg[1] = 0;
        result_reg[0] = 0;
    end else begin
        result_reg[3] = aes_result_w[127:96];
        result_reg[2] = aes_result_w[095:64];
        result_reg[1] = aes_result_w[063:32];
        result_reg[0] = aes_result_w[031:00];
    end

end

always @ (negedge clk)
begin
    if(~reset_n) begin
        key_reg[7]    <= 0;
        key_reg[6]    <= 0;
        key_reg[5]    <= 0;
        key_reg[4]    <= 0;
        key_reg[3]    <= 0;
        key_reg[2]    <= 0;
        key_reg[1]    <= 0;
        key_reg[0]    <= 0;
        block_reg[3]  <= 0;
        block_reg[2]  <= 0;
        block_reg[1]  <= 0;
        block_reg[0]  <= 0;

    end else begin
        if(wc)begin
            if(we)
                block_reg[address[1:0]] <= write_data;
            else
                block_reg[address[1:0]] <= block_reg[address[1:0]];
        end else begin
            if(we)
                key_reg[address] <= write_data;
            else
                key_reg[address] <= key_reg[address];
        end
    end
end




endmodule
