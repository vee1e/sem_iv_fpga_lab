module eg2(input a, b, c, output y, cout);
	assign y = a ^ b ^ c;
	assign cout = a & b | b & c | a & c;
endmodule
