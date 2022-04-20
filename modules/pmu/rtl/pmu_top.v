`include "../../communication_protocols/jtag/tap_top.v"
`include "pmu.v"

module pmu_top (
    input  tms_i,
    input  tck_i,
    input  rst_ni,
    input  tdi_i,
    output tdo_o,

    // conncects tdo from 
    // config chain to tdo of tap
    input  tdo_core_o,

    output progclk_o,
    output pReset,
    output ccff_head_o
);


    wire pmu_en;
    wire pmu_data_i;
    wire pmu_tck_i;
    wire pmu_rst_i;
    wire checksum_en_i;

    wire pmu_to_jtag_tdo;

    wire progclk_o_w;

    wire flag_o_jtag_w;
    wire flag_o_fpga_w;

    assign pReset =  ~flag_o_fpga_w;
    assign progclk_o = progclk_o_w;

    pmu pmu0
    (
    .data_i(pmu_data_i),
    .en_i(pmu_en),
    .rst_i(pmu_rst_i),
    .tck_i(pmu_tck_i),
    .checksum_en_i(checksum_en_i),
    .progclk_o(progclk_o_w),
    .flag_o_jtag(flag_o_jtag_w),
    .flag_o_fpga(flag_o_fpga_w),
    .data_o(ccff_head_o),
    .data_ccff_i(tdo_core_o),
    .data_ccff_o(pmu_to_jtag_tdo)
    );

    tap_top tap0 
    (
    .tms_i(tms_i),
    .tck_i(tck_i),
    .rst_ni(rst_ni || flag_o_jtag_w),
    .td_i(tdi_i),
    .td_o(tdo_o),

    // TAP states
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


    .checksum_en(checksum_en_i),
    .pmu_en(pmu_en),

    // TDO signal that is connected to TDI of sub-modules.
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
    .pmu_tdo_i(pmu_to_jtag_tdo)
    );


endmodule
