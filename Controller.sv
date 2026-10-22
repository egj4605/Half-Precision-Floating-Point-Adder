module Controller // Controller sends in a 4 bit and a 2 bit number for the value for which HEX will be displayed in the Four2OneMUX
(
input MuxRate, Reset, Load, 
output load, reset,
output [1:0] SEL,
output [3:0] CAT
);

always_comb begin

	if (Reset == 1'b0) begin 
		reset = 1'b0;
	end
	
	else begin
		reset = 1'b1;
	end 

	if (Load == 1'b0) begin 
		load = 1'b0;
	end
	
	else begin 
		load = 1'b1; 
	end
	
end



FSM FSM_inst
(
	.MuxRate(MuxRate) ,	// input  MuxRate_sig
	.Reset(Reset) ,	// input  Reset_sig
	.SEL(SEL) ,	// output [1:0] SEL_sig
	.CAT(CAT) 	// output [3:0] CAT_sig
);

endmodule