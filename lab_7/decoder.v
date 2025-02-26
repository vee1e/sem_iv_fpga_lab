module decoder(output [7:0] Y, input [2:0] x, input g1, g2an, g2bn);
    assign Y = (!g1 || g2an || g2bn) ? 8'b11111111 : ~(8'b00000001 << x);
endmodule
