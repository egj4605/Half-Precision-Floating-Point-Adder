module MUX2to1 //2 to 1 Multiplexer for 0 or 1 Cout
(
input Cout, //input 0 or 1 Cout 
input [4:0] R, B,
output [4:0] OUT //output R or B depending on Cout
);

//assigns value of OUT based on the value of Cout
always_comb begin
	
	if (Cout == 1'b1) begin 
			OUT = R; 
		end 
		  
	else begin 
			OUT = B;
      end
		
   end
	
endmodule