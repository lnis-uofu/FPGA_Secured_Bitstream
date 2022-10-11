
`default_nettype none


// Custom memory interface for a light weight SHA user authentication for PMU

module sha256(
              // Clock and reset.
              input wire                   clk,
              input wire                reset_n,

              // Control.
              input wire                     cs,
              input wire                     we,
              input wire                     wc, // write control (digest or block)

              // Data ports.
              input wire  [02 : 0]      address,
              input wire  [31 : 0]   write_data,
              output wire          digest_valid
             );

    reg [31 : 0] block_reg  [7 : 0];
    reg [31 : 0] digest_reg [7 : 0];

    reg data_valid_r;
    
    wire next_w, mode_w, ready, digest_valid_in;
    wire [255:0] digest;

    assign next_w = 0;
    assign mode_w = 1;

    assign digest_valid = data_valid_r;

    
   sha256_core core(
       .clk(clk),
       .reset_n(reset_n),
    
       .init(cs),
       .next(next_w),
       .mode(mode_w),

       .block({block_reg[7], block_reg[6], block_reg[5], block_reg[4], block_reg[3], block_reg[2], block_reg[1], block_reg[0]}),

       .ready(ready),
       .digest(digest),
       .digest_valid(digest_valid_in)
   );
    

always @ (negedge clk)
begin 
    if (~reset_n)
        begin
        block_reg[0]       <= 0;  
        block_reg[1]       <= 0;  
        block_reg[2]       <= 0;  
        block_reg[3]       <= 0;  
        block_reg[4]       <= 0;  
        block_reg[5]       <= 0;  
        block_reg[6]       <= 0;  
        block_reg[7]       <= 0;  
        digest_reg[0]      <= 0;
        digest_reg[1]      <= 0;
        digest_reg[2]      <= 0;
        digest_reg[3]      <= 0;
        digest_reg[4]      <= 0;
        digest_reg[5]      <= 0;
        digest_reg[6]      <= 0;
        digest_reg[7]      <= 0;
        end
    else
        begin
            if(wc) begin
                if(we)
                    block_reg[address] <= write_data;
                else
                    block_reg[address] <= block_reg[address];
            end else begin 
                if(we)
                    digest_reg[address] <= write_data;
                else
                    digest_reg[address] <= digest_reg[address];
            end
        end
end

always @ (clk)
begin
    if (~reset_n)
    begin 
            data_valid_r = 0;
    end
    else begin
        if(digest_valid_in) begin
            if(digest == {digest_reg[7], digest_reg[6], digest_reg[5], digest_reg[4], digest_reg[3], digest_reg[2], digest_reg[1], digest_reg[0]})
                data_valid_r = 1;
            else
                data_valid_r = 0;
        end else begin 
            data_valid_r = data_valid_r;
        end
    end
end

endmodule // sha256

//======================================================================
// EOF sha256.v
//======================================================================
