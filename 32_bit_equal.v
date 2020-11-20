module EQ (
input a, b,
output y
);
wire n;
xor(n,a,b);
not(y,n);

endmodule
