module Addsub
(
input SA, SB,
output Addsub
);

always_comb begin

 if (SA ^ SB) begin 
 
	Addsub = 1;
	end
	else begin Addsub = 0;
	end
	end
	
endmodule
