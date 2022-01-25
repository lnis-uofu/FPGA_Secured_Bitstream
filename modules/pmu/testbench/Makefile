# -*- Makefile -*-

build:
	vlog -work work pmu_tb.v ../rtl/pmu.v
sim: build
	vsim -lib work pmu_tb -voptargs="+acc"
