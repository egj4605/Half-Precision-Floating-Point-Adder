module MantissaNormalizerBitShifter //Eight-bit Logical Right Barrel Shifter
(
 input [10:0] in,    // A input // in
 input [2:0] ctrl,    // B input Shifter //was [2:0]
 output [10:0] x     // Y output
);
    wire [10:0] w, v;//, x;
    
    // 11 bit shift right
	 mux2X1 ins_54 (.in0(in[10]), .in1(1'b0), .sel(ctrl[2]), .out(v[10]));
	 mux2X1 ins_53 (.in0(in[9]), .in1(1'b0), .sel(ctrl[2]), .out(v[9]));
	 mux2X1 ins_52 (.in0(in[8]), .in1(1'b0), .sel(ctrl[2]), .out(v[8]));
    mux2X1 ins_51 (.in0(in[7]), .in1(1'b0), .sel(ctrl[2]), .out(v[7]));
    mux2X1 ins_50 (.in0(in[6]), .in1(1'b0), .sel(ctrl[2]), .out(v[6]));
    mux2X1 ins_49 (.in0(in[5]), .in1(1'b0), .sel(ctrl[2]), .out(v[5]));
    mux2X1 ins_48 (.in0(in[4]), .in1(1'b0), .sel(ctrl[2]), .out(v[4]));
    mux2X1 ins_47 (.in0(in[3]), .in1(1'b0), .sel(ctrl[2]), .out(v[3]));
    mux2X1 ins_46 (.in0(in[2]), .in1(1'b0), .sel(ctrl[2]), .out(v[2]));
    mux2X1 ins_45 (.in0(in[1]), .in1(1'b0), .sel(ctrl[2]), .out(v[1]));
    mux2X1 ins_44 (.in0(in[0]), .in1(1'b0), .sel(ctrl[2]), .out(v[0]));
	 
    // 11 bit shift right 
	 mux2X1 ins_43 (.in0(v[10]), .in1(1'b0), .sel(ctrl[1]), .out(w[10]));
	 mux2X1 ins_42 (.in0(v[9]), .in1(1'b0), .sel(ctrl[1]), .out(w[9]));
	 mux2X1 ins_41 (.in0(v[8]), .in1(1'b0), .sel(ctrl[1]), .out(w[8]));
    mux2X1 ins_40 (.in0(v[7]), .in1(1'b0), .sel(ctrl[1]), .out(w[7]));
    mux2X1 ins_39 (.in0(v[6]), .in1(1'b0), .sel(ctrl[1]), .out(w[6]));
    mux2X1 ins_38 (.in0(v[5]), .in1(1'b0), .sel(ctrl[1]), .out(w[5]));
    mux2X1 ins_37 (.in0(v[4]), .in1(1'b0), .sel(ctrl[1]), .out(w[4]));
    mux2X1 ins_36 (.in0(v[3]), .in1(1'b0), .sel(ctrl[1]), .out(w[3]));
    mux2X1 ins_35 (.in0(v[2]), .in1(1'b0), .sel(ctrl[1]), .out(w[2]));
    mux2X1 ins_34 (.in0(v[1]), .in1(1'b0), .sel(ctrl[1]), .out(w[1]));
    mux2X1 ins_33 (.in0(v[0]), .in1(1'b0), .sel(ctrl[1]), .out(w[0]));
 
    // 1 bit shift right
	 mux2X1 ins_10 (.in0(w[10]), .in1(1'b0), .sel(ctrl[0]), .out(x[10]));
    mux2X1 ins_09 (.in0(w[9]), .in1(w[10]), .sel(ctrl[0]), .out(x[9]));
    mux2X1 ins_08 (.in0(w[8]), .in1(w[9]), .sel(ctrl[0]), .out(x[8]));
    mux2X1 ins_07 (.in0(w[7]), .in1(w[8]), .sel(ctrl[0]), .out(x[7]));
    mux2X1 ins_06 (.in0(w[6]), .in1(w[7]), .sel(ctrl[0]), .out(x[6]));
    mux2X1 ins_05 (.in0(w[5]), .in1(w[6]), .sel(ctrl[0]), .out(x[5]));
    mux2X1 ins_04 (.in0(w[4]), .in1(w[5]), .sel(ctrl[0]), .out(x[4]));
    mux2X1 ins_03 (.in0(w[3]), .in1(w[4]), .sel(ctrl[0]), .out(x[3]));
    mux2X1 ins_02 (.in0(w[2]), .in1(w[3]), .sel(ctrl[0]), .out(x[2]));
    mux2X1 ins_01 (.in0(w[1]), .in1(w[2]), .sel(ctrl[0]), .out(x[1]));
    mux2X1 ins_00 (.in0(w[0]), .in1(w[1]), .sel(ctrl[0]), .out(x[0]));
	 
endmodule