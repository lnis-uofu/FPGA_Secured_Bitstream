build:
	vlog -work work sipo.v
	vlog -work work sipo_tb.v

sim: build
	vsim -lib work sipo_tb -voptargs="+acc" -do wave.do
