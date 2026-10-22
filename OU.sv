//Verilog Model of an Output Unit (OU) that takes an 16-bit 
module OU 
(
	input CLK, Load, Reset,
	input [15:0] Value,
	output [6:0] SEG,
	output [3:0] CAT,
	output OVR, UNDR
);

logic [3:0] HEX0, HEX1, HEX2, HEX3;

assign HEX0 = Value[3:0]; 
assign HEX1 = Value[7:4];
assign HEX2 = Value[11:8];
assign HEX3 = Value[15:12];

MUX7 MUX7_inst
(
	.CLK(CLK) ,	// input  CLK_sig
	.Load(Load) ,	// input  Load_sig
	.Reset(Reset) ,	// input  Reset_sig
	.HEX0(HEX0) ,	// input [3:0] HEX0_sig
	.HEX1(HEX1) ,	// input [3:0] HEX1_sig
	.HEX2(HEX2) ,	// input [3:0] HEX2_sig
	.HEX3(HEX3) ,	// input [3:0] HEX3_sig
	.SEG(SEG) ,	// output [6:0] SEG_sig
	.CAT(CAT) 	// output [3:0] CAT_sig
);

endmodule