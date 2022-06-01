# -*- Makefile -*-

WORK_LIB = pmu_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}

VERILOG_SOURCES += \
	config_chain.v \
	crc8.v \
	pmu.v \
	pmu_top.v \
	tap_top.v \
	aes/aes_decipher_block.v \
	aes/aes_inv_sbox.v \
	aes/round_key.v \
	aes/aes_key_mem.v \
	aes/aes_sbox.v \
	aes/aes_core.v \
	key_storage.v \
	mem.v 

include ${PROJECT_CONFIG_DIR}/Makefile.def
