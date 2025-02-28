module ALU( input [7:0] A,B,
input [2:0] ALU_Sel,
output [7:0] ALU_Out,
output CarryOut);
reg [7:0] ALU_Result;
wire [8:0] tmp;
assign ALU_Out = ALU_Result;
assign tmp = {1'b0,A} + {1'b0,B};
assign CarryOut = tmp[8];
always @(*)
begin
case(ALU_Sel)
4'b000: // Addition
ALU_Result = A + B ;
4'b001: // Subtraction
ALU_Result = A - B ;
4'b010: // Multiplication
ALU_Result = A * B;
4'b011: // Division
ALU_Result = A/B;
4'b100: // Logical shift left
ALU_Result = A<<1;
4'b101: // Logical shift right
ALU_Result = A>>1;
4'b110: // Rotate left
ALU_Result = {A[6:0],A[7]};
4'b111: // Rotate right
ALU_Result = {A[0],A[7:1]};
default: ALU_Result = A + B ;
endcase
end
// ALU 8-bit Inputs
// ALU Selection
// ALU 8-bit Output
// Carry Out Flag
endmodule
