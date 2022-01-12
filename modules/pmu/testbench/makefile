simkey128:
	#compile pmu.v
	vlog -work work ../rtl/pmu.v
	#compile testbench
	vlog -work work key_tb_128.v
	#generate a random 128-bit key
	python3 ../../../python/key_generation/key_generator.py 128
	#add header to key and put into encoded_key_128.txt
	python3 ../../../python/header_generation/header_generator.py "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/key_128.txt" 128 "0010" "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_key_128.txt"
	vsim -lib work key_tb_128 -voptargs="+acc" -do do_files/simkey128.do


#-----------IN PROGRESS-------------------------------
simkey256:
	#compile pmu.v
	vlog -work work ../rtl/pmu.v
	#compile testbench
	vlog -work work key_tb_256.v
	#generate a random 256-bit key
	python3 ../../../python/key_generation/key_generator.py 256
	#add header to key and put into encoded_key_128.txt
	python3 ../../../python/header_generation/header_generator.py "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/key_256.txt" 256 "0010" "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_key_256.txt"
	vsim -lib work key_tb_256 -voptargs="+acc" #-do /do_files/simkey256.do
#-----------------------------------------------------

simPCtoSC128:
	#compile pmu.v
	vlog -work work ../rtl/pmu.v
	#compile testbench
	vlog -work work sc_128_bit_tb.v
	#generate a random 128-bit key
	python3 ../../../python/key_generation/key_generator.py 128
	#generate a "hex" 128-bit bitstream
	python3 ../../../python/bitstream_generation/bitstream_generator.py 128 "hex"
	#encrypt bitstream
	python3 ../../../python/python_aes/script_128.py
	#generate header for the inv_key
	python3 ../../../python/header_generation/header_generator.py "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/inv_key.txt" 128 "0010" "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_key_128.txt"
	#generate header for encrypted bitstream
	python3 ../../../python/header_generation/header_generator.py "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encrypted_bitstream.txt" 128 "1010" "/home/u1375766/SecuredBitstream/modules/pmu/testbench/textfiles/encoded_bitstream.txt"
	vsim -lib work sc_128_bit_tb -voptargs="+acc" 

simPCtoMEM128:

simMEMtoSC128:

