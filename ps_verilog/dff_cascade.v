module dff_cascade (
    input clk,       // Clock signal
    input rst,       // Active high reset
    input d_in,      // Data input
    output q_out     // Output of the second DFF
);
    reg q1, q2;      // Internal flip-flop states

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q1 <= 1'b0;  // Reset both flip-flops
            q2 <= 1'b0;
        end else begin
            q1 <= d_in;  // First DFF captures the input
            q2 <= q1;    // Second DFF captures the output of the first
        end
    end

    assign q_out = q2; // Output of the second DFF

endmodule
