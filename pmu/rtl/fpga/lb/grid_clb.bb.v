

(* blackbox *)
module grid_clb (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif







//----- GLOBAL PORTS -----
input [0:0] pReset,
//----- GLOBAL PORTS -----
input [0:0] prog_clk,
//----- GLOBAL PORTS -----
input [0:0] Test_en,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I0_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I0_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I0i_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I0i_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I1_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I1_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I1i_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I1i_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I2_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I2_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I2i_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I2i_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I3_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I3_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I3i_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_I3i_1_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_reg_in_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_sc_in_0_,
//----- INPUT PORTS -----
input [0:0] top_width_0_height_0_subtile_0__pin_cin_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I4_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I4_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I4i_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I4i_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I5_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I5_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I5i_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I5i_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I6_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I6_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I6i_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I6i_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I7_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I7_1_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I7i_0_,
//----- INPUT PORTS -----
input [0:0] right_width_0_height_0_subtile_0__pin_I7i_1_,
//----- INPUT PORTS -----
input [0:0] left_width_0_height_0_subtile_0__pin_reset_0_,
//----- INPUT PORTS -----
input [0:0] left_width_0_height_0_subtile_0__pin_clk_0_,
//----- INPUT PORTS -----
input [0:0] ccff_head,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_0_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_0_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_1_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_1_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_2_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_2_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_3_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_3_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_4_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_4_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_5_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_5_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_6_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_6_lower,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_7_upper,
//----- OUTPUT PORTS -----
output [0:0] top_width_0_height_0_subtile_0__pin_O_7_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_8_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_8_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_9_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_9_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_10_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_10_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_11_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_11_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_12_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_12_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_13_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_13_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_14_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_14_lower,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_15_upper,
//----- OUTPUT PORTS -----
output [0:0] right_width_0_height_0_subtile_0__pin_O_15_lower,
//----- OUTPUT PORTS -----
output [0:0] bottom_width_0_height_0_subtile_0__pin_reg_out_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_width_0_height_0_subtile_0__pin_sc_out_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_width_0_height_0_subtile_0__pin_cout_0_,
//----- OUTPUT PORTS -----
output [0:0] ccff_tail
);

endmodule
