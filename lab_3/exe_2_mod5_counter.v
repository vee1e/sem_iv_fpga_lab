module exe_2_mod5_counter (
    input clk,
    input reset,
    output reg [2:0] count
);

always @(posedge clk) begin
    if (reset) begin
        count <= 3'b000;
    end else begin
        if (count == 3'b100) begin
            count <= 3'b000;
        end else begin
            count <= count + 1;
        end
    end
end

endmodule
