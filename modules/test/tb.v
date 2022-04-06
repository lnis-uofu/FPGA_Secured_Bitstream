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


`include "pmu.v"
`include "tap_top.v"
`include "config_chain.v"

module tb;

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

    reg [71:0] data0 = 72'b 110011100110000011011111000111100010111011010000011000000110000000010011;
    reg [71:0] data1 = 72'b 110011100110000011011111000111100010111011010000011000000110000000010010;

    //reg data

    wire pmu_data_i;
    wire pmu_rst_i;
    wire pmu_en_i;   
    wire pmu_data_o;
    wire pmu_tck_i;

    wire checksum_en;
    wire jtag_rst;
    wire fpga_rst;
    wire pmu_to_jtag;
    wire fpga_data_o;
    
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

    .checksum_en(checksum_en),
    .pmu_en(pmu_en_i),
        
	.scan_in_o(),
    .pmu_tdi_o(pmu_data_i),
    .pmu_tck_o(pmu_tck_i),
    .pmu_rst_o(pmu_rst_i),

    // TDI signals from sub-modules
    .memory_out_i(),     // from reg1 module
    .fifo_out_i(),       // from reg2 module
    .confreg_out_i(),     // from reg3 module
    .clk_byp_out_i(),
    .observ_out_i(),
    .pmu_tdo_i(pmu_to_jtag),
    .rst_flag(jtag_rst)
    );    


    pmu pmu0
    (
    .data_i(pmu_data_i),
    .en_i(pmu_en_i),
    .rst_i(pmu_rst_i),
    .tck_i(pmu_tck_i),
    .checksum_en_i(checksum_en),
    .flag_o_jtag(jtag_rst), //todo
    .flag_o_fpga(fpga_rst),
    .data_o(pmu_data_o),
    .data_ccff_i(fpga_data_o), //todo
    .data_ccff_o(pmu_to_jtag) //todo
    );
    
   config_chain fpga_core
    (
    .clk(tck), //prog clk
    .pReset(fpga_rst),
    .data_i(pmu_data_o),
    .data_o(fpga_data_o)
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
        for(i = 0; i < 64; i = i + 1)
        begin
            tms = 0;
            tdi = data0[i];
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

        
        //--------------------------------------------- with passing checksum 
        tdi_header = 11'b01101100000;
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
            tdi = data0[i];
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


        //--------------------------------------------- with failing checksum 
        
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
            tdi = data1[i];
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

