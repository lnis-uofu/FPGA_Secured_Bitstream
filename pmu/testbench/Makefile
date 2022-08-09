# -*- Makefile -*-

<<<<<<< HEAD
WORK_LIB     = pmu_tb_lib
WORK_DIR     = ${PROJECT_BUILD_DIR}/${WORK_LIB}


#TOP_ENTITY_NAME = functional_load_key
#TOP_ENTITY_NAME = functional_load_bitstream
#TOP_ENTITY_NAME = functional_load_bitstream_sha
#TOP_ENTITY_NAME = functional_load_bitstream_aes
TOP_ENTITY_NAME = functional_load_bitstream_sha_aes
#TOP_ENTITY_NAME = functional_push_bitstream
#TOP_ENTITY_NAME = functional_fpga
#TOP_ENTITY_NAME = functional_tap_top



VERILOG_SOURCES += \
		${PMU_TB_DIR}/functional_fpga.v \
		${PMU_TB_DIR}/functional_load_key.v \
		${PMU_TB_DIR}/functional_load_bitstream.v \
		${PMU_TB_DIR}/functional_load_bitstream_sha.v \
		${PMU_TB_DIR}/functional_load_bitstream_aes.v \
		${PMU_TB_DIR}/functional_load_bitstream_sha_aes.v \
		${PMU_TB_DIR}/functional_push_bitstream.v \
		${PMU_RTL_DIR}/pmu/pmu.v \
		${PMU_RTL_DIR}/pmu/pmu_core.v \
		${PMU_RTL_DIR}/pmu/tap_top.v \
		${PMU_RTL_DIR}/pmu/key_storage.v \
		${PMU_RTL_DIR}/aes/aes_decipher_block.v \
		${PMU_RTL_DIR}/aes/aes_inv_sbox.v \
		${PMU_RTL_DIR}/aes/round_key.v \
		${PMU_RTL_DIR}/aes/aes_key_mem.v \
		${PMU_RTL_DIR}/aes/aes_sbox.v \
		${PMU_RTL_DIR}/aes/aes_core.v \
		${PMU_RTL_DIR}/sha/sha256.v \
		${PMU_RTL_DIR}/sha/sha256_core.v \
		${PMU_RTL_DIR}/sha/sha256_k_constants.v \
		${PMU_RTL_DIR}/sha/sha256_w_mem.v \
		#${PMU_RTL_DIR}/fpga_22/fpga_top.v \
		${PMU_RTL_DIR}/fpga_22/lb/grid_clb.v \
		${PMU_RTL_DIR}/fpga_22/lb/grid_io_bottom_bottom.v \
		${PMU_RTL_DIR}/fpga_22/lb/grid_io_top_top.v \
		${PMU_RTL_DIR}/fpga_22/lb/grid_io_left_left.v \
		${PMU_RTL_DIR}/fpga_22/lb/grid_io_right_right.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_clb_.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric.v\
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__carry_follower.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_io_mode_io_.v \
		${PMU_RTL_DIR}/fpga_22/lb/logical_tile_io_mode_physical__iopad.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/arch_encoder.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/inv_buf_passgate.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/local_encoder.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/luts.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/memories.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/mux_primitives.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/muxes.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/shift_register_banks.v \
		${PMU_RTL_DIR}/fpga_22/sub_module/wires.v \
		${PMU_RTL_DIR}/fpga_22/CustomModules/digital_io_hd.v \
		${PMU_RTL_DIR}/fpga_22/CustomModules/sky130_fd_sc_hd_wrapper.v \
		${PMU_RTL_DIR}/fpga_22/CustomModules/ql_ccff.v \
		${PMU_RTL_DIR}/fpga_22/CustomModules/ql_iso_io_logic.v \
		${PMU_RTL_DIR}/fpga_22/routing/cbx_1__0_.v \
		${PMU_RTL_DIR}/fpga_22/routing/cbx_1__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/cbx_1__2_.v \
		${PMU_RTL_DIR}/fpga_22/routing/cby_0__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/cby_1__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/cby_2__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_0__0_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_0__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_0__2_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_1__0_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_1__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_1__2_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_2__0_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_2__1_.v \
		${PMU_RTL_DIR}/fpga_22/routing/sb_2__2_.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/mux2/sky130_fd_sc_hd__mux2.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/inv/sky130_fd_sc_hd__inv.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/dfrtp/sky130_fd_sc_hd__dfrtp.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2/sky130_fd_sc_hd__or2.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_2.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf_4.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/buf/sky130_fd_sc_hd__buf.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b_4.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/or2b/sky130_fd_sc_hd__or2b.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn_4.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/ebufn/sky130_fd_sc_hd__ebufn.functional.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp_1.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp_4.v \
		${PMU_TB_DIR}/skywater-pdk-libs-sky130_fd_sc_hd/cells/sdfrtp/sky130_fd_sc_hd__sdfrtp.functional.v \




VSIM_OPTIONS     +=
VSIM_GUI_OPTIONS += -do init.do
VSIM_CMD_OPTIONS += -do "run -all; quit"

include ${PROJECT_CONFIG_DIR}/Makefile.def
