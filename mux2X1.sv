module mux2X1 //2 to 1 Multiplexer
(
input sel, 
input in0, in1,
output out
);

assign out = sel ? in1 : in0;

endmodule