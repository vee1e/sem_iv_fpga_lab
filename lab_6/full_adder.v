module full_adder(output sum, cout, input a, b, cin);
reg temp_sum1, temp_sum2;
reg temp_carry1, temp_carry2;

task half_adder;
input x, y;
output s, c;
begin
s = x ^ y;
c = x & y;
end
endtask

always @(*) begin
half_adder(a, b, temp_sum1, temp_carry1);
half_adder(temp_sum1, cin, temp_sum2, temp_carry2);
end

assign sum = temp_sum2;
assign cout = temp_carry1 | temp_carry2;

endmodule