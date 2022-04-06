


module pmu_tb;


    localparam period     = 20;
    localparam halfperiod = 10;

    reg   clk = 1'b0;
    reg en_i = 1'b0;
    reg data_i = 1'b0;
    reg rst_i = 1'b1;
    
    pmu pmu0
    (
    .data_i(data_i),
    .en_i(en_i),
    .rst_i(rst_i),
    .tck_i(clk),
    .checksum_en_i(),
    .flag_o_jtag(),
    .flag_o_fpga(),
    .data_o(),
    .data_ccff_i(),
    .data_ccff_o()
    );

    reg [72:0] header = 72'b010111010000000000000000000000000100000000000000000000000000000000000100;

    reg [215:0] data = 216'b010111011111111111111111111111111111111111111111111111111111111111111111010111011111111111111111111111111111111111111111111111111111111111111111010111011111111111111111111111111111111111111111111111111111111111111111;

    integer i;
    initial begin 
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin 
    #period;
    en_i = 1'b1;
    #period;
    for(i = 0; i < 73; i = i + 1)
    begin
        if(i < 72) begin
            data_i = header[i];
            #period;
        end else 
            data_i = header[i];
    end
    for(i = 0; i < 217; i = i + 1)
    begin
        if(i < 216) begin
            data_i = data[i];
            #period;
        end else
            data_i = 0;
    end

    data_i = 1'b0;
    en_i   = 1'b0;
    #period;

    $stop;
    end


endmodule

