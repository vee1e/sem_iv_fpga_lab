module exe_1_nbit_add (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output reg [3:0] Sum,
    output reg Cout
);
    integer i;
    reg [4:0] carry;

    always @ (A or B or Cin) begin
        carry[0] = Cin;
        for (i = 0; i < 4; i = i + 1) begin
            Sum[i] = A[i] ^ B[i] ^ carry[i];
            carry[i+1] = (A[i] & B[i]) | (A[i] & carry[i]) | (B[i] & carry[i]);
        end
        Cout = carry[4];
    end
endmodule
