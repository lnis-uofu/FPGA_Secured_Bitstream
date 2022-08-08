#  -*- Makefile -*-
 
build:
	vlog -work work functional_sha.v sha256.v sha256_core.v
sim: build
	vsim -c -lib work functional_sha -voptargs="+acc" -do wave.do

