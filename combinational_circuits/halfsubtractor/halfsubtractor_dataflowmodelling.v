module halfsubtractor_dataflow(borrow, difference, a, b);
    output borrow, difference;
    input a, b;

    assign difference = a ^ b;
    assign borrow     = (~a) & b;
endmodule