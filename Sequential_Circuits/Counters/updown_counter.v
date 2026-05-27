// Up/Down Counter
// 4-bit Up/Down Counter with direction control

module updown_counter (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire enable,        // Counter enable
    input wire up_down,       // Direction control (1: up, 0: down)
    output reg [3:0] count    // 4-bit count output
);

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            count <= 4'b0000;
        else if (reset)
            count <= 4'b0000;
        else if (enable) begin
            if (up_down)
                count <= count + 1;   // Count up
            else
                count <= count - 1;   // Count down
        end
    end

endmodule
