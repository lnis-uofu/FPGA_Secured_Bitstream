

build:
	vlog -work work address_generator.v
	vlog -work work address_generator_tb.v

sim: build
	vsim -lib work address_generator_tb -voptargs="+acc"
