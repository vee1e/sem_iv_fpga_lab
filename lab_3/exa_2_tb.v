module exa_2_counter_tb;
    reg clk;
    wire [2:0] count;

    exa_2_ripple_count cnter(
	.clk(clk), .count(count)
	);
    initial begin
  	  clk = 0;
  	  #200 $finish;
    end
    always
    begin
  	  #2 clk = ~clk;
    end
    always @(posedge clk)
    $display("Count = %b", count );
endmodule