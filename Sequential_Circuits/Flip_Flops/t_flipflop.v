// T Flip-Flop (Toggle Flip-Flop)
// Synchronous T Flip-Flop with clock, reset, and asynchronous reset

module t_flipflop (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire t,             // Toggle input
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
            case (t)
                1'b0: q <= q;         // No change
                1'b1: q <= ~q;        // Toggle
            endcase
        end
    end

endmodule
