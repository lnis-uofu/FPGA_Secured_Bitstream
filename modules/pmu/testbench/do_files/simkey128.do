onerror {resume}
add wave -noupdate -divider PMU
add wave -noupdate /key_tb_128/uut/clk
add wave -noupdate /key_tb_128/uut/data_i
add wave -noupdate /key_tb_128/uut/en
add wave -noupdate /key_tb_128/uut/state
add wave -noupdate /key_tb_128/uut/next_state
add wave -noupdate /key_tb_128/uut/counter
add wave -noupdate /key_tb_128/uut/sipo_instruction
add wave -noupdate /key_tb_128/uut/header
add wave -noupdate /key_tb_128/uut/key_write
add wave -noupdate /key_tb_128/uut/key_data_o
add wave -noupdate /key_tb_128/uut/sipo_data_i
add wave -noupdate /key_tb_128/uut/sipo_send
add wave -noupdate /key_tb_128/uut/sipo_en
add wave -noupdate /key_tb_128/uut/sipo_rst
add wave -noupdate /key_tb_128/uut/sipo_mem_data_i
add wave -noupdate /key_tb_128/uut/sipo_key_o
add wave -noupdate -divider {KEY STORAGE}
add wave -noupdate /key_tb_128/uut/key_storage/key_write
add wave -noupdate /key_tb_128/uut/key_storage/key_data_in
add wave -noupdate /key_tb_128/uut/key_storage/key_data_out
add wave -noupdate /key_tb_128/uut/key_storage/key
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {218 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 51
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {176 ns} {3507 ns}
run 100 ms
