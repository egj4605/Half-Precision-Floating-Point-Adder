module MAdderMUX //2 to 1 Multiplexer
(
input sel, 
input [10:0] in0, in1,
output [10:0] out
);

assign out = sel ? in1 : in0;

endmodule