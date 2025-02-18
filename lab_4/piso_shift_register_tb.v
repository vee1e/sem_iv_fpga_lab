module piso_shift_register_tb;
  reg clk, rst, load;
  reg [3:0] pi;
  wire so;

  piso_shift_register dut(clk, rst, load, pi, so);

  initial begin
    clk = 0;
    rst = 1;
    load = 0;
    pi = 4'b0000;
    #10 rst = 0;
    #10 load = 1; pi = 4'b1010;
    #10 load = 0;
    #50 $finish;
  end

  always #5 clk = ~clk;

  initial begin
    $monitor("Time=%0t load=%b pi=%b so=%b", $time, load, pi, so);
  end
endmodule
