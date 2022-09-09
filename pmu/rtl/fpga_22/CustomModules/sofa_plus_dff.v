`timescale 1ns/1ps

//-----------------------------------------------------
// Function    : Flipflop with set and reset signal polarity selection
//               The flip-flop can operate in 4 modes:
//               - MODE_SEL=00, active-high reset
//               - MODE_SEL=10, active-low reset
//               - MODE_SEL=01, active-high set
//               - MODE_SEL=11, active-low set
//-----------------------------------------------------
// TODO : Make it compatible with waves architecture
//
`default_nettype wire
// 
module sofa_plus_dff (
  input D,
  input DI,
  input C,
  input Test_en,
  input R,
  input [0:1] MODE_SEL,
//   input PROG_CLK, //remove
//   input SCAN_MODE, //remove
  output Q
);

  wire reset_inter0;
  wire mode_sel_inv;
  wire Q_N;

  XNOR2_X1 XNOR2_RESET (
          .A(MODE_SEL[0]),	// MODE_SEL[0]=1, reset_inter0 = R
          .B(R),		// MODE_SEL[0]=0, reset_inter0 = ~R
          .Y(reset_inter0)
      );
  OR2_X1 OR2_RESET (
          .A(MODE_SEL[1]),	        // MODE_SEL[1]=1, RB = 1
          .B(reset_inter0),		// MODE_SEL[1]=0, RB = reset_inter0
          .Y(RB)
      );
  INV_X1 INV_MODE_SEL (
          .A(MODE_SEL[1]),
          .Y(mode_sel_inv)
      );
  OR2_X1 OR2_SET (
          .A(mode_sel_inv),	        // MODE_SEL[1]=1, SB = set_inter0
          .B(reset_inter0),		    // MODE_SEL[1]=0, SB = 1
          .Y(SB)
      );

  SDFBBP QDFZRSB (
    .Q(Q),
    .Q_N(Q_N),
    .D(D),
    .SCD(DI),
    .SCE(Test_en),
    .CLK(C),
    .SET_B(SB),
    .RESET_B(RB)
    );
endmodule
