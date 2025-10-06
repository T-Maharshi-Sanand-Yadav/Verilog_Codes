module fulladder_dataflow(carry, sum, a, b, cin);
    output carry, sum;
    input a, b, cin;

    assign sum   = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule