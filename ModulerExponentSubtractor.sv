// Five-Bit Modular Exponent Subtractor
module ModulerExponentSubtractor 
(
 input [4:0] A, B, //Inputs A and B
 output [4:0] OUT, //5bit output OUT
 output Cout //Carry-out output
);

logic [4:0] R5, B5; //internal R and B

RCS5bit RCS5bit_inst
(
	.clock(clock_sig) ,	// input  clock_sig
	.A(A) ,	// input [4:0] A_sig
	.B(B) ,	// input [4:0] B_sig
	.R(R5) ,	// output [4:0] R_sig
	.Cout(Cout) 	// output  Cout_sig
);


twoSIGN twoSIGN_inst
(
	.A(R5) ,	// input [(N-1):0] A_sig
	.B(B5) 	// output [(N-1):0] B_sig
);

MUX2to1 MUX2to1_inst
(
	.Cout(Cout) ,	// input  Cout_sig
	.R(R5) ,	// input [4:0] R_sig
	.B(B5) ,	// input [4:0] B_sig
	.OUT(OUT) 	// output [4:0] OUT_sig
);

endmodule