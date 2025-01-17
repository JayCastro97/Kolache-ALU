`timescale 1ns/1ns
`include "../32x1_and.v"

module and_4x1_tb;
reg [3:0] a, b;
wire y;

and_8x1 test(.a(a), .b(b), .y(y));
initial begin
$dumpfile("and_8x1.vcd");
$dumpvars(0, and_4x1_tb);
$display("a    | b     |  y");
$display("-----+-------+-----");
$monitor("a = %b b = %b y = %b", a, b, y); 
// <# of bits>'b<binary value>
a = 4'b1111; b = 4'b1111; #20;  // case: both input's == 1 
a = 4'b0000; b = 4'b0000; #20;  // case: both input's == 0
a = 4'b1010; b = 4'b1010; #20;  //case: other
a = 4'b0100; b = 4'b0100; #20;  //case: other
end

endmodule