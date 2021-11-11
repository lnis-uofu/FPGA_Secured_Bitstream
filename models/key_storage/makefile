build:
	vlog -work work key_storage_tb.v
sim: build
	vsim -lib work key_storage_tb -voptargs="+acc"
