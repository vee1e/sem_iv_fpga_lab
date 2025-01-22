module exe_2_mod5_counter;

    reg clk;
    reg reset;
    wire [2:0] count;

    exe_2_mod5_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;

        $monitor("At time %0t, reset = %b, count = %b", $time, reset, count);

        #5 reset = 1;
        #10 reset = 0;

        #50;

        #5 reset = 1;
        #10 reset = 0;

        #50;

        #10 $finish;
    end

endmodule
