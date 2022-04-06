


module pmu_tb_128;

    parameter BITSTREAM_LENGTH =  128;

    localparam period          =   20;
    localparam halfperiod      =   10;
    
    reg clk    = 1'b0;
    reg tdi    = 1'b0;
    reg tms    = 1'b0;
    reg tck_o  = 1'b0;
    reg sc_se  = 1'b0;


    reg [13:0] tdi_header = 14'b00011100000110;
    reg [13:0] tms_header = 14'b00000010100000;

    reg [BITSTREAM_LENGTH-1:0] bitstream  =  0;

    reg [4 :0] tdi_footer =  5'b00000;
    reg [4 :0] tms_footer =  5'b11111;
    
    tap_top tap(
    // JTAG pads
    .tms_pad_i                 (tms),
    .tck_pad_i                 (clk),
    .trst_pad_i                (   ),
    .tdi_pad_i                 (tdi),
    .tdo_pad_o                 (   ),
    .tdo_padoe_o               (   ),

    // TAP states
    .shift_dr_o                (   ),
    .pause_dr_o                (   ),
    .update_dr_o               (   ),
    .capture_dr_o              (   ),

    // Select signals for boundary scan or mbist
    .extest_select_o           (   ),
    .sample_preload_select_o   (   ),
    .mbist_select_o            (   ),
    .debug_select_o            (   ),
    .pmu_select_o              (   ),

    // TDO signal that is connected to TDI of sub-modules.
    .tdo_o                     (),
    .pmu_enable                (sc_en),
    .pmu_tck_o                 (tck_o),

    // TDI signals from sub-modules
    .debug_tdi_i               (), // from debug module
    .bs_chain_tdi_i            (), // from Boundary Scan Chain
    .mbist_tdi_i               (), // from Mbist Chain

    .pmu_tdi_i                 ()
    );

    config_chain core(
    .clk                       (tck_o),
    .se                        (sc_en),
    .pReset                    (),
    .data_i                    (),
    .cfg_done_out              ()
    );

    pmu pmu(
    .data_i                    (),
    .data_o                    (),
    .cfg_done_i                ()
    );

    integer i, file, count;

    initial
    begin
        clk = 0;
        forever
        #halfperiod clk = ~clk;
        file = $fopen("../testbench/textfiles/bitstream_128.txt", "rb");
        count = $fscanf(file, "%b", bitstream)
    end

endmodule
    
