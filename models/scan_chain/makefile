build:
	vlog -work work scan_chain_tb.v
sim: build
	vsim -lib work scan_chain_tb -voptargs="+acc" -do wave.do

