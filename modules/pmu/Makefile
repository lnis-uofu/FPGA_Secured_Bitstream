

build:
	vlog -work work pmu_top.v pmu_tb.v
sim: build
	vsim -c -lib work pmu_tb -voptargs="+acc" -do wave.do
