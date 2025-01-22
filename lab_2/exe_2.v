module ex2(input e, a, b, output y0, y1, y2, y3);
	assign y0 = e & ~a & ~b;
	assign y1 = e & ~a &  b;
	assign y2 = e &  a & ~b;
	assign y3 = e &  a &  b;
endmodule
