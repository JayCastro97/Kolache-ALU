module HA (
input a, b,
output c_out, sum
);

xor G1 (sum, a, b);
and G2 (c_out, a, b);

endmodule

module FA (
input a, b, c_in,
output c_out, sum
);

wire w1, w2, w3, w4;

HA M1 (a, b, w1, w2);
HA M2 (w2, c_in, w3, sum);
or O1 (c_out, w1, w3);

endmodule

module Adder_subtractor (
input [4:0] a, b, // A and B input
input M, // mode input
output [3:0] sum,
output c_out
);

wire [3:0] x;
wire c1, c2, c3;

xor G0 (x[0], b[0], M);
xor G1 (x[1], b[1], M);
xor G2 (x[2], b[2], M);
xor G3 (x[3], b[3], M);

FA m0 (.a(a[0]), .b(x[0]), .c_in(M), .sum(sum[0]), .c_out(c1));
FA m1 (.a(a[1]), .b(x[1]), .c_in(c1), .sum(sum[1]), .c_out(c2));
FA m2 (.a(a[2]), .b(x[2]), .c_in(c2), .sum(sum[2]), .c_out(c3));
FA m3 (.a(a[3]), .b(x[3]), .c_in(c3), .sum(sum[3]), .c_out(c_out));

endmodule