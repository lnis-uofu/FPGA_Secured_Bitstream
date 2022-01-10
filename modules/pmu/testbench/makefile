simkey128:
	#compile pmu.v
	vlog -work work ../rtl/pmu.v
	#compile testbench
	vlog -work work key_tb_128.v
	#generate a random 128-bit key
	python3 ../../../python/key_generation/key_generator.py 128
	#add header to key and put into encoded_key_128.txt
	python3 ../../../python/header_generation/header_generator.py "key_128.txt" 128 "0010" "encoded_key_128.txt"
	vsim -lib work key_tb_128 -voptargs="+acc"

simkey256:
	#compile pmu.v
	vlog -work work ../rtl/pmu.v
	#compile testbench
	vlog -work work key_tb_256.v
	#generate a random 128-bit key
	python3 ../../../python/key_generation/key_generator.py 256
	#add header to key and put into encoded_key_128.txt
	python3 ../../../python/header_generation/header_generator.py "key_256.txt" 256 "0010" "encoded_key_256.txt"
	vsim -lib work key_tb_256 -voptargs="+acc"

