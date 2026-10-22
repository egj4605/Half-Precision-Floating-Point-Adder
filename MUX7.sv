module MUX7 // Organization of a Multiplexed Seven-Segment Display Decoder/Controller
(
input CLK, Load, Reset,
input [3:0] HEX0, HEX1, HEX2, HEX3,
output [6:0] SEG,
output [3:0] CAT
);

logic load, reset;//, MuxRate;
logic [1:0] SEL;
logic [3:0] HEXout0, HEXout1, HEXout2, HEXout3, BIN;
logic [31:0] y;

Controller Controller_inst
(
	.MuxRate(CLK) ,	// input  MuxRate_sig
	.Reset(Reset) ,	// input  Reset_sig
	.Load(Load) ,	// input  Load_sig
	.load(load) ,	// output  load_sig
	.reset(reset) ,	// output  reset_sig
	.SEL(SEL) ,	// output [1:0] SEL_sig
	.CAT(CAT) 	// output [3:0] CAT_sig
);

PIPO PIPO_inst
(
	.CLK(CLK), // input CLK_sig
	.load(load) ,	// input  load_sig
	.reset(reset) ,	// input  reset_sig
	.HEXin0(HEX0) ,	// input [3:0] HEXin0_sig
	.HEXin1(HEX1) ,	// input [3:0] HEXin1_sig
	.HEXin2(HEX2) ,	// input [3:0] HEXin2_sig
	.HEXin3(HEX3) ,	// input [3:0] HEXin3_sig
	.HEX0(HEXout0) ,	// output [3:0] HEX0_sig
	.HEX1(HEXout1) ,	// output [3:0] HEX1_sig
	.HEX2(HEXout2) ,	// output [3:0] HEX2_sig
	.HEX3(HEXout3) 	// output [3:0] HEX3_sig
);

Four2OneMUX Four2OneMUX_inst
(
	.SEL(SEL) ,	// input [1:0] SEL_sig
	.HEX0(HEXout0) ,	// input [3:0] HEX0_sig
	.HEX1(HEXout1) ,	// input [3:0] HEX1_sig
	.HEX2(HEXout2) ,	// input [3:0] HEX2_sig
	.HEX3(HEXout3) ,	// input [3:0] HEX3_sig
	.BIN(BIN) 	// output [3:0] BIN_sig
);

HEX2Seven HEX2Seven_inst
(
	.BIN(BIN) ,	// input [3:0] BIN_sig
	.SEV(SEG) 	// output [6:0] SEV_sig
);

endmodule