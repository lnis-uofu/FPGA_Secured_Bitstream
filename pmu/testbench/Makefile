# -*- Makefile -*-

WORK_LIB = pmu_tb_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}


#TOP_ENTITY_NAME = functional_crc8
#TOP_ENTITY_NAME = functional_pmu
TOP_ENTITY_NAME = functional_fpga
# TOP_ENTITY_NAME = functional_pmu_top
#TOP_ENTITY_NAME = functional_tap_top
#TOP_ENTITY_NAME = pre_pnr_ccff_test


VERILOG_SOURCES += \
		${PMU_TB_DIR}/pre_pnr_ccff_test.v \
		${PMU_TB_DIR}/functional_crc8.v \
		${PMU_RTL_DIR}/crc8.v \
		${PMU_TB_DIR}/functional_pmu.v \
		${PMU_RTL_DIR}/pmu.v \
		${PMU_TB_DIR}/functional_pmu_top.v \
		${PMU_TB_DIR}/functional_fpga.v \
		${PMU_RTL_DIR}/pmu_core.v \
		${PMU_TB_DIR}/functional_tap_top.v \
		${PMU_RTL_DIR}/tap_top.v \
		${PMU_RTL_DIR}/aes/aes_decipher_block.v \
		${PMU_RTL_DIR}/aes/aes_inv_sbox.v \
		${PMU_RTL_DIR}/aes/round_key.v \
		${PMU_RTL_DIR}/aes/aes_key_mem.v \
		${PMU_RTL_DIR}/aes/aes_sbox.v \
		${PMU_RTL_DIR}/aes/aes_core.v \
		${PMU_RTL_DIR}/key_storage.v \
		${PMU_RTL_DIR}/mem.v \
		${PMU_RTL_DIR}/sha/sha256_core.v \
		${PMU_RTL_DIR}/sha/sha256_k_constants.v \
		${PMU_RTL_DIR}/sha/sha256_w_mem.v \
		${PMU_RTL_DIR}/fpga/fpga_top.v \
		${PMU_RTL_DIR}/fpga/lb/grid_clb.v \
		${PMU_RTL_DIR}/fpga/lb/grid_io_bottom_bottom.v \
		${PMU_RTL_DIR}/fpga/lb/grid_io_top_top.v \
		${PMU_RTL_DIR}/fpga/lb/grid_io_left_left.v \
		${PMU_RTL_DIR}/fpga/lb/grid_io_right_right.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_clb_.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric.v\
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__carry_follower.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_io_mode_io_.v \
		${PMU_RTL_DIR}/fpga/lb/logical_tile_io_mode_physical__iopad.v \
		${PMU_RTL_DIR}/fpga/sub_module/arch_encoder.v \
		${PMU_RTL_DIR}/fpga/sub_module/inv_buf_passgate.v \
		${PMU_RTL_DIR}/fpga/sub_module/local_encoder.v \
		${PMU_RTL_DIR}/fpga/sub_module/luts.v \
		${PMU_RTL_DIR}/fpga/sub_module/memories.v \
		${PMU_RTL_DIR}/fpga/sub_module/mux_primitives.v \
		${PMU_RTL_DIR}/fpga/sub_module/muxes.v \
		${PMU_RTL_DIR}/fpga/sub_module/shift_register_banks.v \
		${PMU_RTL_DIR}/fpga/sub_module/wires.v \
		${PMU_RTL_DIR}/fpga/CustomModules/digital_io_hd.v \
		${PMU_RTL_DIR}/fpga/CustomModules/sky130_fd_sc_hd_wrapper.v \
		${PMU_RTL_DIR}/fpga/CustomModules/ql_ccff.v \
		${PMU_RTL_DIR}/fpga/CustomModules/ql_iso_io_logic.v \
		${PMU_RTL_DIR}/fpga/routing/cbx_1__0_.v \
		${PMU_RTL_DIR}/fpga/routing/cbx_1__1_.v \
		${PMU_RTL_DIR}/fpga/routing/cbx_1__2_.v \
		${PMU_RTL_DIR}/fpga/routing/cby_0__1_.v \
		${PMU_RTL_DIR}/fpga/routing/cby_1__1_.v \
		${PMU_RTL_DIR}/fpga/routing/cby_2__1_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_0__0_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_0__1_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_0__2_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_1__0_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_1__1_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_1__2_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_2__0_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_2__1_.v \
		${PMU_RTL_DIR}/fpga/routing/sb_2__2_.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2_1.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv_1.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp_1.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2_1.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_2.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_4.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b_4.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn_4.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp_1.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp.behavioral.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.functional.v \
		${PMU_RTL_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.behavioral.v \




VSIM_OPTIONS     +=
VSIM_GUI_OPTIONS += -do init.do
VSIM_CMD_OPTIONS += -do "run -all; quit"

include ${PROJECT_CONFIG_DIR}/Makefile.def
