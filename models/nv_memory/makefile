build:
	vlog -work work nv_memory_tb.v
sim: build
	vsim -lib work nv_memory_tb -voptargs="+acc"
