module carry_save_multiplier_tb;
  reg [3:0] a, b;
  wire [7:0] product;

  carry_save_multiplier dut(a, b, product);

  initial begin
    a = 4'b0000; b = 4'b0000;
    #10 a = 4'b1010; b = 4'b0101;
    #10 a = 4'b1111; b = 4'b1111;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%0t a=%b b=%b product=%b", $time, a, b, product);
  end
endmodule
