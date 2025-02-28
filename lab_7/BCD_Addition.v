module BCD_Addition(
    input clock_100Mhz,          // 100 MHz clock source on Basys 3 FPGA
    input reset,                 // Reset
    input [3:0] a, b,           // Two BCD inputs
    input carry_in,              // Initial carry
    output reg [3:0] Anode_Activate, // Anode signals of the 7-segment LED display
    output reg [6:0] LED_out     // Cathode patterns of the 7-segment LED display
);
    reg [3:0] sum;
    reg carry;
    reg bin_carry;
    reg [3:0] bin_sum;
    reg [3:0] LED_BCD;
    reg [19:0] refresh_counter;
    wire [1:0] Digit_activator;

    always @(a, b, carry_in) begin
        {bin_carry, bin_sum} = a + b + carry_in; // Add all the inputs
        if (bin_sum > 9) begin
            carry = 1;              // Set the carry output
            sum = bin_sum + 6;     // Add 6 if result is more than 9
        end else begin
            carry = 0;
            sum = bin_sum[3:0];
        end
    end

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
                Anode_Activate = 4'b1110;
                LED_BCD = sum;
            end
            2'b01: begin
                Anode_Activate = 4'b1101;
                LED_BCD = {3'b000, carry};
            end
            2'b10: begin
                Anode_Activate = 4'b1011;
                LED_BCD = bin_sum;
            end
            2'b11: begin
                Anode_Activate = 4'b0111;
                LED_BCD = {3'b000, bin_carry};
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
            default: LED_out = 7'b1111111; // "0"
        endcase
    end
endmodule