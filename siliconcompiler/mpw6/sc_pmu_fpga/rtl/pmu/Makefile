# -*- Makefile -*-

WORK_LIB = pmu_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}

VERILOG_SOURCES += \
	config_chain.v \
	crc8.v \
	pmu.v \
	pmu_core.v \
	tap_top.v \
	aes/aes_decipher_block.v \
	aes/aes_inv_sbox.v \
	aes/round_key.v \
	aes/aes_key_mem.v \
	aes/aes_sbox.v \
	aes/aes_core.v \
	key_storage.v \
	mem.v \
	sha/sha256_core.v \
	sha/sha256_k_constants.v \
	sha/sha256_w_mem.v \
	../fpga22/fpga_top.v \
	../fpga22/CustomModules/digital_io_hd.v \
	../fpga22/CustomModules/sky130_fd_sc_hd_wrapper.v \
	../fpga22/CustomModules/ql_ccff.v \
	../fpga22/CustomModules/ql_iso_io_logic.v \
	../fpga22/lb/grid_clb.v \
	../fpga22/lb/grid_io_bottom_bottom.v \
	../fpga22/lb/grid_io_left_left.v \
	../fpga22/lb/grid_io_right_right.v \
	../fpga22/lb/grid_io_top_top.v \
	../fpga22/lb/logical_tile_clb_mode_clb_.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__carry_follower.v \
	../fpga22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4.v \
	../fpga22/lb/logical_tile_io_mode_io_.v \
	../fpga22/lb/logical_tile_io_mode_physical__iopad.v \
	../fpga22/sub_module/arch_encoder.v \
	../fpga22/sub_module/inv_buf_passgate.v \
	../fpga22/sub_module/local_encoder.v \
	../fpga22/sub_module/luts.v \
	../fpga22/sub_module/memories.v \
	../fpga22/sub_module/mux_primitives.v \
	../fpga22/sub_module/muxes.v \
	../fpga22/sub_module/shift_register_banks.v \
	../fpga22/sub_module/wires.v \
	../fpga22/routing/cbx_1__0_.v \
	../fpga22/routing/cbx_1__1_.v \
	../fpga22/routing/cbx_1__2_.v \
	../fpga22/routing/cby_0__1_.v \
	../fpga22/routing/cby_1__1_.v \
	../fpga22/routing/cby_2__1_.v \
	../fpga22/routing/sb_0__0_.v \
	../fpga22/routing/sb_0__1_.v \
	../fpga22/routing/sb_0__2_.v \
	../fpga22/routing/sb_1__0_.v \
	../fpga22/routing/sb_1__1_.v \
	../fpga22/routing/sb_1__2_.v \
	../fpga22/routing/sb_2__0_.v \
	../fpga22/routing/sb_2__1_.v \
	../fpga22/routing/sb_2__2_.v

include ${PROJECT_CONFIG_DIR}/Makefile.def
