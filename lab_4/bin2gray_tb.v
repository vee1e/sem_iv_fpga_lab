module bin2gray_tb;
  reg [3:0] bin;
  wire [3:0] gray;

  bin2gray dut(bin, gray);

  initial begin
    bin = 4'b0000;
    #10 bin = 4'b0101;
    #10 bin = 4'b1010;
    #10 bin = 4'b1111;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%0t bin=%b gray=%b", $time, bin, gray);
  end
endmodule
