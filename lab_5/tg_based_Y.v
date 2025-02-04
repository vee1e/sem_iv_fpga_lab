module tg_based_Y (
    input A, B, C, D,
    output Y
);
    wire AB, CD, OR_AB_CD;

    and_tg and1 (AB, A, B);
    and_tg and2 (CD, C, D);

    or_tg or1 (OR_AB_CD, AB, CD);

    not_tg not1 (Y, OR_AB_CD);

endmodule

module and_tg(output Y, input A, B);
    wire nA;
    not(nA, A);
    pmos(Y, 1'b0, A);
    nmos(Y, B, nA);
endmodule

module or_tg(output Y, input A, B);
    wire nB;
    not(nB, B);
    pmos(Y, 1'b1, A);
    nmos(Y, B, nB);
endmodule

module not_tg(output Y, input A);
    wire nA;
    pmos(Y, 1'b1, A);
    nmos(Y, 1'b0, A);
endmodule

