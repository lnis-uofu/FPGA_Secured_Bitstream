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

`default_nettype wire

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
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

    //PMU -> FPGA WIRES
    wire config_enable_w;
    wire prog_clk;
    wire pReset;
    wire fpga_rst;
    wire fpga_clk_en;
    wire data_o;
    wire ccff_wire;
    

   // AES WIRES
    wire aes_reset_n_w;
    wire aes_reset_dec_w;
    wire aes_init_w;
    wire aes_next_w;
    wire aes_wc_w;
    wire aes_we_w;
    wire [1:0]  aes_address_w;
    wire [31:0] aes_write_data_w;
    wire [31:0] aes_read_data_w;
    wire aes_ready_w;
    wire aes_result_valid_w;


    // SHA WIRES
    wire sha_reset_n_w;
    wire sha_cs_w;
    wire sha_we_w;
    wire sha_wc_w;
    wire [2:0] sha_address_w;
    wire [31:0] sha_write_data_w;
    wire sha_digest_valid_w;




         pmu pmu_
        (
        .vpp                    (vccd1), // User area 1 1.8V power
        .gnd                    (vssd1), // User area 1 digital ground
        .tms_i                  (io_in[0]),
        .tck_i                  (user_clock2),
        .rst_i                  (io_in[1]),
        .tdi_i                  (io_in[2]),
        .td_o                   (io_in[3]),
        .config_enable          (config_enable_w),
        .progclk_o              (prog_clk),
        .pReset_o               (pReset),
        .fpga_rst               (fpga_rst),
        .fpga_clk_en            (fpga_clk_en),
        .data_o                 (data_o),
        .ccff_tail_i            (ccff_wire),
        .key_ready              (io_out[0]),
        .core_ready             (io_out[1]),
        .locked                 (io_out[2]),
        .aes_reset_n            (aes_reset_n_w),
        .reset_dec              (aes_reset_dec_w),
        .aes_init               (aes_init_w),
        .aes_next               (aes_next_w),
        .aes_wc                 (aes_wc_w),
        .aes_we                 (aes_we_w),
        .aes_address            (aes_address_w),
        .aes_write_data         (aes_write_data_w),
        .aes_read_data          (aes_read_data_w),
        .aes_result_valid       (aes_result_valid_w),
        .aes_key_ready          (aes_ready_w),
        .sha_reset_n_w          (sha_reset_n_w),
        .sha_cs_w               (sha_cs_w), 
        .sha_we_w               (sha_we_w),
        .sha_wc_w               (sha_wc_w),
        .sha_address_w          (sha_address_w),
        .sha_write_data_w       (sha_write_data_w),
        .sha_digest_valid_w     (sha_digest_valid_w)
   
        );

        aes aes128_
        (
        .vpp                    (vccd1), // User area 1 1.8V power
        .gnd                    (vssd1), // User area 1 digital ground
        .clk                    (user_clock2),
        .reset_n                (aes_reset_n_w),
        .reset_dec              (aes_reset_dec_w),
        .init                   (aes_init_w),
        .next                   (aes_next_w),
        .wc                     (aes_wc_w),
        .we                     (aes_we_w),
        .address                (aes_address_w),
        .write_data             (aes_write_data_w),
        .read_data              (aes_read_data_w),
        .key_ready              (aes_ready_w),
        .result_valid           (aes_result_valid_w)
        );
       
        sha256 sha256_
        (
        .vpp                    (vccd1), // User area 1 1.8V power
        .gnd                    (vssd1), // User area 1 digital ground
        .clk                    (user_clock2),
        .reset_n                (sha_reset_n_w),
        .cs                     (sha_cs_w),
        .we                     (sha_we_w),
        .wc                     (sha_wc_w),
        .address                (sha_address_w),
        .write_data             (sha_write_data_w),
        .digest_valid           (sha_digest_valid_w)
        );

        fpga_top fpga_top_
        (
        .vpp                        (vccd1), // User area 1 1.8V power
        .gnd                        (vssd1), // User area 1 digital ground
        .clk                        (user_clock2 & fpga_clk_en),
        .reset                      (fpga_rst), 
        .config_enable              (config_enable_w),
        .pReset                     (pReset),
        .prog_clk                   (prog_clk),  ///prog_clk
        .Test_en                    (io_in[4]),
        .IO_ISOL_N                  (io_in[5]),
		.gfpga_pad_sofa_plus_io_SOC_IN  (io_in[29:6]),
		.gfpga_pad_sofa_plus_io_SOC_OUT (io_out[26:3]),
		.gfpga_pad_sofa_plus_io_SOC_DIR (io_oeb[23:0]),        
        .ccff_head                  (data_o),
        .ccff_tail                  (ccff_wire)
        );

    assign io_out[27] = config_enable_w;
    assign io_out[28] = prog_clk;
    assign io_out[29] = pReset;
    assign io_out[30] = fpga_rst;
    assign io_out[31] = fpga_clk_en;
    assign io_out[32] = data_o;
    assign io_out[33] = ccff_wire;
    assign io_out[34] = aes_result_valid_w;
    assign io_out[35] = sha_digest_valid_w;


endmodule	// user_project_wrapper

`default_nettype wire
