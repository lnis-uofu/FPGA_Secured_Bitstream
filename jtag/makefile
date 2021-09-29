

build:
	vlog -work work tap_top_tb.v

sim: build
	vsim -lib work tap_top_tb -voptargs="+acc" -do jtag.do
