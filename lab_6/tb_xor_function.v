module tb_xor_module;
reg a, b;
wire out;

xor_module uut(out, a, b);

initial begin
{a, b} = 2'b00;
#10 {a, b} = 2'b01;
#10 {a, b} = 2'b10;
#10 {a, b} = 2'b11;
#10 $finish;
end

initial
$monitor($time, " a=%b b=%b out=%b", a, b, out);
endmodule