
`default_nettype wire

module checksum(
    clk_i, 
    rst_i,
    en_i, 
    data_i, 
    flag_o
);

    input           clk_i; 
    input           rst_i;
    input            en_i;
    input          data_i;
    output         flag_o;


    reg [3 :0]      state;
    reg [3 :0] next_state;
    reg [3 :0]   counter0;
    reg [3 :0]   counter1;
    reg [3 :0]   counter2;
    reg [7 :0]       word;
    reg [15:0]        sum;
    reg [7 :0]   checksum;
    reg        flag_o_reg;

    assign flag_o = flag_o_reg;

    wire load_data_ctrl;

always @ (posedge clk_i)
begin
    if(~rst_i)
        state <= IDLE;
    else
        state <= next_state;
end

always @ (posedge clk_i)
begin
    if(load_data_ctrl) begin
        word = {data_i, word[7:1]};
        counter0 = counter0 + 1;
    end else begin
        word = 0;
        counter0 = 0;
    end
end
    

always @ (state or en_i)
begin 
    case(state)
        IDLE: // reset state
            begin 
                if(en_i)
                    load_data_ctrl <= 0;
                    next_state <= ZERO;
                else 
                    load_data_ctrl <= 0;
                    next_state <= IDLE;
            end
        ZERO: // load data
            begin 
                if(en_i) begin
                    load_data_ctrl <= 1;
                    next_state <= ONE;
                    if(counter0 == 7) begin

                end else 
                    load_data_ctrl <= 0;
                    next_state <= IDLE;    
            end
         ONE: // load checsum key
            begin 
                if(en_i)

                else
                    next_state <= IDLE;    
            end
         TWO: // Evaluate sum and key
            begin 
                if(en_i)

                else
                    next_state <= IDLE;
            end
end


    
endmodule
