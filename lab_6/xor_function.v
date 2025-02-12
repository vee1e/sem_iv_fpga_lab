module xor_module(output out, input a, b);
function xor_out;
input a, b;
begin
xor_out = a ^ b;
end
endfunction

assign out = xor_out(a, b);
endmodule