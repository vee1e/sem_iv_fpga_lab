module fencoder_tb();
reg i0,i1,i2,i3;
wire a,b,v;
fencoder uut(i0,i1,i2,i3,a,b,v);

initial begin
i0=0;i1=0;i2=0;i3=0;
#5 i0=1;i1=0;i2=0;i3=0;
#5 i0=0;i1=1;i2=0;i3=0;
#5 i0=0;i1=0;i2=1;i3=0;
#5 i0=0;i1=0;i2=0;i3=1;

end
endmodule
