// Modified from:
// https://github.com/efabless/caravel_user_project/blob/main/verilog/rtl/user_project_wrapper.v
//
// Original license below:
//
// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
//`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
//`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

    wire fpga_rst;
    wire prog_clk;
    wire prog_rst;
    wire pmu_fpga_clk_en;
    wire pmu_fpga_rst;
    wire data_o;
    wire ccff_wire;
 
    pmu pmu_ (
        .vpp            (vccd1), // User area 1 1.8V power
        .gnd            (vssd1), // User area 1 digital ground
        // JTAG ports
        .tms_i          (io_in[0]),
        .tck_i          (io_in[1]),
        .rst_i          (io_in[2]),
        .tdi_i          (user_clock2),
        .td_o           (io_out[0]),
        // Memory interface
        .mem_data_i     (la_data_in[31:0]),
        .mem_data_o     (la_data_out[63:32]),
        .mem_address_o  (la_data_out[71:64]),
        .mem_we_o       (la_data_out[72]),
        .mem_clk_o      (la_data_out[73]),
        // FPGA control signals
        .progclk_o      (prog_clk),
        .pReset_o       (prog_rst),
        .fpga_rst       (pmu_fpga_rst),
        .fpga_clk_en    (pmu_fpga_clk_en),
        .data_o         (data_o),
        .ccff_tail_i    (ccff_wire),
        // Status control signals
        .key_ready      (io_out[5]),
        .core_ready     (io_out[6]),
        .locked         (io_out[7])
    );

    fpga_top fpga22_ (
        .vpp            (vccd1), // User area 2 1.8V supply
        .gnd            (vssd1), // User area 2 digital ground
        .clk            (user_clock2 & pmu_fpga_clk_en),
        .reset          (fpga_rst & pmu_fpga_rst),
        .pReset         (prog_rst),
        .prog_clk       (prog_clk),
        .Test_en        (io_in[4]),
        .IO_ISOL_N      (io_in[5]),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_IN (io_in[37:14]),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_OUT({io_oeb[13:0],io_out[37:28]}),
        .gfpga_pad_EMBEDDED_IO_HD_SOC_DIR(io_oeb[37:14]),
        .ccff_head      (data_o),
        .ccff_tail      (ccff_wire)
    );

    // FPGA control
    assign io_in[6]   = fpga_rst;
    assign io_out[0]  = prog_clk;
    assign io_out[1]  = prog_rst;
    assign io_out[2]  = pmu_fpga_rst;
    assign io_out[3]  = pmu_fpga_clk_en;
    assign io_out[4]  = data_o;
    // PMU Control
    assign io_out[10] = mprj.pmu_tdi_w;
    assign io_out[11] = mprj.pmu_tck_w;
    assign io_out[12] = mprj.pmu_rst_w;
    assign io_out[13] = mprj.pmu_en_w;
    // AES-128
    assign io_out[14] = mprj.aes_reset_n_w;
    assign io_out[15] = mprj.aes_reset_dec_w;
    assign io_out[16] = mprj.aes_init_w;
    assign io_out[17] = mprj.aes_next_w;
    assign io_out[18] = mprj.aes_result_valid_w;
    // SHA-256
    assign io_out[19] = mprj.sha_reset_n_w;
    assign io_out[20] = mprj.sha_init_w;
    assign io_out[21] = mprj.sha_next_w;
    assign io_out[22] = mprj.sha_mode_w;
    assign io_out[23] = mprj.sha_ready_w;
    assign io_out[24] = mprj.sha_digest_valid_w;
    // Decrypted bitstream
    assign io_out[25] = ccff_wire;

endmodule // user_project_wrapper

`default_nettype wire
