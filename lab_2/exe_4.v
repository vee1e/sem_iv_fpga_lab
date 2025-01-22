module fencoder(i0,i1,i2,i3,a,b,v);
input i0,i1,i2,i3;
output a,b,v;
assign a=i3|i2;
assign b=i3|(~i2&i1);
assign v=i3|i2|i1|i0;

endmodule
