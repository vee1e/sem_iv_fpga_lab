module ex1_tb();
	reg a, b, d;
	wire di, e;
	ex1 uut(a, b, d, di, e);

	initial begin
		   a = 0; b = 0; d = 0;
		#5 a = 0; b = 0; d = 1;
		#5 a = 0; b = 1; d = 0;
		#5 a = 0; b = 1; d = 1;
		#5 a = 1; b = 0; d = 0;
		#5 a = 1; b = 0; d = 1;
		#5 a = 1; b = 1; d = 0;
		#5 a = 1; b = 1; d = 1;
	end

	initial begin
		$monitor($time, "a = %b, b = %b, d = %b", a, b, d);
		#40 $finish;
	end
endmodule
