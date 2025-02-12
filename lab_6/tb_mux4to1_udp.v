module tb_mux4to1_udp;
reg a, b, c, d, s0, s1;
wire out;
mux4to1_udp m1(out, a, b, c, d, s0, s1);
initial begin
{a, b, c, d, s0, s1} = 6'b000000;
#10 {a, b, c, d, s0, s1} = 6'b100000;
#10 {a, b, c, d, s0, s1} = 6'b010100;
#10 {a, b, c, d, s0, s1} = 6'b001010;
#10 {a, b, c, d, s0, s1} = 6'b000111;
#10 $finish;
end
initial
$monitor($time, " a=%b b=%b c=%b d=%b s0=%b s1=%b out=%b", a, b, c, d, s0, s1, out);
endmodule
