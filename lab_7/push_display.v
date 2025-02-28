module button_to_seven_segment(
    input wire [4:0] btn,    // Push buttons: BTNC, BTNU, BTNL, BTNR, BTND
    output reg [6:0] seg,    // Seven segment display cathodes
    output reg [3:0] an      // Seven segment display anodes
);
//                            abcdefg
    localparam P_PATTERN = 7'b0011000; // P pattern for BTNR
    localparam U_PATTERN = 7'b1000001; // U pattern for BTNU
    localparam L_PATTERN = 7'b1110001; // L pattern for BTNL
    localparam D_PATTERN = 7'b1000010; // d pattern for BTND
    localparam C_PATTERN = 7'b0110001; // C pattern for BTNC
    localparam BLANK     = 7'b1111111; // All segments off

    initial begin
        seg = BLANK;
        an = 4'b1110;
    end


    always @(*) begin
        seg = BLANK;

        if (btn[0])      // BTNR
            seg = P_PATTERN;
        else if (btn[1]) // BTNU
            seg = U_PATTERN;
        else if (btn[2]) // BTNL
            seg = L_PATTERN;
        else if (btn[3]) // BTND
            seg = D_PATTERN;
        else if (btn[4]) // BTNC
            seg = C_PATTERN;

        an = 4'b1110;
    end
endmodule