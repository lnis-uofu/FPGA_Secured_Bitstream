
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
    reg [7 :0]       data;
    reg [15:0]        sum;
    reg [7 :0]   checksum;
    reg        flag_o_reg;

    assign flag_o = flag_o_reg;

always @ (posedge clk_i)
begin
    state    = next_state;
    if(en_i)
    begin
        counter0 = (counter0 + 1) % 8;
    end
    if(!(en_i))
    begin
        counter0   = -1;
    end
end

always @ (state or en_i or rst_i or counter0)
begin
    if(!(rst_i))
    begin
        next_state = 0;
    end
    else
    begin
    case(state)
        0: // initilization state
            begin
                counter1   = -1;
                next_state =  1;
                data       =  0;
            end
        1: // Idle
            begin
                if(en_i)
                begin
                    next_state = 2;
                end 
                if(!(en_i))
                begin
                    next_state = 0;
                end
            end
        2:
            begin
                    case(counter0)
                        0: begin data = {data_i, data[7:1]}; end 
                        1: begin data = {data_i, data[7:1]}; end 
                        2: begin data = {data_i, data[7:1]}; end 
                        3: begin data = {data_i, data[7:1]}; end 
                        4: begin data = {data_i, data[7:1]}; end 
                        5: begin data = {data_i, data[7:1]}; end 
                        6: begin data = {data_i, data[7:1]}; end 
                        7: begin data     = {data_i, data[7:1]}; 
                                counter1 = (counter1 + 1) % 9;
                           end
                    endcase

            end
    endcase
    end
end

always @ (counter1 or rst_i)
begin
    if(!(rst_i))
    begin
        sum      =  0;
        checksum =  0;
        counter2 =  0;
    end
    if(en_i)
    begin
    case(counter1)
        0: begin sum = 0 + data; counter2 = 0; checksum = 0; end
        1: sum = sum + data;
        2: sum = sum + data;
        3: sum = sum + data;
        4: sum = sum + data;
        5: sum = sum + data;
        6: sum = sum + data;
        7: sum = sum + data;
        8: begin 
            checksum = sum[15:8] + sum[7:0];
            counter2 = counter2 + 1;
           end
    endcase
    end
end

always @ (counter2 or rst_i)
begin
    if(!(rst_i))
    begin
        flag_o_reg = 0;
    end
    if(en_i)
    begin
    case(counter2)
        1: 
        begin
            if(checksum + data != 8'b11111111)
                flag_o_reg = 1;
            else
            begin
                flag_o_reg = 0;
            end
        end
        default: flag_o_reg = 0;
    endcase
    end
end


endmodule
