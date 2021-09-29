onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tap_top_tb/clk
add wave -noupdate /tap_top_tb/uut/tms_pad_i
add wave -noupdate /tap_top_tb/uut/tck_pad_i
add wave -noupdate /tap_top_tb/uut/trst_pad_i
add wave -noupdate /tap_top_tb/uut/tdi_pad_i
add wave -noupdate /tap_top_tb/uut/tdo_pad_o
add wave -noupdate -radix binary /tap_top_tb/uut/jtag_ir
add wave -noupdate /tap_top_tb/uut/tdo_padoe_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {261170 ps} 0}
quietly wave cursor active 1
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {535500 ps}
