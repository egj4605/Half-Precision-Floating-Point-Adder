module leadingzerocnt
(
	input [10:0] Mout,
	output [4:0] cntout
);

logic [4:0] Icnt;
always_comb begin
assign Icnt = 5'b00000;

for (int i = 11; i > 0; i--) begin
		if(Icnt == 0) Icnt++;
			else break;
		end
	end
		assign cntout = Icnt;
		
endmodule