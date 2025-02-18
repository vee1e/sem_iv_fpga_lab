module exa_4_ring_tb;
// Inputs
reg clk;
reg clr;
// Outputs
wire [3:0] q;
// Instantiate the Unit Under Test (UUT)
exa_4_ringcounter uut (
.q(q),
.clk(clk),
.clr(clr)
);
always
begin
#50 clk=1'b1;
#50 clk=1'b0;
end
initial
begin
// Initialize Inputs
clk = 0;
clr = 0;
#50 clr = 1'b1;
#100 clr = 1'b0;
// Wait 100 ns for global reset to finish
#100;
end
endmodule