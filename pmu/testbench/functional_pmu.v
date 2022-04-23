module functional_pmu;

    localparam period     = 20;
    localparam halfperiod = 10;

    // 32 - bits of data + 8 bits CRC key
    reg [63:0] header0  = 64'b0000000000000000000000000000000000000000000000000000000000000011;
    reg [72:0] header1  = 73'b0100010100000000000000000000000000000000000000000000000000000000000000110;
    reg [63:0]  data0   = 64'b0001000010111100001110000000000000000011100000000010000000000111;
    reg [72:0]  data1   = 73'b0000000000000000000000000000000000000000000000000000000000000000000000000;


    reg clk = 1'b0;
    reg pmu_en = 1'b0;
    reg pmu_rst_i = 1'b0;
    reg pmu_data_i = 1'b0;
    reg capture_i = 1'b0;
    reg checksum_en_i = 1'b0;
    reg data_ccff_i = 1'b0;
        

    
    pmu pmu0
    (
    .data_i(pmu_data_i),
    .en_i(pmu_en),
    .rst_i(pmu_rst_i),
    .tck_i(clk),
    .checksum_en_i(checksum_en_i),
    .progclk_o(),
    .flag_o_jtag(),
    .flag_o_fpga(),
    .data_o(),
    .data_ccff_i(),
    .data_ccff_o()
    );

    integer i;

    initial begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin 
    #period;
    pmu_rst_i = 1'b1;
    #period;
    checksum_en_i = 1'b0;  // CRC-8 is off 
    pmu_en = 1'b1;
    for(i = 0; i < 65; i = i + 1)
    begin
        if(i < 64) begin 
            pmu_data_i = header0[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 65; i = i + 1)
    begin
        if(i < 64) begin 
            pmu_data_i = data0[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 65; i = i + 1)
    begin
        if(i < 64) begin 
            pmu_data_i = data0[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 65; i = i + 1)
    begin
        if(i < 64) begin 
            pmu_data_i = data0[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    pmu_en = 1'b0;


    #period;
    #period;
    checksum_en_i = 1'b1;  // CRC-8 is on
    pmu_en = 1'b1;
    for(i = 0; i < 74; i = i + 1)
    begin
        if(i < 73) begin 
            pmu_data_i = header1[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 73; i = i + 1)
    begin
        if(i < 72) begin 
            pmu_data_i = data1[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 73; i = i + 1)
    begin
        if(i < 72) begin 
            pmu_data_i = data1[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    for(i = 0; i < 73; i = i + 1)
    begin
        if(i < 72) begin 
            pmu_data_i = data1[i];
            #period;
        end else
            pmu_data_i = 1'b0;
    end
    pmu_en = 1'b0;
    #period;
    #period;


    $stop;
    
    end
    
endmodule
