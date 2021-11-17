build:
	vlog -work work key_storage_tb.v
	vlog -work work key_storage.v
sim: build
	vsim -lib work key_storage_tb -voptargs="+acc" -do wave.do
