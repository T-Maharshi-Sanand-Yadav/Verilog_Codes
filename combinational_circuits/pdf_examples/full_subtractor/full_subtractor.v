// Full Subtractor
// Source: Verilog Coding Examples PDF, pages 9-10
module full_subtractor(
    input  wire a,
    input  wire b,
    input  wire bin,
    output wire difference,
    output wire bout
);
    assign difference = a ^ b ^ bin;
    assign bout       = ((~a) & b) | (~(a ^ b) & bin);
endmodule
