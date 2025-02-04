module tb_gate_based_Y;
    reg A, B, C, D;
    wire Y;

    gate_based_Y uut (
        .A(A), .B(B), .C(C), .D(D), .Y(Y)
    );

    initial begin
        $display("A B C D | Y");
        $monitor("%b %b %b %b | %b", A, B, C, D, Y);

        for (integer i = 0; i < 16; i = i + 1) begin
            {A, B, C, D} = i;
        end

        #10 $finish;
    end
endmodule
