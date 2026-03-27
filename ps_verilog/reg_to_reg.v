module reg_to_reg (
    input wire clk,
    input wire d,
    output reg q
);
    reg temp;

    always @(posedge clk) begin
        temp <= d;   // Register 1
        q    <= temp; // Register 2
    end
endmodule
