module ex1(input a, b, d, output di, e);
	assign di = a ^ b ^ d;
	assign e = (~a & b) | (~(a ^ b) & d);
endmodule
