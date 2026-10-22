//Four-Bit Controlled Exponent Incrementer/Decrementer
module ControlledExponentIncDec
(
 input Cin, //Carry in input
 input Select, //select input 1 to Increment or 0 to Decrement
 input [4:0] A, //declare input ports
 output [4:0] S, //declare output ports for sum
 output Cout //declare carry-out port
); 

 wire [5:0] C; //declare internal carries
 
 assign C[0] = Cin; //Add 0 for addition, 1 for subtraction
 assign Cout = C[5]; //assign value carry out

 //instantiate the full adder module for each stage of the ripple carry adder
 FAbehavSV s0 (A[0], Cin^Select, C[0], S[0], C[1]); //stage 0
 FAbehavSV s1 (A[1], Cin^1'b0, C[1], S[1], C[2]); //stage 1
 FAbehavSV s2 (A[2], Cin^1'b0, C[2], S[2], C[3]); //stage 2
 FAbehavSV s3 (A[3], Cin^1'b0, C[3], S[3], C[4]); //stage 3
 FAbehavSV s4 (A[4], Cin^1'b0, C[4], S[4], C[5]); //stage 4

endmodule