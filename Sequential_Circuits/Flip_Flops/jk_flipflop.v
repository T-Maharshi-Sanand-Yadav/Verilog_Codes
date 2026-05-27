// JK Flip-Flop (Jack-Kilby Flip-Flop)
// Synchronous JK Flip-Flop with clock, reset, and asynchronous reset

module jk_flipflop (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire j,             // Jack input
    input wire k,             // Kilby input
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
            case ({j, k})
                2'b00: q <= q;        // No change
                2'b01: q <= 1'b0;     // Reset
                2'b10: q <= 1'b1;     // Set
                2'b11: q <= ~q;       // Toggle
            endcase
        end
    end

endmodule
