// Half Subtractor
// Source: Verilog Coding Examples PDF, pages 7-8
module half_subtractor(
    input  wire a,
    input  wire b,
    output wire difference,
    output wire borrow
);
    assign difference = a ^ b;
    assign borrow     = (~a) & b;
endmodule
