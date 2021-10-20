




module config_control(
    input  clk,
    input  tdi,
    input  en,
    output tdo
);


reg  [15:0] config_data   = 0;
reg  [3:0]  config_type   = 0;
reg  [11:0] config_length = 0;
reg  [31:0] counter = 0;


// load configuration registers
always @ (posedge clk)
    if(en)
        counter = counter + 1;
    else
        counter = 32'b0;

always @ (posedge clk)
    if(en & (counter < 17))
        config_data <= {config_data[14:0], tdi};
    else
    begin
        config_type   <= config_data[3:0];
        config_length <= config_data[15:4];
    end
    
endmodule
