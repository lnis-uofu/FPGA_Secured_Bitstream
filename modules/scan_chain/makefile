build:
	vlog -work work scan_chain_tb.v
	echo 
	vlog -work work scan_chain.v
sim: build
	vsim -lib work scan_chain_tb -voptargs="+acc" -do wave.do

