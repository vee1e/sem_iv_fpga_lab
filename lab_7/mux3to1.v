module mux2to1(output wire Y, input wire A, B, S);
    wire nS, aA, aB;
    not (nS, S);
    and (aA, A, nS);
    and (aB, B, S);
    or  (Y, aA, aB);
endmodule

module mux3to1(input [2:0] I, input [1:0] S, output Y);
    wire M1, M2;
    mux2to1 mux1(.A(I[0]), .B(I[1]), .S(S[0]), .Y(M1));
    mux2to1 mux2(.A(I[2]), .B(1'b0), .S(S[0]), .Y(M2));
    mux2to1 mux3(.A(M1), .B(M2), .S(S[1]), .Y(Y));
endmodule