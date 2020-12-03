//*******************************
// 1 bit Less Than Module
//******************************
module LT (
input a, b,
output Output 
);
// interface
and G0 (Output, ~a, b); 

endmodule

//*******************************
// 2 bit Less Than Module
//******************************
module LT_2b (
input [1:0] a, b,
output Output 
);
// instance 
wire [3:0] w; // 2 additional wires needed to check for LSB
wire s;
LT m1 (.a(a[1]), .b(b[1]), .Output(w[3])); // a[1] < b[1]
LT m2 (.a(a[0]), .b(b[0]), .Output(w[2])); // a[0] < b[0]
LT m3 (.a(a[1]), .b(w[2]), .Output(w[1])); // a[1] < w[2]
and m4 (w[0], w[2],b[1]);
// interface
or m5 (s ,w[3], w[1]); 
or m6 (Output ,s, w[0]); 

endmodule