//5-bit Ripple Carry Subtractor Structural Model
module RCS5bit (
 input clock, //clock for loading registers
 input [4:0] A, B, //declare input ports
 output [4:0] R, //declare output ports for sum
 output Cout); //declare carry-out port

 wire [5:0] C; //declare internal carries
 wire [4:0] S; //Adder-subtractor output
 
 assign C[0] = 1'b1; //et to 1 for subtraction. Add 0 for addition, 1 for subtraction
 assign Cout = C[5]; //assign value carry out
 assign R = S; //rename sum out

 //instantiate the full adder module for each stage of the ripple carry adder
 FAbehavSV s0 (A[0], 1'b1^B[0], C[0], S[0], C[1]); //stage 0
 FAbehavSV s1 (A[1], 1'b1^B[1], C[1], S[1], C[2]); //stage 1
 FAbehavSV s2 (A[2], 1'b1^B[2], C[2], S[2], C[3]); //stage 2
 FAbehavSV s3 (A[3], 1'b1^B[3], C[3], S[3], C[4]); //stage 3
 FAbehavSV s4 (A[4], 1'b1^B[4], C[4], S[4], C[5]); //stage 4
endmodule