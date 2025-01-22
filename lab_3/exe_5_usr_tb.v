module exe_5_usr_tb;

    reg [3:0] D;
    reg [3:0] S;
    reg clk, reset, shift_left, shift_right, parallel_load;
    wire [3:0] Q;

    universal_shift_register uut (
        .D(D),
        .S(S),
        .clk(clk),
        .reset(reset),
        .shift_left(shift_left),
        .shift_right(shift_right),
        .parallel_load(parallel_load),
        .Q(Q)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 0;
        shift_left = 0;
        shift_right = 0;
        parallel_load = 0;
        D = 4'b1010;
        S = 4'b1111;

        $monitor("At time %0t, Q = %b", $time, Q);

        #5 reset = 1;
        #10 reset = 0;

        #5 parallel_load = 1;
        #10 parallel_load = 0;

        #5 shift_left = 1;
        #10 shift_left = 0;

        #5 shift_right = 1;
        #10 shift_right = 0;

        #20 $finish;
    end

endmodule
