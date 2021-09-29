onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {JTAG Inputs/Outputs}
add wave -noupdate /tap_top_tb/uut/tck_pad_i
add wave -noupdate /tap_top_tb/uut/tms_pad_i
add wave -noupdate /tap_top_tb/uut/tdi_pad_i
add wave -noupdate /tap_top_tb/uut/tdo_pad_o
add wave -noupdate /tap_top_tb/uut/trst_pad_i
add wave -noupdate -divider {Instruction Register}
add wave -noupdate -radix binary /tap_top_tb/uut/jtag_ir
add wave -noupdate -divider {Tap States}
add wave -noupdate /tap_top_tb/uut/test_logic_reset
add wave -noupdate /tap_top_tb/uut/run_test_idle
add wave -noupdate /tap_top_tb/uut/select_dr_scan
add wave -noupdate /tap_top_tb/uut/select_ir_scan
add wave -noupdate /tap_top_tb/uut/capture_ir
add wave -noupdate /tap_top_tb/uut/shift_ir
add wave -noupdate /tap_top_tb/uut/exit1_ir
add wave -noupdate /tap_top_tb/uut/update_ir
add wave -noupdate -divider Instructions
add wave -noupdate /tap_top_tb/uut/extest_select
add wave -noupdate /tap_top_tb/uut/sample_preload_select
add wave -noupdate /tap_top_tb/uut/idcode_select
add wave -noupdate /tap_top_tb/uut/debug_select
add wave -noupdate /tap_top_tb/uut/mbist_select
add wave -noupdate /tap_top_tb/uut/bypass_select
add wave -noupdate -divider {Instruction outputs}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {271000 ps} 0}
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
WaveRestoreZoom {106540 ps} {411040 ps}

run 5us

