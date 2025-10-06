module fullsubtractor_dataflow(borrow, difference, a, b, bin);
    output borrow, difference;
    input a, b, bin;

    assign difference = a ^ b ^ bin;
    assign borrow     = (~a & b) | (~(a ^ b) & bin);
endmodule