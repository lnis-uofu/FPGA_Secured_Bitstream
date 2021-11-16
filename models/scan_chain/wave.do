onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /scan_chain_tb/uut/clk
add wave -noupdate /scan_chain_tb/uut/en
add wave -noupdate /scan_chain_tb/uut/clear
add wave -noupdate /scan_chain_tb/uut/data_i
add wave -noupdate /scan_chain_tb/uut/data_o
add wave -noupdate /scan_chain_tb/uut/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {332200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
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
WaveRestoreZoom {0 ps} {457440 ps}
