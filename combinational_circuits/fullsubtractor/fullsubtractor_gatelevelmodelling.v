module fullsubtractor_gatelevel(borrow, difference, a, b, bin);
    output borrow, difference;
    input a, b, bin;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(difference, w1, bin);

    and a1(w2, ~a, b);
    and a2(w3, ~w1, bin);
    or  o1(borrow, w2, w3);
endmodule