module exa_4_ringcounter(q, clk, clr);
    input clk, clr;
    output [3:0] q;
    reg [3:0] q;

    always @(posedge clk)
    begin
        if(clr == 1)
            q <= 4'b1000;
        else
        begin
            q[3] <= q[0];
            q[2] <= q[3];
            q[1] <= q[2];
            q[0] <= q[1];
        end
    end
endmodule
