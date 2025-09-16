// Source Code : Data Flow Modelling
module halfadder_dataflow(carry, sum, a, b);
    output carry, sum;
    input a, b;

    assign carry = a & b;
    assign sum   = a ^ b;
endmodule
