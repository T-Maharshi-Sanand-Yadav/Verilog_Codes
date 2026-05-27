// Shift Register SISO (Serial In Serial Out)
// 4-bit Shift Register with serial input and output

module shift_reg_siso (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire serial_in,     // Serial input
    output wire serial_out    // Serial output (MSB)
);

    reg [3:0] shift_reg;

    assign serial_out = shift_reg[3];  // MSB is the output

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            shift_reg <= 4'b0000;
        else if (reset)
            shift_reg <= 4'b0000;
        else
            shift_reg <= {shift_reg[2:0], serial_in};  // Shift left and insert input at LSB
    end

endmodule
