(* blackbox *)
module cbx_1__0_ (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

//----- GLOBAL PORTS -----
input [0:0] pReset,
//----- GLOBAL PORTS -----
input [0:0] prog_clk,
//----- INPUT PORTS -----
input [0:19] chanx_left_in,
//----- INPUT PORTS -----
input [0:19] chanx_right_in,
//----- INPUT PORTS -----
input [0:0] ccff_head,
//----- OUTPUT PORTS -----
output [0:19] chanx_left_out,
//----- OUTPUT PORTS -----
output [0:19] chanx_right_out,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_0__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_1__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_2__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_3__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_4__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_5__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_6__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_7__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] bottom_grid_top_width_0_height_0_subtile_8__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] ccff_tail
);

endmodule
