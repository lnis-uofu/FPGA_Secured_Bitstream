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
	reg	trst 		        = 1'b0;
    wire tdo_o;
    wire config_tdi_i;
    wire config_enable;
    
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
    .config_select_o(),

	.tdo_o(tdo_o),
    .config_enable(config_enable),

	.debug_tdi_i(),
	.bs_chain_tdi_i(),
	.mbist_tdi_i(),
    .config_tdi_i(config_tdi_i)

	);

    config_control uut1 
    (
    .clk(clk),
    .tdi(tdo_o),
    .en(config_enable),
    .tdo(config_tdi_i)
    );

    reg [99:0] bitstream = 100'h12345abcde12345abcde12345;
    integer i;

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
       
        //----------------------------
        // Configure Scan Chain
        // ---------------------------
        #period
        tms  <= 1'b0;
        #period
        tms  <= 1'b1;
        #period
        #period
        tms  <= 1'b0;
        #period
        #period
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period 

        tdi  <= 1'b1;
        tms  <= 1'b1;
        #period         // shift_ir       -> exit_ir
        tdi  <= 1'b0;
        #period         // exit_ir        -> update_ir
        #period         // update_ir      -> select_dr_scan
        tms  <= 1'b0;
        #period         // select_dr_scan -> capture_dr  
        #period         // capture_dr     -> shift_dr     at this point tap is configured in bypass mode and data can be shifted from in to out thru bypass reg:x
        #period         // 0 keeps tap in shift_dr

        // start of message
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
        tdi  <= 1'b0;
        #period
        tdi  <= 1'b1;
        #period
        tdi  <= 1'b0;
        #period
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
        tdi  <= 1'b0;

        #period
        // 1010 0101 1010 0101  

        for(i = 0; i < 99; i = i + 1)
            begin
            tdi <= bitstream[i];
                #period;
            end
        // end of message
        
        //drive tms high for at least 5 cycles = reset
        tms  <= 1'b1;
        #period
        #period
        #period
        #period
        #period
        #period
        #period
        #period
        #period
        #period
        #period
        #period

        #period
        #period
        #period
        #period
        #period
        #period

        #period
        #period
        #period
        #period
        #period
        #period
        
        //----------------------------
        // BYPASS END
        // ---------------------------
        
        $stop; 
    end

endmodule

