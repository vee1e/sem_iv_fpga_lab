module ex3_demux_tb();
	reg s1, s0, i;
	wire y0, y1, y2, y3;

	ex3_demux uut(i, s0, s1, y0, y1, y2, y3);

	initial begin
		i = 1;
		s0 = 0; s1 = 0;
		#5 s0 = 0; s1 = 1;
		#5 s0 = 1; s1 = 0;
		#5 s0 = 1; s1 = 1;
	end
endmodule
