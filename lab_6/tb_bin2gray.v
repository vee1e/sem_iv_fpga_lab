module tb_bin2gray;
reg [3:0] in;
wire [3:0] out;
bin2gray b1(out, in);
initial begin
in = 4'b0000;
repeat(15) #10 in = in + 1;
#10 $finish;
end
initial
$monitor($time, " Binary=%b Gray=%b", in, out);
endmodule
