onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /scan_chain_tb/uut/pmu_tck_in
add wave -noupdate /scan_chain_tb/uut/sc_data_in
add wave -noupdate /scan_chain_tb/uut/sc_en
add wave -noupdate /scan_chain_tb/uut/clear
add wave -noupdate /scan_chain_tb/uut/sc_data_out
add wave -noupdate -radix binary /scan_chain_tb/uut/data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {332200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
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
WaveRestoreZoom {68610 ps} {526050 ps}
