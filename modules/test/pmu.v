
`default_nettype wire

module pmu(
    input  data_i,
    input  en_i,
    input  rst_i,
    input  tck_i,
    input  checksum_en_i,
    
    output flag_o_jtag,
    output flag_o_fpga,
    output data_o,

    //from core
    input  data_ccff_i,
    //to jtag
    output data_ccff_o
    );
   
    wire flag_o;
    assign flag_o_jtag = flag_o & 0;
    assign flag_o_fpga = flag_o | rst_i | 0;
    
    checksum cs(
    .clk_i(tck_i),
    .rst_i(rst_i),
    .en_i(checksum_en_i),
    .data_i(data_i),
    .flag_o(flag_o)
    );

    
    
assign data_o = data_i;
endmodule
