// SR Flip-Flop (Set-Reset Flip-Flop)
// Synchronous SR Flip-Flop with clock, reset, and asynchronous reset

module sr_flipflop (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire s,             // Set input
    input wire r,             // Reset input
    output reg q,             // Output Q
    output wire q_bar         // Output Q_bar (inverted)
);

    assign q_bar = ~q;

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            q <= 1'b0;
        else if (reset)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;        // No change
                2'b01: q <= 1'b0;     // Reset
                2'b10: q <= 1'b1;     // Set
                2'b11: q <= 1'bx;     // Undefined (invalid state)
            endcase
        end
    end

endmodule
