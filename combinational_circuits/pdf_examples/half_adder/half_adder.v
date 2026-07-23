// Half Adder
// Source: Verilog Coding Examples PDF, pages 2-3
module half_adder(
    input  wire a,
    input  wire b,
    output wire s,
    output wire cout
);
    assign s    = a ^ b;
    assign cout = a & b;
endmodule
