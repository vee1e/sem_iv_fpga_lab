module tb_dff;
reg d, clk, rst;
wire q;

dff dff_inst(q, d, clk, rst);

initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
rst = 1;
d = 0;
#10 rst = 0;
#10 d = 1;
#12 d = 0;
#8 d = 1;
#15 d = 0;
#10 rst = 1;
#5 rst = 0;
#10 d = 1;
#10 d = 0;
#10 $finish;
end

initial
$monitor($time, " rst=%b d=%b clk=%b q=%b", rst, d, clk, q);
endmodule