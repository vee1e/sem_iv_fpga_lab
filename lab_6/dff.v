primitive dff_udp(q, d, clk, rst);
output q;
input d, clk, rst;
reg q;
table
// d  clk  rst  :  q  :  q+
   0   0    0   :  ?  :  -;
   1   0    0   :  ?  :  -;
   ?   1    0   :  ?  :  -;
   0   (01) 0   :  ?  :  0;
   1   (01) 0   :  ?  :  1;
   ?   ?    1   :  ?  :  0;
endtable
endprimitive

module dff(q, d, clk, rst);
output q;
input d, clk, rst;
dff_udp dff1(q, d, clk, rst);
endmodule