module IU 
(
input CLK, reset,
input [3:0] row,
output [15:0] WI,
output [3:0] col,
output [31:0] clk
);

Clock_Ladder Clock_Ladder_inst
(
	.COUNT(CLK) ,	// input  COUNT_sig
	.CLEAR(reset) ,	// input  CLEAR_sig
	.y(clk) 	// output [(N-1):0] y_sig
);

defparam Clock_Ladder_inst.N = 32;

keypad_input keypad_input_inst
(
	.clk(CLK) ,	// input  clk_sig
	.reset(reset) ,	// input  reset_sig
	.row(row) ,	// input [3:0] row_sig
	.col(col) ,	// output [3:0] col_sig
	.out(WI) ,	// output [((DIGITS*4)-1):0] out_sig
);
defparam keypad_input_inst.DIGITS = 4;

endmodule