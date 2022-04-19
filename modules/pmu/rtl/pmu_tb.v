
`include "../../fpga_cores/config_chain.v"

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
    reg [2682:0] bitstream0;
    reg [2682:0] bitstream1;

    
    integer i, file, count0, count1, count2;
    initial begin

        // read in necessary files for bitstream
        file  = $fopen("../../../scripts/bitstream_pass.txt", "rb");
        count0 = $fscanf(file, "%b", golden_bitstream);
        count1 = $fscanf(file, "%b", bitstream0);
        count2 = $fscanf(file, "%b",  bitstream1);
        $fclose(file);
        
        clk = 0;
        forever
        #halfperiod clk = ~clk;
    end

    initial begin
    #period;
    #period;
    #halfperiod;

    //$display("%b", bitstream1);
    rst_i = 1'b1;
    #period;
    for(i = 0; i < 2683; i = i + 1)
    begin
        if(i < 2682) begin
            data_i <= bitstream0[i];
            tms    <= bitstream1[i];
            #period;
            en_i = 1'b0;
        end else
            data_i = 0;
    end
    data_i = 1'b0;
    en_i   = 1'b0;

    //$display(" ");
    $display("%b", fpga_core.data);
    $display(" ");
    $display("%b", golden_bitstream);
     
    if(fpga_core.data == golden_bitstream)
        $display("sucess");
    else
        $display("fail");
        
    #period;    
    #period;
    $stop;
    end


endmodule

