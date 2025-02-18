module ex3_tb_mux();
	reg i0, i1, i2, i3, s0, s1;
	wire y;
	ex3_mux uut(i0, i1, i2, i3, s0, s1, y);

	initial begin
		i0 = 1; i1 = 0; i2 = 1; i3 = 0;

		   s0 = 0; s1 = 0;
		#5 s0 = 0; s1 = 1;
		#5 s0 = 1; s1 = 0;
		#5 s0 = 1; s1 = 1;
		#5 s0 = 0; s1 = 0;
	end
endmodule
