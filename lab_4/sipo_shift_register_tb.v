module sipo_shift_register_tb;
  reg clk, rst, si;
  wire [3:0] po;

  sipo_shift_register dut(clk, rst, si, po);

  initial begin
    clk = 0;
    rst = 1;
    si = 0;
    #10 rst = 0;
    #10 si = 1;
    #10 si = 0;
    #10 si = 1;
    #10 si = 1;
    #50 $finish;
  end

  always #5 clk = ~clk;

  initial begin
    $monitor("Time=%0t si=%b po=%b", $time, si, po);
  end
endmodule
