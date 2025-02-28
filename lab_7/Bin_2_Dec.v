module Bin_2_Dec(
    input clock_100Mhz,          // 100 MHz clock source on Basys 3 FPGA
    input reset,                 // Reset
    input [3:0] switch,          // 4-bit Binary input
    output reg [3:0] Anode_Activate, // Anode signals of the 7-segment LED display
    output reg [6:0] LED_out     // Cathode patterns of the 7-segment LED display
);

    reg Z;
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter;
    wire Digit_activator;

    always @(posedge clock_100Mhz or posedge reset) begin
        if (reset == 1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    assign Digit_activator = refresh_counter[18];

    always @(*) begin
        Z = (switch > 4'b1001) ? 1 : 0;
        case (Digit_activator)
            1'b0: begin
                Anode_Activate = 4'b1101;
                LED_BCD = {3'b000, Z};
            end
            1'b1: begin
                Anode_Activate = 4'b1110;
                if (Z == 1)
                    LED_BCD = switch - 4'b1010;
                else
                    LED_BCD = switch;
            end
        endcase
    end

    // Cathode patterns of the 7-segment LED display
    always @(*) begin
        case (LED_BCD)
            4'b0000: LED_out = 7'b0000001; // "0"
            4'b0001: LED_out = 7'b1001111; // "1"
            4'b0010: LED_out = 7'b0010010; // "2"
            4'b0011: LED_out = 7'b0000110; // "3"
            4'b0100: LED_out = 7'b1001100; // "4"
            4'b0101: LED_out = 7'b0100100; // "5"
            4'b0110: LED_out = 7'b0100000; // "6"
            4'b0111: LED_out = 7'b0001111; // "7"
            4'b1000: LED_out = 7'b0000000; // "8"
            4'b1001: LED_out = 7'b0000100; // "9"
            default: LED_out = 7'b1111111; // "0"
        endcase
    end
endmodule