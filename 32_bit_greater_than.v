module GT (
input a, b,
output Output 
);

and G2 (Output, a, ~b); 

endmodule


// create 2_bit greater_than component
module GT_2x1 (
input [1:0 ]a, b,
output Output 
);
wire [1:0] s;
// instantiation
GT m1 (a[1], b[1],s[1]);
GT m2 (a[0], b[0], s[0]);
// interface
or (Output, s[1], s[0]); 

endmodule
