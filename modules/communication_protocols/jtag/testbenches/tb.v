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
	reg	tdi  		        = 1'b1;
	reg	trst 		        = 1'b0;
    reg debug               = 1'b0;
    reg bs_chain            = 8'h45;
    reg mbist               = 1'b0;
    
    //tap initialization
	tap_top uut
	(
	.tms_pad_i(tms),
	.tck_pad_i(clk), 
	.trst_pad_i(trst),    
	.tdi_pad_i(tdi),      
	.tdo_pad_o(), 
    .tdo_padoe_o(),
        
	.shift_dr_o(),
	.pause_dr_o(),
	.update_dr_o(),
	.capture_dr_o(),

	.extest_select_o(),
	.sample_preload_select_o(),
	.mbist_select_o(),
	.debug_select_o(),

	.tdo_o(),

	.debug_tdi_i(debug),
	.bs_chain_tdi_i(bs_chain),
	.mbist_tdi_i(mbist)    
	);
    

    //start of simulation
    initial   
    begin
    clk = 0;
    forever
        #halfperiod clk = ~clk;
    end
    
    initial begin
        #halfperiod
        //reset to initiate tap logic
        trst <= 1'b1;
        #period
        trst <= 1'b0;
        #period 

        //input sequence to reach ir shift state
        //EXTEST
        tms  <= 1'b0;
        #period
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period
        tdi  <= 1'b0;
        #period
        #period
        #period
        tms  <= 1'b1;
        //tdi  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period

        
        #period
        #period



        //SAMPLE_PRELOAD
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period
        #period
        #period


        //IDCODE
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period
        #period
        #period

        //DEBUG
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period
        #period
        #period
        tdi  <= 1'b1;
        tms  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period
        tms  <= 1'b0;
        #period
        #period
        #period
        
        //MBIST
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period
    
        tdi  <= 1'b1;
        tms  <= 1'b1; 
        #period
        tdi  <= 1'b0;
        #period

        tms  <= 1'b0;
        #period
        #period
        #period      
        #period






        //reset to initiate tap logic
        trst <= 1'b1;
        #period
        trst <= 1'b0;
        #period 
        
        // BYPASS
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        #period
        #period
        #period
        tms  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period

        tms  <= 1'b0;
        #period
        #period


        //make change
        //test data send byte
        tdi  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period
        tdi  <= 1'b0;
        #period
        tdi  <= 1'b0; 
        #period
        tdi  <= 1'b0;
        #period
        tdi  <= 1'b1;

        #period
        #period


        $stop; 
    end

endmodule

