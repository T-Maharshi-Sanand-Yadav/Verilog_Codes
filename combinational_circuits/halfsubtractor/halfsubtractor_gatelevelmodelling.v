module halfsubtractor_gatelevel(borrow, difference, a, b);
    output borrow, difference;
    input a, b;

    xor g1(difference, a, b);
    and g2(borrow, ~a, b);
endmodule