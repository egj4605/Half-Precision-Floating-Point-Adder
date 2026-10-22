//Ripple Carry Adder-Subtractor Structural Model.
module ADDER (
 input Cin, //Carry in input
 input [11:0] A, B, //declare input ports
 output [11:0] Sum, //declare output ports for sum
 output Cout
 ); //declare carry-out port

 wire [12:0] C; //declare internal carries
 wire [11:0] S; //Adder-subtractor output
 
 assign C[0] = Cin; //Add 0 for addition, 1 for subtraction (AddSub)
 assign Cout = C[12]; //assign value carry out
 assign Sum = S; //rename sum out

 //instantiate the full adder module for each stage of the ripple carry adder
 FAbehavSV s0 (A[0], C[0]^B[0], C[0], S[0], C[1]); //stage 0
 FAbehavSV s1 (A[1], C[0]^B[1], C[1], S[1], C[2]); //stage 1
 FAbehavSV s2 (A[2], C[0]^B[2], C[2], S[2], C[3]); //stage 2
 FAbehavSV s3 (A[3], C[0]^B[3], C[3], S[3], C[4]); //stage 3
 FAbehavSV s4 (A[4], C[0]^B[4], C[4], S[4], C[5]); //stage 4
 FAbehavSV s5 (A[5], C[0]^B[5], C[5], S[5], C[6]); //stage 5
 FAbehavSV s6 (A[6], C[0]^B[6], C[6], S[6], C[7]); //stage 6
 FAbehavSV s7 (A[7], C[0]^B[7], C[7], S[7], C[8]); //stage 7
 FAbehavSV s8 (A[8], C[0]^B[8], C[8], S[8], C[9]); //stage 8
 FAbehavSV s9 (A[9], C[0]^B[9], C[9], S[9], C[10]); //stage 9
 FAbehavSV s10 (A[10], C[0]^B[10], C[10], S[10], C[11]); //stage 10
 FAbehavSV s11 (A[11], C[0]^B[11], C[11], S[11], C[12]); //stage 11
 
endmodule