module TermProject 
(
input Clock, Reset, InA, InB, InR,
input [3:0] row,
output [6:0] SEG,
output [3:0] col, CAT,
output OverFlow, UnderFlow
);

logic OVR, UNDR;
logic [15:0] WI, Rvalue, V, Aout, Bout, Rout;
logic [31:0] clk;

IU IU_inst
(
	.CLK(Clock) ,	// input  clk_sig
	.reset(Reset) ,	// input  reset_sig
	.row(row) ,	// input [3:0] row_sig
	.WI(WI),
	.col(col), 	// output [3:0] col_sig
	.clk(clk)  // output [31:0] clk_sig
);

NBitRegister #(16) NBitRegister_instA
(
	.D(WI) ,	// input [(N-1):0] D_sig
	.CLK(Clock) ,	// input  CLK_sig
	.Load(InA),
	.CLR(Reset) ,	// input  CLR_sig
	.Q(Aout) 	// output [(N-1):0] Q_sig
);


NBitRegister #(16) NBitRegister_instB
(
	.D(WI) ,	// input [(N-1):0] D_sig
	.CLK(Clock) ,	// input  CLK_sig
	.Load(InB),
	.CLR(Reset) ,	// input  CLR_sig
	.Q(Bout) 	// output [(N-1):0] Q_sig
);


HalfPrecisionFloatingPointAddSub HalfPrecisionFloatingPointAddSub_inst
(
	.A(Aout) ,	// input [15:0] A_sig
	.B(Bout) ,	// input [15:0] B_sig
	.R(Rout) ,	// output [15:0] R_sig
	.OVR(OVR) ,	// output  OVR_sig
	.UNDR(UNDR) 	// output  UNDR_sig
);

NBitRegister #(16) NBitRegister_instR
(
	.D(Rout) ,	// input [(N-1):0] D_sig
	.CLK(Clock) ,	// input  CLK_sig
	.Load(InR),
	.CLR(Reset) ,	// input  CLR_sig
	.Q(Rvalue) 	// output [(N-1):0] Q_sig
);

keyoutValues keyoutValues_inst
(
	.Clock(Clock) ,	// input  Clock_sig
	.Reset(Reset) ,	// input  Reset_sig
	.InputA(InA) ,	// input  InA_sig
	.InputB(InB) ,	// input  InB_sig
	.InputR(InR) ,	// input  InR_sig
	.OverFlow(OVR) ,	// input  OverFlow_sig
	.UnderFlow(UNDR) ,	// input  UnderFlow_sig
	.ABV(WI) ,	// input [15:0] ABV_sig
	.RV(Rvalue) ,	// input [15:0] RV_sig
	.V(V) ,	// output [15:0] V_sig
	.OVR(OverFlow) ,	// output  OVR_sig
	.UNDR(UnderFlow) 	// output  UNDR_sig
);

OU OU_inst
(
	.CLK(clk[17]) ,	// input  CLK_sig
	.Load(clk[22]) ,	// input  Load_sig
	.Reset(Reset) ,	// input  Reset_sig
	.Value(V) ,	// input [15:0] V_sig
	.SEG(SEG) ,	// output [6:0] SEG_sig
	.CAT(CAT) ,	// output [3:0] CAT_sig
);

endmodule