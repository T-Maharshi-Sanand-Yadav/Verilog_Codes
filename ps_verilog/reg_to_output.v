module reg_to_output (
    input wire clk,
    input wire d,
    output wire out
);
    reg temp;

    always @(posedge clk) begin
        temp <= d;  // Register
    end

    assign out = temp;  // Register to output
endmodule
