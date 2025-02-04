module tb_cmos_nand3;
    reg A, B, C;
    wire Y;

    cmos_nand3 uut(Y, A, B, C);

    initial begin
        A=0; B=0; C=0; #10;
        A=0; B=0; C=1; #10;
        A=0; B=1; C=0; #10;
        A=0; B=1; C=1; #10;
        A=1; B=0; C=0; #10;
        A=1; B=0; C=1; #10;
        A=1; B=1; C=0; #10;
        A=1; B=1; C=1; #10;
        $finish;
    end

    initial
        $monitor("Time=%0t A=%b B=%b C=%b | Y=%b", $time, A, B, C, Y);
endmodule

