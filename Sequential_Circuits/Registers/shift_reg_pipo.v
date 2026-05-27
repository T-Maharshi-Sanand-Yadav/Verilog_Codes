// Shift Register PIPO (Parallel In Parallel Out)
// 4-bit Shift/Load Register with parallel input and output

module shift_reg_pipo (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire load,          // Load control (1: load parallel data, 0: shift)
    input wire serial_in,     // Serial input (when shifting)
    input wire [3:0] parallel_in,  // Parallel input data
    output wire [3:0] parallel_out // Parallel output data
);

    reg [3:0] shift_reg;

    assign parallel_out = shift_reg;

    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            shift_reg <= 4'b0000;
        else if (reset)
            shift_reg <= 4'b0000;
        else if (load)
            shift_reg <= parallel_in;  // Load parallel data
        else
            shift_reg <= {shift_reg[2:0], serial_in};  // Shift operation
    end

endmodule
