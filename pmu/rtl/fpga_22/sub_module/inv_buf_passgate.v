//-------------------------------------------
//	FPGA Synthesizable Verilog Netlist
//	Description: Essential gates
//	Author: Xifan TANG
//	Organization: University of Utah
//	Date: Mon Aug  8 10:08:34 2022
//-------------------------------------------
//----- Time scale -----
`timescale 1ns / 1ps

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for const0 -----
module const0(const0);
//----- OUTPUT PORTS -----
output [0:0] const0;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

	assign const0[0] = 1'b0;
endmodule
// ----- END Verilog module for const0 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type --
`default_nettype wire

// ----- Verilog module for const1 -----
module const1(const1);
//----- OUTPUT PORTS -----
output [0:0] const1;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

	assign const1[0] = 1'b1;
endmodule
// ----- END Verilog module for const1 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__inv_1 -----
module sky130_fd_sc_hd__inv_1(A,
                              Y);
//----- INPUT PORTS -----
input [0:0] A;
//----- OUTPUT PORTS -----
output [0:0] Y;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Verilog codes of a regular inverter -----
	assign Y = (A === 1'bz)? $random : ~A;

`ifdef ENABLE_TIMING
// ------ BEGIN Pin-to-pin Timing constraints -----
	specify
		(A => Y) = (0.01, 0.01);
	endspecify
// ------ END Pin-to-pin Timing constraints -----
`endif
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__inv_1 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__buf_2 -----
module sky130_fd_sc_hd__buf_2(A,
                              X);
//----- INPUT PORTS -----
input [0:0] A;
//----- OUTPUT PORTS -----
output [0:0] X;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Verilog codes of a regular inverter -----
	assign X = (A === 1'bz)? $random : A;

`ifdef ENABLE_TIMING
// ------ BEGIN Pin-to-pin Timing constraints -----
	specify
		(A => X) = (0.01, 0.01);
	endspecify
// ------ END Pin-to-pin Timing constraints -----
`endif
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__buf_2 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__buf_4 -----
module sky130_fd_sc_hd__buf_4(A,
                              X);
//----- INPUT PORTS -----
input [0:0] A;
//----- OUTPUT PORTS -----
output [0:0] X;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Verilog codes of a regular inverter -----
	assign X = (A === 1'bz)? $random : A;

`ifdef ENABLE_TIMING
// ------ BEGIN Pin-to-pin Timing constraints -----
	specify
		(A => X) = (0.01, 0.01);
	endspecify
// ------ END Pin-to-pin Timing constraints -----
`endif
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__buf_4 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__inv_2 -----
module sky130_fd_sc_hd__inv_2(A,
                              Y);
//----- INPUT PORTS -----
input [0:0] A;
//----- OUTPUT PORTS -----
output [0:0] Y;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Verilog codes of a regular inverter -----
	assign Y = (A === 1'bz)? $random : ~A;

`ifdef ENABLE_TIMING
// ------ BEGIN Pin-to-pin Timing constraints -----
	specify
		(A => Y) = (0.01, 0.01);
	endspecify
// ------ END Pin-to-pin Timing constraints -----
`endif
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__inv_2 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__or2_1 -----
module sky130_fd_sc_hd__or2_1(A,
                              B,
                              X);
//----- INPUT PORTS -----
input [0:0] A;
//----- INPUT PORTS -----
input [0:0] B;
//----- OUTPUT PORTS -----
output [0:0] X;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

// ----- Verilog codes of a 2-input 1-output AND gate -----
	assign X[0] = A[0] | B[0];

`ifdef ENABLE_TIMING
// ------ BEGIN Pin-to-pin Timing constraints -----
	specify
		(A => X) = (0.01, 0.01);
		(B => X) = (0.005, 0.005);
	endspecify
// ------ END Pin-to-pin Timing constraints -----
`endif
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__or2_1 -----

//----- Default net type -----
`default_nettype wire

//----- Default net type -----
`default_nettype wire

// ----- Verilog module for sky130_fd_sc_hd__mux2_1 -----
module sky130_fd_sc_hd__mux2_1(A1,
                               A0,
                               S,
                               X);
//----- INPUT PORTS -----
input [0:0] A1;
//----- INPUT PORTS -----
input [0:0] A0;
//----- INPUT PORTS -----
input [0:0] S;
//----- OUTPUT PORTS -----
output [0:0] X;

//----- BEGIN wire-connection ports -----
//----- END wire-connection ports -----


//----- BEGIN Registered ports -----
//----- END Registered ports -----

	assign X[0] = S[0] ? A1[0] : A0[0];
endmodule
// ----- END Verilog module for sky130_fd_sc_hd__mux2_1 -----

//----- Default net type -----
`default_nettype wire

