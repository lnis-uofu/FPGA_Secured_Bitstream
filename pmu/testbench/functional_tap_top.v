//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//
//      File Name       : tap_top_tb.v
//      Brief           : testbench for JTAG
//      
//      NOTES:
//      JTAG INSTUCTIONS:
//
// * Supported Instructions
//      IDCODE          5'b00010
//      REG1            5'b00100
//      REG2            5'b00101
//      REG3            5'b00110
//      REG_CLK_BYP     5'b00111
//      REG_OBSERV      5'b01000
//      REG6            5'b01001
//      BYPASS          5'b11111
//      PMU_W_CS        5'b11011
//      PMU_WO_CS       5'b11010
//
// * Instruction values defined in tap_top.v
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//

`timescale 1ns/10ps     // time-unit = 1ns, precision = 10ps

module functional_tap_top;

	reg  	clk = 1'b0;	

    //simulation parameters
    localparam period       = 20;
    localparam halfperiod   = 10;

	reg tms  		        = 1'b1;
	reg	tck  		        = 1'b0;
	reg	tdi  		        = 1'b0;
	reg	trst 		        = 1'b1;
    reg debug               = 1'b0;
    reg bs_chain            = 8'h45;
    reg mbist               = 1'b0;
    reg tdo_i               = 1'b1;


    reg [10:0] tdi_header = 11'b01101100000;
    reg [4:0] tdi_footer  =  5'b00000;
    reg [10:0] tms_header = 11'b11000000110;
    reg [4:0] tms_footer  =  5'b11111;

    //tap initialization
	tap_top uut
	(
	.tms_i(tms),
	.tck_i(clk), 
	.rst_ni(trst),    
	.td_i(tdi),      
	.td_o(), 
        
	.shift_dr_o(),
	.update_dr_o(),
	.capture_dr_o(),

    /* // Select signals for boundary scan or mbist */
    /* .memory_sel_o(), */
    /* .fifo_sel_o(), */
    /* .confreg_sel_o(), */
    /* .clk_byp_sel_o(), */
    /* .observ_sel_o(), */
    /* .pmu_sel_o(), */
        
	.scan_in_o(),
    .pmu_tdi_o(),
    .pmu_tck_o(),
    .pmu_rst_o(),
    .pmu_en_o(),


    // TDI signals from sub-modules
    .memory_out_i(),     // from reg1 module
    .fifo_out_i(),       // from reg2 module
    .confreg_out_i(),     // from reg3 module
    .clk_byp_out_i(),
    .observ_out_i(),
    .pmu_tdo_i(tdo_i)
    );    
    integer i;

    //start of simulation
    initial   
    begin
    clk = 0;
    forever
        #halfperiod clk = ~clk;
    end


    /* initial begin */
        
    /*     #halfperiod */
    /*     //reset to initiate tap logic */
    /*     trst <= 1'b0; */
    /*     #period */
    /*     trst <= 1'b1; */
    /*     #period; */
       
    /*     for(i = 0; i < 11; i = i + 1) */
    /*     begin */
    /*         tms = tms_header[i]; */
    /*         tdi = tdi_header[i]; */
    /*         #period; */

    /*     end */
    /*     for(i = 0; i < 64; i = i + 1) */
    /*     begin */
    /*         tms = 0; */
    /*         tdi = 1; */
    /*         #period; */

    /*     end */
    /*     for(i = 0; i < 5; i = i + 1) */
    /*     begin */
    /*         tms = tms_footer[i]; */
    /*         tdi = tdi_footer[i]; */
    /*         #period; */
    /*     end */

    /*     #period; */
    /*     #period; */

        
    /*     $stop; */ 
    /* end */

endmodule
