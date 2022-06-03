(* blackbox *)
module cby_0__1_ (
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif



//----- GLOBAL PORTS -----
input [0:0] pReset,
//----- GLOBAL PORTS -----
input [0:0] prog_clk,
//----- INPUT PORTS -----
input [0:19] chany_bottom_in,
//----- INPUT PORTS -----
input [0:19] chany_top_in,
//----- INPUT PORTS -----
input [0:0] ccff_head,
//----- OUTPUT PORTS -----
output [0:19] chany_bottom_out,
//----- OUTPUT PORTS -----
output [0:19] chany_top_out,
//----- OUTPUT PORTS -----
output [0:0] left_grid_right_width_0_height_0_subtile_0__pin_outpad_0_,
//----- OUTPUT PORTS -----
output [0:0] ccff_tail




);

endmodule
