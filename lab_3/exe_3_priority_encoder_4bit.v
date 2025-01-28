module exe_3_priority_encoder_4bit (
    input [3:0] in,
    input clk,
    input reset,
    output reg [1:0] out,
    output reg valid
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            out <= 2'b00;
            valid <= 1'b0;
        end else begin
            if (in[3]) begin
                out <= 2'b11;
                valid <= 1'b1;
            end else if (in[2]) begin
                out <= 2'b10;
                valid <= 1'b1;
            end else if (in[1]) begin
                out <= 2'b01;
                valid <= 1'b1;
            end else if (in[0]) begin
                out <= 2'b00;
                valid <= 1'b1;
            end else begin
                out <= 2'b00;
                valid <= 1'b0;
            end
        end
    end

endmodule
