buildkey:
	vlog -work work pmu.v
	vlog -work work key_tb.v
simkey: buildkey
	vsim -lib work key_tb -voptargs="+acc"

buildsc:
	vlog -work work pmu.v
	vlog -work work sc_tb.v
simsc: buildsc
	vsim -lib work sc_tb -voptargs="+acc" -do sc.do

buildmem:
	vlog -work work pmu.v
	vlog -work work mem_tb.v
simmem: buildmem
	vsim -lib work mem_tb -voptargs="+acc" -do sc.do


