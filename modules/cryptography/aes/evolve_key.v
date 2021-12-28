// Copyright 2007 Altera Corporation. All rights reserved.  
// Altera products are protected under numerous U.S. and foreign patents, 
// maskwork rights, copyrights and other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design 
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference 
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an 
// accommodation and therefore all warranties, representations or guarantees of 
// any kind (whether express, implied or statutory) including, without 
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or 
// require that this reference design file be used in combination with any 
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////

// baeckler - 03-08-2006

//////////////////////////////////////////////
// Key word rotation
//////////////////////////////////////////////
module rot_word (clk,clr,in,out);
input clk,clr;
input [31:0] in;
output [31:0] out;
wire [31:0] out;
assign out = {in[23:0],in[31:24]};
endmodule

//////////////////////////////////////////////
// Key sub word - borrowing sbox from sub_bytes
//////////////////////////////////////////////
module sub_word (clk,clr,in,out);
input clk,clr;
input [31:0] in;
output [31:0] out;
wire [31:0] out;
sbox s0 (.clk(clk),.clr(clr),.in(in[7:0]),.out(out[7:0]));
sbox s1 (.clk(clk),.clr(clr),.in(in[15:8]),.out(out[15:8]));
sbox s2 (.clk(clk),.clr(clr),.in(in[23:16]),.out(out[23:16]));
sbox s3 (.clk(clk),.clr(clr),.in(in[31:24]),.out(out[31:24]));
endmodule

//////////////////////////////////////////////
// Hard XOR - 6 input 32 wide
//   to prevent any creative dupe extraction
//   that would hurt the depth.
//////////////////////////////////////////////
module xor6_32 (clk,clr,a,b,c,d,e,f,o);
input clk,clr;
input [31:0] a,b,c,d,e,f;
output [31:0] o;
wire [31:0] o;

	assign o = a ^ b ^ c ^ d ^ e ^ f;
//genvar i;
//generate
//    for (i=0; i<32; i=i+1)
//	begin:
//		stratixii_lcell_comb s (.clk(clk),.clr(clr),.dataa (a[i]),.datab (b[i]),.datac (c[i]),
//			.datad (d[i]),.datae (e[i]),.dataf (f[i]),.datag(1'b1),
//			.cin(1'b1),.sharein(1'b0),.sumout(),.cout(),.shareout(),
//			.combout(o[i]));
//		defparam s .lut_mask = 64'h6996966996696996;
//		defparam s .shared_arith = "off";
//		defparam s .extended_lut = "off";
//	end
//endgenerate
endmodule

//////////////////////////////////////////////
// Key evolution step for 128 bit key
//////////////////////////////////////////////
module evolve_key_128 (clk,clr,key_in,rconst,key_out);

input clk,clr;
input [127:0] key_in;
input [7:0] rconst;		// the low order 24 bits are all 0						

output [127:0] key_out;
wire [127:0] key_out;

wire [31:0] rot_key;
wire [31:0] subrot_key;

rot_word rw (.clk(clk),.clr(clr),.in (key_in[31:0]), .out(rot_key));
sub_word sw (.clk(clk),.clr(clr), .in (rot_key), .out(subrot_key));

// make it clear that the desired implementation is 
// a flat XOR LUT bank, not a string of 2-XORs with
// taps.  Better speed.  Very little area cost.
xor6_32 q (.clk(clk),.clr(clr),.o(key_out[127:96]),.a({rconst,24'b0}),.b(subrot_key),.c(key_in[127:96]),
				.d(32'b0),.e(32'b0),.f(32'b0));
xor6_32 r (.clk(clk),.clr(clr),.o(key_out[95:64]),.a({rconst,24'b0}),.b(subrot_key),.c(key_in[127:96]),
				.d(key_in[95:64]),.e(32'b0),.f(32'b0));
xor6_32 s (.clk(clk),.clr(clr),.o(key_out[63:32]),.a({rconst,24'b0}),.b(subrot_key),.c(key_in[127:96]),
				.d(key_in[95:64]),.e(key_in[63:32]),.f(32'b0));
xor6_32 t (.clk(clk),.clr(clr),.o(key_out[31:0]),.a({rconst,24'b0}),.b(subrot_key),.c(key_in[127:96]),
				.d(key_in[95:64]),.e(key_in[63:32]),.f(key_in[31:0]));

endmodule

//////////////////////////////////////////////
// Key evolution step for 256 bit key
//////////////////////////////////////////////
module evolve_key_256 (clk,clr,key_in,rconst,key_out);

parameter KEY_EVOLVE_TYPE = 0;

input clk,clr;
input [255:0] key_in;
input [7:0] rconst;		// the low order 24 bits are all 0						

output [255:0] key_out;
wire [255:0] key_out;

wire [31:0] rot_key;
wire [31:0] subrot_key;

wire [127:0] kin_u,kin_l;
assign {kin_u,kin_l} = key_in;
 
	generate 
	if (KEY_EVOLVE_TYPE == 0) begin
		
		// full evolution

		rot_word rw (.clk(clk),.clr(clr),.in (key_in[31:0]), .out(rot_key));
		sub_word sw (.clk(clk),.clr(clr),.in (rot_key), .out(subrot_key));

		// make it clear that the desired implementation is 
		// a flat XOR LUT bank, not a string of 2-XORs with
		// taps.  Better speed.  Very little area cost.
		xor6_32 q (.clk(clk),.clr(clr),.o(key_out[127:96]),.a({rconst,24'b0}),.b(subrot_key),.c(kin_u[127:96]),
						.d(32'b0),.e(32'b0),.f(32'b0));
		xor6_32 r (.clk(clk),.clr(clr),.o(key_out[95:64]),.a({rconst,24'b0}),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(32'b0),.f(32'b0));
		xor6_32 s (.clk(clk),.clr(clr),.o(key_out[63:32]),.a({rconst,24'b0}),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(kin_u[63:32]),.f(32'b0));
		xor6_32 t (.clk(clk),.clr(clr),.o(key_out[31:0]),.a({rconst,24'b0}),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(kin_u[63:32]),.f(kin_u[31:0]));
	end
	else begin
		
		// Quickie evolution 

		sub_word sw (.clk(clk),.clr(clr), .in (key_in[31:0]), .out(subrot_key));
	
		// make it clear that the desired implementation is 
		// a flat XOR LUT bank, not a string of 2-XORs with
		// taps.  Better speed.  Very little area cost.
		xor6_32 q (.clk(clk),.clr(clr),.o(key_out[127:96]),.a(32'b0),.b(subrot_key),.c(kin_u[127:96]),
						.d(32'b0),.e(32'b0),.f(32'b0));
		xor6_32 r (.clk(clk),.clr(clr),.o(key_out[95:64]),.a(32'b0),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(32'b0),.f(32'b0));
		xor6_32 s (.clk(clk),.clr(clr),.o(key_out[63:32]),.a(32'b0),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(kin_u[63:32]),.f(32'b0));
		xor6_32 t (.clk(clk),.clr(clr),.o(key_out[31:0]),.a(32'b0),.b(subrot_key),.c(kin_u[127:96]),
						.d(kin_u[95:64]),.e(kin_u[63:32]),.f(kin_u[31:0]));
	end
	endgenerate
	
	assign key_out[255:128] = kin_l;

endmodule

//////////////////////////////////////////////
// Inverse key evolution step for 128 bit key
//		Inverse key evolution isn't really
//		discussed in the original submission
//		of the FIPS specs, other than 
//		the mention that it is possible and 
//		necessary for rekey during decrypt.
//////////////////////////////////////////////
module inv_evolve_key_128 (clk,clr,key_in,rconst,key_out);
input clk,clr;
input [127:0] key_in;
input [7:0] rconst;		// the low order 24 bits are all 0						

output [127:0] key_out;
wire [127:0] key_out;

// change it to a more convenient format.
wire [31:0] a,b,c,d;
assign {a,b,c,d} = key_in;
wire [31:0] w,x,y,z;
assign key_out = {w,x,y,z};

// most of the bits are easy to get by XOR cancellation
assign z = c ^ d;
assign y = b ^ c;
assign x = a ^ b;

// One word is harder than the others
wire [31:0] rot_key;
wire [31:0] subrot_key;
rot_word rw (.clk(clk),.clr(clr),.in (z), .out(rot_key));
sub_word sw (.clk(clk),.clr(clr),.in (rot_key), .out(subrot_key));
assign w = a ^ subrot_key ^ {rconst,24'b0};

endmodule

//////////////////////////////////////////////
// Inverse key evolution step for 256 bit key
//////////////////////////////////////////////
module inv_evolve_key_256 (clk,clr,key_in,rconst,key_out);

parameter KEY_EVOLVE_TYPE = 0;

input clk,clr;
input [255:0] key_in;
input [7:0] rconst;		// the low order 24 bits are all 0						

output [255:0] key_out;
wire [255:0] key_out;

// change it to a more convenient format.
wire [31:0] a,b,c,d;
assign {a,b,c,d} = key_in[127:0];
wire [31:0] w,x,y,z;
assign key_out = {{w,x,y,z},key_in[255:128]};

// most of the bits are easy to get by XOR cancellation
assign z = c ^ d;
assign y = b ^ c;
assign x = a ^ b;

// One word is harder than the others
wire [31:0] rot_key;
wire [31:0] subrot_key;

generate
	if (KEY_EVOLVE_TYPE == 0) begin
		rot_word rw (.clk(clk),.clr(clr),.in (key_in[159:128]), .out(rot_key));
		sub_word sw (.clk(clk),.clr(clr),.in (rot_key), .out(subrot_key));
		assign w = a ^ subrot_key ^ {rconst,24'b0};
	end
	else begin
		sub_word sw (.clk(clk),.clr(clr),.in (key_in[159:128]), .out(subrot_key));
		assign w = a ^ subrot_key;
	end
endgenerate

endmodule

////////////////////////////////////////////////////
// Quick sanity checker testbench 
//    verify the inverse property of the key evolves
////////////////////////////////////////////////////
module evolve_test ();
reg clk,clr;
reg [255:0] key;
wire [127:0] fd;
wire [127:0] bk;
wire [255:0] fd1,fd2;
wire [255:0] bk1,bk2;

reg fail = 0;
reg [7:0] rconst;

evolve_key_128 e (.clk(clk),.clr(clr),.key_in(key[127:0]),.rconst(rconst),.key_out(fd));
inv_evolve_key_128 i (.clk(clk),.clr(clr),.key_in(fd),.rconst(rconst),.key_out(bk));

evolve_key_256 e1 (.clk(clk),.clr(clr),.key_in(key),.rconst(rconst),.key_out(fd1));
inv_evolve_key_256 i1 (.clk(clk),.clr(clr),.key_in(fd1),.rconst(rconst),.key_out(bk1));
	defparam e1 .KEY_EVOLVE_TYPE = 0;
	defparam i1 .KEY_EVOLVE_TYPE = 0;

evolve_key_256 e2 (.clk(clk),.clr(clr),.key_in(key),.rconst(rconst),.key_out(fd2));
inv_evolve_key_256 i2 (.clk(clk),.clr(clr),.key_in(fd2),.rconst(rconst),.key_out(bk2));
	defparam e2 .KEY_EVOLVE_TYPE = 1;
	defparam i2 .KEY_EVOLVE_TYPE = 1;

initial begin 
	clk = 0;
	key = 0;
	fail = 0;
	rconst = 0;
	#100000
	if (!fail) $display ("PASS");
	$stop();
end

always begin
    #25 clk = ~clk;
	#50 key = {$random,$random,$random,$random,$random,$random,$random,$random};
		rconst = $random;
	#50 if (bk != key[127:0]) begin
		$display ("Mismatch in 128 mode at time %d",$time);
		fail = 1;
	end
	if (bk1 != key) begin
		$display ("Mismatch in 256 type 0 mode at time %d",$time);
		fail = 1;
	end
	if (bk2 != key) begin
		$display ("Mismatch in 256 type 1 mode at time %d",$time);
		fail = 1;
	end
end
endmodule
