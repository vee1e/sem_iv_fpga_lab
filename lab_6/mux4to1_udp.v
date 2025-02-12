primitive mux4to1_udp(out, a, b, c, d, s0, s1);
output out;
input a, b, c, d, s0, s1;
table
0 ? ? ? 0 0 : 0;
1 ? ? ? 0 0 : 1;
? 0 ? ? 1 0 : 0;
? 1 ? ? 1 0 : 1;
? ? 0 ? 0 1 : 0;
? ? 1 ? 0 1 : 1;
? ? ? 0 1 1 : 0;
? ? ? 1 1 1 : 1;
endtable
endprimitive
