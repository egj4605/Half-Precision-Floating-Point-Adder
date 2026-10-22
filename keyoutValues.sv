module keyoutValues
(
input Clock, Reset, InputA, InputB, InputR, OverFlow, UnderFlow,
input [15:0] ABV, 
input [15:0] RV,
output [15:0] V,
output OVR, UNDR

);

always_ff @(posedge Clock or negedge Reset) begin

	if(!Reset) begin V <= 0; OVR <= 0; UNDR <= 0;
	
   end else if(!InputA) begin V <= ABV;
	
	end else if(!InputB) begin V <= ABV; 
	
	end else if(!InputR) begin V <= RV; OVR <= OverFlow; UNDR <= UnderFlow; 
	
	end
   end
	
endmodule