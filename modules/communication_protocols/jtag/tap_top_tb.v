//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//
//      File Name       : tap_top_tb.v
//      Brief           : testbench for JTAG
//
//------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------
//

`timescale 1ns/10ps     // time-unit = 1ns, precision = 10ps
`default_nettype none

module tap_top_tb;

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


    reg [10:0] tdi_header = 11'b01101100000;
    reg [4:0] tdi_footer  =  5'b00000;
    reg [10:0] tms_header = 11'b11000000110;
    reg [4:0] tms_footer  =  5'b11111;


    //reg data

    
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

    // Select signals for boundary scan or mbist
    .memory_sel_o(),
    .fifo_sel_o(),
    .confreg_sel_o(),
    .clk_byp_sel_o(),
    .observ_sel_o(),
    .pmu_w_cs_sel_o(),
    .pmu_wo_cs_sel_o(),

    .checksum_en(),
    .pmu_en(),
        
	.scan_in_o(),
    .pmu_tdi_o(),
    .pmu_tck_o(),
    .pmu_rst_o(),

    // TDI signals from sub-modules
    .memory_out_i(),     // from reg1 module
    .fifo_out_i(),       // from reg2 module
    .confreg_out_i(),     // from reg3 module
    .clk_byp_out_i(),
    .observ_out_i()
    );    

    //start of simulation
    initial   
    begin
    clk = 0;
    forever
        #halfperiod clk = ~clk;
    end
    integer i; 
    initial begin
        //--------------------------------------------- with checksum 
        
        #halfperiod
        //reset to initiate tap logic
        trst <= 1'b0;
        #period
        trst <= 1'b1;
        #period;
       
        for(i = 0; i < 11; i = i + 1)
        begin
            tms = tms_header[i];
            tdi = tdi_header[i];
            #period;

        end
        for(i = 0; i < 64; i = i + 1)
        begin
            tms = 0;
            tdi = 1;
            #period;

        end
        for(i = 0; i < 5; i = i + 1)
        begin
            tms = tms_footer[i];
            tdi = tdi_footer[i];
            #period;
        end

        #period;
        #period;

        //-------------------------------------------- without checksum 
        tdi_header = 11'b01101000000;


        
        #halfperiod
        //reset to initiate tap logic
        trst <= 1'b0;
        #period
        trst <= 1'b1;
        #period;
       
        for(i = 0; i < 11; i = i + 1)
        begin
            tms = tms_header[i];
            tdi = tdi_header[i];
            #period;

        end
        for(i = 0; i < 2500; i = i + 1)
        begin
            tms = 0;
            tdi = 1;
            #period;

        end
        for(i = 0; i < 5; i = i + 1)
        begin
            tms = tms_footer[i];
            tdi = tdi_footer[i];
            #period;
        end

        #period;
        #period;


        
        $stop; 
    end

endmodule

