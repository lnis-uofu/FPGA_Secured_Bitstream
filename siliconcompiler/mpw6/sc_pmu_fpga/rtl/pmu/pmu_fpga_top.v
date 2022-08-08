


module pmu_fpga_top
    (

    inout vpp,	// User area 1 1.8V supply
    inout gnd,	// User area 1 digital ground
    
    //JTAG in/out
    input   tms_i,
    input   tck_i,
    input   rst_i,
    input   tdi_i,
    output  td_o,

    
    //NVM  Interface
    input   [31:0] mem_data_i,
    output  [31:0] mem_data_o,
    output  [7:0] mem_address_o,
    output  mem_we_o,
    output  mem_clk_o,

    // status outputs
    output  key_ready,
    output  core_ready,
    output  locked,
    output  spy_ff,
        
    //FPGA in/out
    input   clk,
    input   Test_en,
    input   IO_ISOL_N,    
     
    input  [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_IN,
    output [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_OUT,
    output [0:23] gfpga_pad_EMBEDDED_IO_HD_SOC_DIR    
    );


    wire prog_clk;
    wire pReset;
    wire fpga_rst;
    wire fpga_clk_en;
    wire data_o;
    wire ccff_wire;


    pmu pmu_ 
    (
    .tms_i(tms_i),
    .tck_i(clk),
    .rst_i(rst_i),
    .tdi_i(tdi_i),
    .td_o(td_o),
    .mem_data_i(mem_data_i),
    .mem_data_o(mem_data_o),
    .mem_address_o(mem_address_o),
    .mem_we_o(mem_we_o),
    .mem_clk_o(mem_clk_o),
    .progclk_o(prog_clk),     
    .pReset_o(pReset),        
    .fpga_rst(fpga_rst),      
    .fpga_clk_en(fpga_clk_en),
    .data_o(data_o),          
    .ccff_tail_i(ccff_wire),  
    .key_ready(key_ready),
    .core_ready(core_ready),
    .locked(locked)
    );
     


    fpga_top_ fpga_22__ (
    .clk(clk & fpga_o_clk_en),
    .reset(fpga_rst),          
    .pReset(pReset),           
    .prog_clk(prog_clk),       
    .Test_en(Test_en),
    .IO_ISOL_N(IO_ISOL_N),
	.gfpga_pad_EMBEDDED_IO_HD_SOC_IN(gfpga_pad_EMBEDDED_IO_HD_SOC_IN),
	.gfpga_pad_EMBEDDED_IO_HD_SOC_OUT(gfpga_pad_EMBEDDED_IO_HD_SOC_OUT),
	.gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(gfpga_pad_EMBEDDED_IO_HD_SOC_DIR),        
    .ccff_head(data_o),    
    .ccff_tail(ccff_wire)  

    );
    assign spf_ff = fpga_22__.mem_bottom_track_1.mux_tree_tapbuf_size4_0_sram[2];

endmodule


    
