module exe_6_actel_tb;
    reg i1, i2, i3, i4, i5, i6, i7, i8;
    wire f;

    exe_6_actel uut(
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .i4(i4),
        .i5(i5),
        .i6(i6),
        .i7(i7),
        .i8(i8),
        .f(f)
    );

    initial begin
        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b00000000;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b11000000;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b11100100;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b10101000;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b11000110;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b11000011;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        {i1, i2, i3, i4, i5, i6, i7, i8} = 8'b11111111;
        #10 $display("Inputs: %b, Output f: %b", {i1, i2, i3, i4, i5, i6, i7, i8}, f);

        $stop;
    end
endmodule
