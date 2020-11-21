`include "../32x1_and.v"
module EQ (
input a, b,
output y
);
wire n;
xor(n,a,b);
not(y,n);

endmodule
//temporary 2-bit equal
module equal (
    input [1:0] a, b, output y
);
// initialize 32_bit AND gate
wire c1,c2;
// initialize two EQ components 
EQ m1(.a(a[1]), .b(b[1]),.y(c1));
EQ m2(.a(a[0]), .b(b[0]),.y(c2));
// initialize 
and(y,c1,c2);
//and_4x1 u1(.a(a[3:2]),.b(b[3:2]), .y(y));



//wire c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15,
// c16,c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
endmodule 
