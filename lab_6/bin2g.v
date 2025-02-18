module bin2g(b0, b1, b2, g0, g1, g2);
    input b0, b1, b2;
    output g0, g1, g2;
    reg g0, g1, g2;

    always @ (b0, b1, b2) begin
        g0 = exp(b0, b1);
        g1 = exp(b1, b2);
        g2 = exp(0, b2);
    end

    function exp;
        input a, b;
        begin
            exp = a ^ b;
        end
    endfunction
endmodule