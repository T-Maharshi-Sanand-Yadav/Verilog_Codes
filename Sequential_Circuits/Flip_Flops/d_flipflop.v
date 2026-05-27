// D Flip-Flop (Data Flip-Flop)
// Synchronous D Flip-Flop with clock, reset, and asynchronous reset

module d_flipflop (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire d,             // Data input
    output reg q,             // Output Q
    output wire q_bar         // Output Q_bar (inverted)
);

    assign q_bar = ~q;

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            q <= 1'b0;
        else if (reset)
            q <= 1'b0;
        else
            q <= d;               // Data input transfers to Q on clock edge
    end

endmodule
