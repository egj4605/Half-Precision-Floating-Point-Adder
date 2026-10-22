//Half-Precision Floating-Point Adder Subtractor
module HalfPrecisionFloatingPointAddSub
(
 input [15:0] A, B,						//declare result output
 output [15:0] R, 
 output OVR, UNDR
);

logic SA, SB, S, Cout, select, Addsub;
logic [4:0] EA, EB, EAEB, E, Exponent;
logic [9:0] MA, MB, Mantissa;
logic [10:0] M, M1, M2, Man, Mansub;
logic [11:0] Mout;

assign SA = A[15];
assign EA = A[14:10];
assign MA = A[9:0];

assign SB = B[15];
assign EB = B[14:10];
assign MB = B[9:0];

//Adder Logic:

ModulerExponentSubtractor ModulerExponentAdder_inst
(
	.A(EA) ,	// input [4:0] A_sig
	.B(EB) ,	// input [4:0] B_sig
	.OUT(EAEB) ,	// output [4:0] OUT_sig
	.Cout(S) 	// output  Cout_sig
);

MShiftMUX MShiftMUX_inst
(
	.sel(S) ,	// input  sel_sig
	.in0({1'b1, MA}) ,	// input  in0_sig
	.in1({1'b1, MB}) ,	// input  in1_sig
	.out(M) 	// output  out_sig
);

MantissaRightShifter MantissaRightShifter_inst
(
	.in(M) ,	// input [10:0] in_sig
	.ctrl(EAEB) ,	// input [4:0] ctrl_sig
	.out(M1) 	// output [10:0] out_sig
);

ExponentIncMUX ExponentIncMUX_inst
(
	.sel(S) ,	// input  sel_sig
	.in0(EB) ,	// input  in0_sig
	.in1(EA) ,	// input  in1_sig
	.out(E) 	// output  out_sig
);

assign select = E[0] ? 1'b1 : 1'b0;

ControlledExponentIncDec ControlledExponentIncDec_inst
(
	.Cin(Cout) ,	// input  Cin_sig
	.Select(select) ,	// input  Select_sig
	.A(E) ,	// input [4:0] A_sig
	.S(Exponent) ,	// output [4:0] S_sig
	.Cout(nope) 	// output  Cout_sig
);

//Bonus OverFlow/UnderFlow Logic (incomplete):

assign OVR = Exponent == 5'b11111 ? 1'b1 : 1'b0;
assign UNDR = Exponent == 5'b00000 ? 1'b1 : 1'b0;

MAdderMUX MAdderMUX_inst
(
	.sel(S) ,	// input  sel_sig
	.in0({1'b1, MB}) ,	// input  in0_sig
	.in1({1'b1, MA}) ,	// input  in1_sig
	.out(M2) 	// output  out_sig
);

ADDER ADDER_inst
(
	.Cin(1'b0) ,	// input  Cin_sig
	.A(M1) ,	// input [10:0] A_sig
	.B(M2) ,	// input [10:0] B_sig
	.Sum(Mout) ,	// output [10:0] Sum_sig
	.Cout(Cout), 	// output  Cout_sig
);

MantissaNormalizerBitShifter MantissaNormalizerBitShifter_inst
(
	.in(Mout) ,	// input [10:0] in_sig // in
	.ctrl({2'b00, Cout}) ,	// input [4:0] ctrl_sig
	.x(Man) 	// output [10:0] out_sig
);

assign Mantissa = Man[10] ? Man[9:0] : Man[10:1];

assign R[9:0] = Mantissa;
assign R[14:10] = Exponent;
assign R[15] = 1'b0;

endmodule

//Bonus Subtractor Logic (*incomplete* not functional):
/*
leadingzerocnt leadingzerocnt_inst
(
	.Mout(Mout) ,	// input [10:0] Mout_sig
	.cntout(cntout) 	// output [4:0] cntout_sig
);

ModulerExponentSubtractor ModulerExponentSubtractor_inst
(
	.A(E) ,	// input [4:0] A_sig
	.B(cntout) ,	// input [4:0] B_sig
	.OUT(EAEB) ,	// output [4:0] OUT_sig
	.Cout(Exponent) 	// output  Cout_sig
);

MantissaLeftShifter MantissaLeftShifter_inst
(
	.in(Mout) ,	// input [10:0] in_sig
	.ctrl(cntout) ,	// input [4:0] ctrl_sig
	.out(Mansub) 	// output [10:0] out_sig
);

Addsub Addsub_inst
(
	.SA(SA) ,	// input  SA_sig
	.SB(SB) ,	// input  SB_sig
	.Addsub(Addsub) 	// output  Addsub_sig
);

//assign Mantissa = Mansub[10] ? Mansub[9:0] : Mansub[10:1];
*/

