module mod10_counter_tb;
  reg clk, rst;
  wire [3:0] count;

  mod10_counter dut(clk, rst, count);

  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #200 $finish;
  end

  always #5 clk = ~clk;

  initial begin
    $monitor("Time=%0t count=%d", $time, count);
  end
endmodule
