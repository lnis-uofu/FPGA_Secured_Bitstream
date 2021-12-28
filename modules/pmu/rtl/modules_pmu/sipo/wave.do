onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sipo_tb/uut/clk
add wave -noupdate /sipo_tb/uut/rst
add wave -noupdate /sipo_tb/uut/en
add wave -noupdate /sipo_tb/uut/send
add wave -noupdate /sipo_tb/uut/instruction
add wave -noupdate /sipo_tb/uut/data_i
add wave -noupdate /sipo_tb/uut/mem_data_i
add wave -noupdate /sipo_tb/uut/aes_data_o
add wave -noupdate /sipo_tb/uut/key_data_o
add wave -noupdate /sipo_tb/uut/mem_data_o
add wave -noupdate /sipo_tb/uut/data
add wave -noupdate /sipo_tb/uut/temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {1012 ns}
