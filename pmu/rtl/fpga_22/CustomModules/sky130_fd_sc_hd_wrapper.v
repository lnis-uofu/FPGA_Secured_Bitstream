module MUX2_X1(A0, A1, S, Y);
    input A0;
    input A1;
    input S;
    output Y;
    sky130_fd_sc_hd__mux2_1 MUX2_X1 ( .A0(A0), .A1(A1), .S(S), .X(Y));
endmodule

module AND2_X1(A, B, Y);
    input A;
    input B;
    output Y;
    sky130_fd_sc_hd__and2_1 AND (.A(A), .B(B), .X(Y));
endmodule

module OR2_X1(A, B, Y);
    input A;
    input B;
    output Y;
    sky130_fd_sc_hd__or2_1 OR (.A(A), .B(B), .X(Y));
endmodule

module BUF_X1(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__buf_1 BUF (.A(A), .X(Y));
endmodule

module BUF_X2(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__buf_2 BUF (.A(A), .X(Y));
endmodule

module BUF_X4(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__buf_4 BUF (.A(A), .X(Y));
endmodule

module BUF_X8(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__buf_8 BUF (.A(A), .X(Y));
endmodule

module BUFCLK_X1(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__clkbuf_1 BUF (.A(A), .X(Y));
endmodule

module BUFCLK_X2(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__clkbuf_2 BUF (.A(A), .X(Y));
endmodule

module BUFCLK_X4(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__clkbuf_4 BUF (.A(A), .X(Y));
endmodule

module BUFCLK_X8(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__clkbuf_8 BUF (.A(A), .X(Y));
endmodule

module DFFRQ(RST, CK, D, Q);
    input RST, CK, D;
    output Q;
    sky130_fd_sc_hd__dfrtp_1 sky130_fd_sc_hd__dfrtp_1_0_ (.RESET_B(RST),
		.CLK(CK), .D(D), .Q(Q));
endmodule

module SDFFRQ(SE, D, SI, RST, CK, Q);
    input SE, D, SI, RST, CK;
    output Q;
    sky130_fd_sc_hd__sdfrtp_1 sky130_fd_sc_hd__sdfrtp_1_0 (.Q(Q), .CLK(CK),
            .SCE(SE), .SCD(SI), .RESET_B(RST), .D(D));
endmodule

module SDFBBP (Q, Q_N, D, SCD, SCE, CLK, SET_B, RESET_B);
    input  D, SCD, SCE, CLK, SET_B, RESET_B;
        output Q, Q_N;
    sky130_fd_sc_hd__sdfbbp_1 sky130_fd_sc_hd__sdfbbp_1_0 (.Q(Q), .Q_N(Q_N), .D(D), .SCD(SCD), .SCE(SCE), .CLK(CLK), .SET_B(SET_B), .RESET_B(RESET_B));
endmodule

module CARRY_MUX2(A0, A1, S, Y);
    input A0, A1, S;
    output Y;
    sky130_fd_sc_hd__mux2_1 MUX2_X0 ( .A0(A0), .A1(A1), .S(S), .X(Y));
endmodule

module NAND2_X1(A, B, Y);
    input A, B;
    output Y;
    sky130_fd_sc_hd__nand2_1 sky130_fd_sc_hd__nand2_1_0 (.A(A), .B(B), .Y(Y));
endmodule

module INV_X1(A, Y);
    input A;
    output Y;
    sky130_fd_sc_hd__inv_1 sky130_fd_sc_hd__inv_1_0 (.A(A), .Y(Y));
endmodule

module XNOR2_X1(A, B, Y);
    input A, B;
    output Y;
    sky130_fd_sc_hd__xnor2_1 sky130_fd_sc_hd__xnor2_1_0 (.A(A), .B(B), .Y(Y));
endmodule
