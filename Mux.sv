module Mux 
(
input IUAU,
input [15:0] WI, Rout,
output [15:0] WIout);

always_comb begin

	if(IUAU == 1'b1) WIout = Rout;
	
	else WIout = WI;  
	
	end
	
endmodule