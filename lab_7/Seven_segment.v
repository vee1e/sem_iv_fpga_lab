module Seven_segment(
    input clock_100Mhz,          // 100 MHz clock source on Basys 3 FPGA
    input reset,                 // Reset
    input [15:0] switch,         // Binary input
    output reg [3:0] Anode_Activate, // Anode signals of 7-segment LED display
    output reg [6:0] LED_out     // Cathode patterns of the 7-segment LED display
);

    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter;
    wire [1:0] Digit_activator;

    always @(posedge clock_100Mhz or posedge reset) begin
        if (reset == 1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end

    assign Digit_activator = refresh_counter[19:18];

    always @(*) begin
        case (Digit_activator)
            2'b00: begin
                Anode_Activate = 4'b0111;  // Activate display1 and deactivate display2, 3, 4
                LED_BCD = switch[15:12];   // The first digit of the 16-bit number
            end
            2'b01: begin
                Anode_Activate = 4'b1011;  // Activate display2 and deactivate display1, 3, 4
                LED_BCD = switch[11:8];    // The second digit of the 16-bit number
            end
            2'b10: begin
                Anode_Activate = 4'b1101;  // Activate display3 and deactivate display2, 1, 4
                LED_BCD = switch[7:4];     // The third digit of the 16-bit number
            end
            2'b11: begin
                Anode_Activate = 4'b1110;  // Activate LED4 and deactivate LED2, LED3, LED1
                LED_BCD = switch[3:0];     // The fourth digit of the 16-bit number
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
            4'b1010: LED_out = 7'b0001000; // "A"
            4'b1011: LED_out = 7'b1100000; // "b"
            4'b1100: LED_out = 7'b0110001; // "C"
            4'b1101: LED_out = 7'b1000010; // "d"
            4'b1110: LED_out = 7'b0110000; // "E"
            4'b1111: LED_out = 7'b0111000; // "F"
            default: LED_out = 7'b1111111;
        endcase
    end
endmodule