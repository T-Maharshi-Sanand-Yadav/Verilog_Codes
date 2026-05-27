// Ring Counter
// 4-bit Ring Counter - shifts a single '1' around the register

module ring_counter (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    output reg [3:0] count    // 4-bit count output
);

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            count <= 4'b0001;  // Start with single '1' at LSB
        else if (reset)
            count <= 4'b0001;
        else
            count <= {count[0], count[3:1]};  // Rotate right
    end

endmodule
