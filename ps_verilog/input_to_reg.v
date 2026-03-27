module input_to_reg (
    input wire IN,
    input wire CLK,
    output wire OUT
);

    wire buf_out;

    // Buffer (simply passes the signal through)
    assign buf_out = IN;

    // D Flip-Flop
    reg Q1;
    always @(posedge CLK) begin
        Q1 <= buf_out;
    end

    assign OUT = Q1;

endmodule
