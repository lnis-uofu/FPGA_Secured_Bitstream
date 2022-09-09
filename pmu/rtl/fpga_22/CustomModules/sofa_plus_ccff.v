`timescale 1ns/1ps
//-----------------------------------------------------
// Function    : QuickLogic physical CCFF
//     - intorduce CFGE to gate CCFF output for
//       un-wanted toggling during configuration
//     - intorduce test data in, SI, for DFM
//
// Note: This cell is built with Standard Cells from HD library
//       It is already technology mapped and can be directly used
//       for physical design
//-----------------------------------------------------
`default_nettype wire
module sofa_plus_ccff (
    input RESET_B,
    input CFGE,
    input D,
    input SI,
    output Q,
    output CFGQN,
    output CFGQ,
    input CLK
);

    NAND2_X1 NAND2_CFGQN (
        .A(Q),
        .B(CFGE),
        .Y(CFGQN)
        );
    INV_X1 INV_CFGQN (
        .A(CFGQN),
        .Y(CFGQ)
        );
    SDFFRQ SDFRTP (
        .SE(1'b0),
        .D(D),
        .SI(D),
        .RST(RESET_B),
        .CK(CLK),
        .Q(Q)
        );
endmodule
