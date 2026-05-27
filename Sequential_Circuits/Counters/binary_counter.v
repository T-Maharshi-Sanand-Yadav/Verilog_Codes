// Binary Counter
// 4-bit Binary Counter with synchronous reset and enable

module binary_counter (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire enable,        // Counter enable
    output reg [3:0] count    // 4-bit count output
);

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            count <= 4'b0000;
        else if (reset)
            count <= 4'b0000;
        else if (enable)
            count <= count + 1;  // Increment on clock pulse
    end

endmodule
