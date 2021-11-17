
build:
	vlog -work work piso.v
	vlog -work work piso_tb.v
sim: build
	vsim -lib work piso_tb -voptargs="+acc" -do wave.do
