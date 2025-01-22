module exe_6_actel(
    input i1, i2, i3, i4, i5, i6, i7, i8,
    output f
);
    wire and_out;
    wire mux1_out, mux2_out;

    assign and_out = i1 & i2;
    assign mux1_out = i3 ? i4 : i5;
    assign mux2_out = i6 ? i7 : i8;
    assign f = mux1_out ? and_out : mux2_out;
endmodule
