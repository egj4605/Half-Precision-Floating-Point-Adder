module PIPO // Parallel In Parallel Out Module for each HEX Display
( 
input CLK, load, reset,
input [3:0] HEXin0, HEXin1, HEXin2, HEXin3,
output [3:0] HEX0, HEX1, HEX2, HEX3
);

always_ff @(posedge CLK) begin

	if(reset == 1'b0) begin
	
		HEX0 <= 4'b1111;
		HEX1 <= 4'b1111;
		HEX2 <= 4'b1111;
		HEX3 <= 4'b1111;

	end

	else if (load == 1'b0) begin

		HEX0 <= HEXin0; 
		HEX1 <= HEXin1;
		HEX2 <= HEXin2;
		HEX3 <= HEXin3;

	end 

end

endmodule