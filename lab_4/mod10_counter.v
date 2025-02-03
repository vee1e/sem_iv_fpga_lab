module mod10_cnter(
  input c, r,
  output reg [3:0] cnt
);

  always @(posedge c or posedge r) begin
    if (r)
      cnt <= 4'd0;
    else if (cnt == 4'd9)
      cnt <= 4'd0;
    else
      cnt <= cnt + 1;
  end

endmodule
