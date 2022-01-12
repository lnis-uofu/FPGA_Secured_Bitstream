onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sc_128_bit_tb/uut/clk
add wave -noupdate /sc_128_bit_tb/uut/data_i
add wave -noupdate /sc_128_bit_tb/uut/en
add wave -noupdate /sc_128_bit_tb/uut/pwr_up_en
add wave -noupdate /sc_128_bit_tb/uut/tdo
add wave -noupdate /sc_128_bit_tb/uut/state
add wave -noupdate /sc_128_bit_tb/uut/next_state
add wave -noupdate /sc_128_bit_tb/uut/counter
add wave -noupdate /sc_128_bit_tb/uut/sipo_instruction
add wave -noupdate /sc_128_bit_tb/uut/header
add wave -noupdate /sc_128_bit_tb/uut/key_write
add wave -noupdate /sc_128_bit_tb/uut/key_data_o
add wave -noupdate /sc_128_bit_tb/uut/sipo_data_i
add wave -noupdate /sc_128_bit_tb/uut/sipo_send
add wave -noupdate /sc_128_bit_tb/uut/sipo_en
add wave -noupdate /sc_128_bit_tb/uut/sipo_rst
add wave -noupdate /sc_128_bit_tb/uut/sipo_mem_data_i
add wave -noupdate /sc_128_bit_tb/uut/sipo_key_o
add wave -noupdate /sc_128_bit_tb/uut/sipo_aes_o
add wave -noupdate /sc_128_bit_tb/uut/sipo_mem_o
add wave -noupdate /sc_128_bit_tb/uut/aes_data_o
add wave -noupdate /sc_128_bit_tb/uut/piso_en
add wave -noupdate /sc_128_bit_tb/uut/piso_load
add wave -noupdate /sc_128_bit_tb/uut/piso_data_o
add wave -noupdate /sc_128_bit_tb/uut/sc_en
add wave -noupdate /sc_128_bit_tb/uut/mem_address
add wave -noupdate /sc_128_bit_tb/uut/mem_w
add wave -noupdate /sc_128_bit_tb/uut/mem_addr_i
add wave -noupdate /sc_128_bit_tb/uut/mem_data_i
add wave -noupdate /sc_128_bit_tb/uut/mem_data_o
add wave -noupdate /sc_128_bit_tb/uut/bootloader_rw
add wave -noupdate /sc_128_bit_tb/uut/bootloader_clr
add wave -noupdate /sc_128_bit_tb/uut/bootloader_len_i
add wave -noupdate /sc_128_bit_tb/uut/bootloader_addr_i
add wave -noupdate /sc_128_bit_tb/uut/bootloader_len_o
add wave -noupdate /sc_128_bit_tb/uut/bootloader_addr_o
add wave -noupdate /sc_128_bit_tb/uut/aes_mem_data_counter
add wave -noupdate /sc_128_bit_tb/uut/temp_addr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4145 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {6972 ns}
run 100 ms
