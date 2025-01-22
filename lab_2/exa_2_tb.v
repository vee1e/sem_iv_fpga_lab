module eg2_tb();
	reg a, b, c;
	wire y, cout;
	eg2 uut(a, b, c, y, cout);

	initial begin
		   a = 0; b = 0; c = 0;
		#5 a = 0; b = 0; c = 1;
		#5 a = 0; b = 1; c = 0;
		#5 a = 0; b = 1; c = 1;
		#5 a = 1; b = 0; c = 0;
		#5 a = 1; b = 0; c = 1;
		#5 a = 1; b = 1; c = 0;
		#5 a = 1; b = 1; c = 1;
	end

	initial begin
		$monitor($time, "a = %b, b = %b, c = %b", a, b, c);
		#40 $finish;
	end
endmodule
