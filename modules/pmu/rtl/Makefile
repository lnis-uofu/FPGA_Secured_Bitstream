# -*- Makefile -*-


WORK_LIB = work
WORK_DIR = ${PROJECT_BUILD_DIR}/${WORK_LIB}

VERILOG_SOURCES += \
				   address_generator.v \
				   bootloader.v \ 
				   key_storage.v \ 
				   piso.v \ 
				   sipo.v \ 
				   ${PROJECT_MODULES_DIR}/fpga_cores/scan_chain.v \ 
				   ${PROJECT_MODULES_DIR}/nv_memory/nv_memory.v \ 
				   pmu.v \ 
include ${PROJECT_CONGIG_DIR}/Makefile.def

