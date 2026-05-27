// BCD Counter (Binary Coded Decimal Counter)
// 8-bit BCD Counter counting from 0 to 99

module bcd_counter (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire enable,        // Counter enable
    output reg [3:0] units,   // Units digit (0-9)
    output reg [3:0] tens     // Tens digit (0-9)
);

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset) begin
            units <= 4'b0000;
            tens <= 4'b0000;
        end
        else if (reset) begin
            units <= 4'b0000;
            tens <= 4'b0000;
        end
        else if (enable) begin
            if (units == 4'd9) begin
                units <= 4'b0000;
                if (tens == 4'd9) begin
                    tens <= 4'b0000;  // Wrap around at 99
                end
                else begin
                    tens <= tens + 1;
                end
            end
            else begin
                units <= units + 1;
            end
        end
    end

endmodule
