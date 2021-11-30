build:
	vlog -work work bootloader.v
	vlog -work work bootloader_tb.v

sim: build
	vsim -lib work bootloader_tb -voptargs="+acc" -do wave.do
