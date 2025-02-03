module piso_shift_register(
  input c, r, l,
  input [3:0] pi,
  output reg so
);

  reg [3:0] data;

  always @(posedge c or posedge r) begin
    if (r)
      data <= 4'b0000;
    else if (l)
      data <= pi;
    else begin
      so <= data[3];
      data <= {data[2:0], 1'b0};
    end
  end

endmodule
