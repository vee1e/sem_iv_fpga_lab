module ex3_mux(input i0, i1, i2, i3, s0, s1, output y);
	assign b0 = ~s1 & ~s0 & i0;
	assign b1 = ~s1 &  s0 & i1;
	assign b2 =  s1 & ~s0 & i2;
	assign b3 =  s1 &  s0 & i3;
	assign y = b0 | b1 | b2 | b3;
endmodule
