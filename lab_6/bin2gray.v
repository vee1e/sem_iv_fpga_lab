primitive xor2_udp(out, a, b);
output out;
input a, b;
table
0 0 : 0;
0 1 : 1;
1 0 : 1;
1 1 : 0;
endtable
endprimitive

module bin2gray(out, in);
output [3:0] out;
input [3:0] in;
xor2_udp x1(out[3], 1'b0, in[3]);
xor2_udp x2(out[2], in[3], in[2]);
xor2_udp x3(out[1], in[2], in[1]);
xor2_udp x4(out[0], in[1], in[0]);
endmodule
