module Four2OneMUX // Chooses which HEX value to display based on SEL value
(

input [1:0] SEL,
input [3:0] HEX0, HEX1, HEX2, HEX3,
output [3:0] BIN

);

always_comb begin
case(SEL) 
	2'b00: BIN = HEX0;
	2'b01: BIN = HEX1;
	2'b10: BIN = HEX2;
	2'b11: BIN = HEX3;
	endcase
end
endmodule
