module piso_shift_register(
  input clk, rst, load,
  input [3:0] pi,
  output reg so
);

  reg [3:0] data;

  always @(posedge clk or posedge rst) begin
    if (rst)
      data <= 4'b0000;
    else if (load)
      data <= pi;
    else begin
      so <= data[3];
      data <= {data[2:0], 1'b0};
    end
  end

endmodule
