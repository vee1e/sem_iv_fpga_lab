module gate_based_Y (input A, B, C, D, output Y);
    wire AB, CD, OR_AB_CD;

    and u1 (AB, A, B);
    and u2 (CD, C, D);
    or  u3 (OR_AB_CD, AB, CD);
    not u4 (Y, OR_AB_CD);

endmodule
