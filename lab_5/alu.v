module alu(
    input [1:0] opcode,
    input [3:0] A, B,
    output reg [7:0] result
);
    wire [3:0] sum;
    wire cout;
    cla_adder adder (.A(A), .B(B), .cin(1'b0), .sum(sum), .cout(cout));
    always @(*) begin
        case (opcode)
            2'b00: result = {3'b000, cout, sum};
            2'b01: result = A * B;
            2'b10: result = (B != 0) ? A / B : 8'b00000000;
            2'b11: result = 8'b00000000;
        endcase
    end
endmodule

module cla_adder(
    input [3:0] A, B,
    input cin,
    output [3:0] sum,
    output cout
);
    wire [3:0] P, G, C;
    assign P = A ^ B;
    assign G = A & B;
    assign C[0] = cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign cout = G[3] | (P[3] & C[3]);
    assign sum = P ^ C;
endmodule
