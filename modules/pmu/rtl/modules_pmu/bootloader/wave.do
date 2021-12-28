onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bootloader_tb/uut/clk
add wave -noupdate /bootloader_tb/uut/addr_i
add wave -noupdate /bootloader_tb/uut/len_i
add wave -noupdate /bootloader_tb/uut/rw
add wave -noupdate /bootloader_tb/uut/clr
add wave -noupdate /bootloader_tb/uut/addr_o
add wave -noupdate /bootloader_tb/uut/len_o
add wave -noupdate /bootloader_tb/uut/starting_address
add wave -noupdate /bootloader_tb/uut/bitstream_len
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
WaveRestoreZoom {0 ns} {1 us}
