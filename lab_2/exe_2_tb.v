module ex2_tb();
	reg e, a, b;
	wire y0, y1, y2, y3;

	ex2 uut(e, a, b, y0, y1, y2, y3);

	initial begin
		   e = 0; a = 0; b = 0;
		#5 e = 1; a = 0; b = 0;
		#5 e = 1; a = 0; b = 1;
		#5 e = 1; a = 1; b = 0;
		#5 e = 1; a = 1; b = 1;
	end
endmodule
