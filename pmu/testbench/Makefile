# -*- Makefile -*-

WORK_LIB = pmu_tb_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}


#TOP_ENTITY_NAME = functional_crc8
TOP_ENTITY_NAME = functional_pmu
# TOP_ENTITY_NAME = functional_pmu_top
#TOP_ENTITY_NAME = functional_tap_top

VERILOG_SOURCES += \
		${PMU_TB_DIR}/functional_crc8.v \
		${PMU_RTL_DIR}/crc8.v \
		${PMU_TB_DIR}/functional_pmu.v \
		${PMU_RTL_DIR}/pmu.v \
		${PMU_TB_DIR}/functional_pmu_top.v \
		${PMU_RTL_DIR}/pmu_top.v \
		${PMU_TB_DIR}/functional_tap_top.v \
		${PMU_RTL_DIR}/tap_top.v \
		${PMU_RTL_DIR}/aes/aes_decipher_block.v \
		${PMU_RTL_DIR}/aes/aes_inv_sbox.v \
		${PMU_RTL_DIR}/aes/round_key.v \
		${PMU_RTL_DIR}/aes/aes_key_mem.v \
		${PMU_RTL_DIR}/aes/aes_sbox.v \
		${PMU_RTL_DIR}/aes/aes_core.v \
		${PMU_RTL_DIR}/key_storage.v \
		${PMU_RTL_DIR}/mem.v


VSIM_OPTIONS     +=
VSIM_GUI_OPTIONS += -do init.do
VSIM_CMD_OPTIONS += -do "run -all; quit"

include ${PROJECT_CONFIG_DIR}/Makefile.def
