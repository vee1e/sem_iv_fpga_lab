module exe_4_msjk_tb;

    reg J, K, clk, reset;
    wire Q, Q_bar;

    exe_4_msjk uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        J = 0;
        K = 0;

        $monitor("At time %0t, J = %b, K = %b, Q = %b, Q_bar = %b", $time, J, K, Q, Q_bar);

        #5 reset = 1;
        #10 reset = 0;

        #5 J = 1; K = 0;
        #10 J = 0; K = 1;
        #10 J = 1; K = 1;
        #10 J = 0; K = 0;

        #20 $finish;
    end

endmodule
