# -*- Makefile -*-

build: 
	vlog -work work tap_top_tb.v tap_top.v
sim: build
	vsim -lib work tap_top_tb -voptargs="+acc"

