module universal_shift_register (
    input [3:0] D,        // Data input
    input [3:0] S,        // Shift input
    input clk,            // Clock input
    input reset,          // Reset input
    input shift_left,     // Shift left control
    input shift_right,    // Shift right control
    input parallel_load,  // Parallel load control
    output reg [3:0] Q    // 4-bit register output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 4'b0000;
        end else begin
            if (parallel_load) begin
                Q <= D;
            end else if (shift_left) begin
                Q <= {Q[2:0], 1'b0};
            end else if (shift_right) begin
                Q <= {1'b0, Q[3:1]};
            end
        end
    end

endmodule
