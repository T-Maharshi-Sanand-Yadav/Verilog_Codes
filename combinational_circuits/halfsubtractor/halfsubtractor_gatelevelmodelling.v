module halfsubtractor_gatelevel(borrow, difference, a, b);
    output borrow, difference;
    input a, b;
    wire a_bar;
    xor x1(difference, a, b);
    not n1(a_bar, a);
    and x2(borrow, a_bar, b);
endmodule