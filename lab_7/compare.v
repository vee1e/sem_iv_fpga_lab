module compare(input [1:0] A, B, output reg AgB, AeB, AlB);
    always @(*) begin
        AgB = 0;
        AlB = 0;
        AeB = 0;
        if (A > B)
            AgB = 1;
        else if (A == B)
            AeB = 1;
        else
            AlB = 1;
    end
endmodule