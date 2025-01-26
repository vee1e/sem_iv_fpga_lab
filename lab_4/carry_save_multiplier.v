module carry_save_multiplier(
  input [3:0] a, b,
  output [7:0] product
);

  wire [3:0] pp0, pp1, pp2, pp3;
  wire [4:0] s1, s2, s3;
  wire [4:0] c1, c2, c3;

  assign pp0 = a[0] ? b : 4'b0000;
  assign pp1 = a[1] ? {b, 1'b0} : 5'b00000;
  assign pp2 = a[2] ? {b, 2'b00} : 6'b000000;
  assign pp3 = a[3] ? {b, 3'b000} : 7'b0000000;

  csa_adder csa1(pp0, pp1[4:1], pp2[4:1], s1, c1);
  csa_adder csa2(s1[4:1], c1[3:0], pp3[4:1], s2, c2);
  csa_adder csa3(s2[4:1], c2[3:0], {1'b0, pp3[6:4]}, s3, c3);

  assign product = {s3, s2[0], s1[0], pp0[0]};

endmodule

module csa_adder(
  input [3:0] a, b, c,
  output [4:0] sum,
  output [3:0] carry
);

  assign sum = a ^ b ^ c;
  assign carry = (a & b) | (b & c) | (c & a);

endmodule
