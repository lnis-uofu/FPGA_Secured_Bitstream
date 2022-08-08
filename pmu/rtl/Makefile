# -*- Makefile -*-

WORK_LIB = pmu_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}

VERILOG_SOURCES += \
	aes/aes_core.v \
	aes/aes_decipher_block.v \
	aes/aes_inv_sbox.v \
	aes/aes_key_mem.v \
	aes/aes_sbox.v \
	aes/round_key.v \
	fpga_22/fpga_top.v \
	fpga_22/CustomModules/digital_io_hd.v \
	fpga_22/CustomModules/sky130_fd_sc_hd_wrapper.v \
	fpga_22/CustomModules/ql_ccff.v \
	fpga_22/CustomModules/ql_iso_io_logic.v \
	fpga_22/lb/grid_clb.v \
	fpga_22/lb/grid_io_bottom_bottom.v \
	fpga_22/lb/grid_io_left_left.v \
	fpga_22/lb/grid_io_right_right.v \
	fpga_22/lb/grid_io_top_top.v \
	fpga_22/lb/logical_tile_clb_mode_clb_.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__ff.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__carry_follower.v \
	fpga_22/lb/logical_tile_clb_mode_default__fle_mode_physical__fabric_mode_default__frac_logic_mode_default__frac_lut4.v \
	fpga_22/lb/logical_tile_io_mode_io_.v \
	fpga_22/lb/logical_tile_io_mode_physical__iopad.v \
	fpga_22/sub_module/arch_encoder.v \
	fpga_22/sub_module/inv_buf_passgate.v \
	fpga_22/sub_module/local_encoder.v \
	fpga_22/sub_module/luts.v \
	fpga_22/sub_module/memories.v \
	fpga_22/sub_module/mux_primitives.v \
	fpga_22/sub_module/muxes.v \
	fpga_22/sub_module/shift_register_banks.v \
	fpga_22/sub_module/wires.v \
	fpga_22/routing/cbx_1__0_.v \
	fpga_22/routing/cbx_1__1_.v \
	fpga_22/routing/cbx_1__2_.v \
	fpga_22/routing/cby_0__1_.v \
	fpga_22/routing/cby_1__1_.v \
	fpga_22/routing/cby_2__1_.v \
	fpga_22/routing/sb_0__0_.v \
	fpga_22/routing/sb_0__1_.v \
	fpga_22/routing/sb_0__2_.v \
	fpga_22/routing/sb_1__0_.v \
	fpga_22/routing/sb_1__1_.v \
	fpga_22/routing/sb_1__2_.v \
	fpga_22/routing/sb_2__0_.v \
	fpga_22/routing/sb_2__1_.v \
	fpga_22/routing/sb_2__2_.v \
	pmu/crc8.v \
	pmu/key_storage.v \
	pmu/mem.v \
	pmu/pmu.v \
	pmu/pmu_core.v \
	pmu/pmu_fpga_top.v \
	pmu/tap_top.v \
	sha/sha256.v \
	sha/sha256_core.v \
	sha/sha256_k_constants.v \
	sha/sha256_w_mem.v \



include ${PROJECT_CONFIG_DIR}/Makefile.def
