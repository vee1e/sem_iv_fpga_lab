module exa_3_melfsm(din, reset, clk, y);
    input din;
    input clk;
    input reset;
    output reg y;
    reg [1:0] cst, nst;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    always @(cst or din) begin
        case (cst)
            S0: begin
                if (din == 1'b1) begin
                    nst = S1;
                    y = 1'b0;
                end else begin
                    nst = cst;
                    y = 1'b0;
                end
            end

            S1: begin
                if (din == 1'b0) begin
                    nst = S2;
                    y = 1'b0;
                end else begin
                    nst = cst;
                    y = 1'b0;
                end
            end

            S2: begin
                if (din == 1'b1) begin
                    nst = S3;
                    y = 1'b0;
                end else begin
                    nst = S0;
                    y = 1'b0;
                end
            end

            S3: begin
                if (din == 1'b0) begin
                    nst = S2;
                    y = 1'b1;
                end else begin
                    nst = S1;
                    y = 1'b0;
                end
            end

            default: begin
                nst = S0;
                y = 1'b0;
            end
        endcase
    end

    always @(posedge clk) begin
        if (reset)
            cst <= S0;
        else
            cst <= nst;
    end

endmodule
