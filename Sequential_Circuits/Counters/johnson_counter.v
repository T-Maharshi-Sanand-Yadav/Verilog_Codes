// Johnson Counter
// 4-bit Johnson Counter (twisted ring counter)
// Shifts a '1' through the register, then shifts '0's back

module johnson_counter (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    output reg [3:0] count    // 4-bit count output
);

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            count <= 4'b0000;
        else if (reset)
            count <= 4'b0000;
        else
            count <= {~count[3], count[3:1]};  // Rotate right with inverted MSB
    end

endmodule
