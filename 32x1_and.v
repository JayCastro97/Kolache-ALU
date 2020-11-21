module and_32x1(
	input [31:0] a, b,
	output y
);
endmodule



// input: a[4:0], b[4:0]
// output: y as 1-bit binary
module and_8x1(
	input [3:0] a , b,
	output y
);
wire [1:0] s;
// instace of and_4x1 
and_4x1 u1(.a(a[3:2]),.b(b[3:2]), .y(s[1]));
and_4x1 u2(.a(a[1:0]),.b(b[1:0]), .y(s[0]));
// interface: 4x1_and -> 8x1_and
and(y,s[1],s[0]);
endmodule	

// input: a[1:0], b[1:0]
// output: y as 1-bit binary
module and_4x1(
	input [1:0] a , b,
	output y
);
wire [1:0] s;
and(s[1],a[1],b[1]);
and(s[0],a[0],b[0]);
and(y,s[1],s[0]);
endmodule	