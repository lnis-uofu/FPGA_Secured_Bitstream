# -*- Makefile -*-

WORK_LIB = pmu_tb_lib
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}

TOP_ENTITY_NAME = functional_crc8
# TOP_ENTITY_NAME = functional_pmu
# TOP_ENTITY_NAME = functional_pmu_top
# TOP_ENTITY_NAME = functional_tap_top

VERILOG_SOURCES += \
		functional_crc8.v \ 
		functional_pmu.v \ 
		functional_pmu_top.v \
		functional_tap_top.v \


VSIM_OPTIONS     +=
VSIM_GUI_OPTIONS += -do init.do
VSIM_CMD_OPTIONS += -do "run -all; quit"

include ${PROJECT_CONFIG_DIR}/Makefile.def
