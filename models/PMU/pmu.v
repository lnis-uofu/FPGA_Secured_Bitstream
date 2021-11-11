




module config_control(
    input  clk,
    input  tdi,
    input  en,
    output tdo
);
    
reg tdo_r = 0;
assign tdo = tdo_r;


//------------------------
//      Scan Chain
wire sc_en;
reg sc_en_r = 0;
assign sc_en = sc_en_r;

wire sc_data;
reg sc_data_r = 0;
assign sc_data = sc_data_r;
//------------------------
    
scan_chain sc
(
.clk(clk),
.d(sc_data),
.en(sc_en),
.out(sc_out)  
);
    
    
reg  [15:0] config_data   = 0;
reg  [3:0]  config_type   = 0;
reg  [11:0] config_length = 0;
reg  [31:0] counter = 0;

    
// load configuration registers
always @ (posedge clk)
begin
    if(en)
        counter = counter + 1;
    else
        counter = 32'b0;
end

always @ (posedge clk)
begin
    if(en & (counter < 17))
        config_data <= {tdi, config_data[15:1]};
    else
    begin 
        //tdo_r <= tdi;
        config_type   <= config_data[3:0];
        config_length <= config_data[15:4];
    end
end

//---------------------
//      mux the output
//---------------------
always @ (negedge en)   
begin
    config_data <= 0;
end

always @ (posedge clk or config_type)
begin
    case(config_type)
        1: begin sc_en_r <= 1'b1; sc_data_r <= tdi; end
        default: sc_en_r <= 1'b0;
    endcase
end
    
endmodule
