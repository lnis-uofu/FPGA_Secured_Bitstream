//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//
//      File Name       : pmu_tb.v
//      Brief           : testbench for PMU
//      
//      NOTES:
//      This testbecnh is to demostrate 3 functions of PMU V1
//
//          1. Load bitstream with passing CRC
//          2. Load bitstream with failing CRC
//          3. Load bitstream with CRC disabled
//
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------

module pmu_tb;

    localparam period     = 20;
    localparam halfperiod = 10;

    reg    clk = 1'b0;
    reg   en_i = 1'b0;
    reg data_i = 1'b0;
    reg  rst_i = 1'b0;
    reg    tms = 1'b0;
    

    wire prog_clk_w;
    wire pReset_w;
    wire ccff_head_w;
    wire ccff_tail_w;
    
    pmu_top pmu1
    (
    .tms_i(tms),
    .tck_i(clk),
    .rst_ni(rst_i),
    .tdi_i(data_i),
    .tdo_o(),
    .tdo_core_o(ccff_tail_w),
    .progclk_o(progclk_w),
    .pReset(pReset_w),
    .ccff_head_o(ccff_head_w)
    );

   config_chain fpga_core
    (
    .progclk(progclk_w),
    .pReset(pReset_w),
    .ccff_head(ccff_head_w),
    .ccff_tail(ccff_tail_w)
    );
    reg [2249:0] golden_bitstream;
    reg [2682:0] bitstream_pass_tdi;
    reg [2682:0] bitstream_pass_tms;
    reg [2682:0] bitstream_fail_tdi;
    reg [2682:0] bitstream_fail_tms;
    reg [2329:0] bitstream_wocrc_tdi;
    reg [2329:0] bitstream_wocrc_tms;

    
    integer i, file, count0, count1, count2, count3, count4, count5, count6;
    initial begin

        // read in necessary files for bitstream
        file  = $fopen("../../scripts/bitstream.txt", "rb");
        count0 = $fscanf(file, "%b", golden_bitstream);
        count1 = $fscanf(file, "%b", bitstream_pass_tdi);
        count2 = $fscanf(file, "%b", bitstream_pass_tms);
        count3 = $fscanf(file, "%b", bitstream_fail_tdi);
        count4 = $fscanf(file, "%b", bitstream_fail_tms);
        count5 = $fscanf(file, "%b", bitstream_wocrc_tdi);
        count6 = $fscanf(file, "%b", bitstream_wocrc_tms);
        $fclose(file);
        
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin
    #period;
    #period;

    $display(" -------------------- Begin Testig --------------------");
    $display(" ");
    $display(" Bitstream Golden model: ");
    $display("%b", golden_bitstream);
    $display(" ");
    $display(" Begin Test 1 - Bitstream with Passing CRC");
    $display(" ");

    rst_i = 1'b1;
    #period;
    for(i = 0; i < 2684; i = i + 1)
    begin
        if(i < 2683) begin
            data_i <= bitstream_pass_tdi[i];
            tms    <= bitstream_pass_tms[i];
            #period;
            en_i = 1'b0;
        end else
            data_i = 0;
    end
    data_i = 1'b0;
    en_i   = 1'b0;
     
    if(fpga_core.data == golden_bitstream)
        $display("      Bitstream sucessfully loaded in FPGA Core");
    else
        $display("      Bitstream failed to load correctly in FPGA Core");

    $display(" ");
    #period;    
    #period;
    $display(" Resulting data in FPGA Core: ");
    $display("%b", fpga_core.data);

    $display(" End Test 1 - Bitstream with Passing CRC");
    $display(" ");

    $display(" Begin Test 2 - Bitstream with Failing CRC");
    $display(" ");
    #period;
    #period;
    rst_i = 1'b0;
    #period;    
    #period;

    rst_i = 1'b1;
    #period;
    for(i = 0; i < 2684; i = i + 1)
    begin
        if(i < 2683) begin
            data_i <= bitstream_fail_tdi[i];
            tms    <= bitstream_fail_tms[i];
            #period;
            en_i = 1'b0;
        end else
            data_i = 0;
    end
    data_i = 1'b0;
    en_i   = 1'b0;
     
    if(fpga_core.data == 0)
        $display("       Bitstream error sucessfully detected");
    else
        $display("      Bitstream failed to detect incorrect bitstream");
    $display(" "); 
    #period;    
    #period;
    $display(" Resulting data in FPGA Core: ");
    $display("%b", fpga_core.data);
    $display(" ");
    $display(" End Test 2 - Bitstream with Failing CRC");
    $display(" ");

    $display(" Begin Test 3 - Bitstream with Failing CRC");
    $display(" ");

    rst_i = 1'b1;
    #period;
    for(i = 0; i < 2331; i = i + 1)
    begin
        if(i < 2330) begin
            data_i <= bitstream_wocrc_tdi[i];
            tms    <= bitstream_wocrc_tms[i];
            #period;
            en_i = 1'b0;
        end else
            data_i = 0;
    end
    data_i = 1'b0;
    en_i   = 1'b0;

    if(fpga_core.data == golden_bitstream)
        $display("      Bitstream sucessfully loaded in FPGA Core");
    else
        $display("      Bitstream failed to load correctly in FPGA Core");
    $display(" ");
    #period;    
    #period;
    $display(" Resulting data in FPGA Core: ");
    $display("%b", fpga_core.data);
    $display(" ");
    $display(" End Test 3 - Bitstream with Failing CRC");
    $display(" ");
    $stop;
    end


endmodule

