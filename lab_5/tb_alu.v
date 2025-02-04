module tb_alu;
    reg [1:0] opcode;
    reg [3:0] A, B;
    wire [7:0] result;
    alu uut (.opcode(opcode), .A(A), .B(B), .result(result));
    initial begin
        $monitor("opcode=%b A=%d B=%d result=%d", opcode, A, B, result);
        opcode = 2'b00; A = 4'd5; B = 4'd3; #10;
        opcode = 2'b01; A = 4'd2; B = 4'd3; #10;
        opcode = 2'b10; A = 4'd6; B = 4'd2; #10;
        opcode = 2'b10; A = 4'd7; B = 4'd0; #10;
        opcode = 2'b11; A = 4'd8; B = 4'd1; #10;
        $finish;
    end
endmodule
