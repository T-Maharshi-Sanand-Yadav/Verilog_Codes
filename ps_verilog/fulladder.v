module fulladder (carry,sum,a,b,cin);
    output sum, carry;
    input a, b, cin;
    wire w1, w2, w3;
    xor x1(w1, a, b);
    and x2(w2, a, b);
    xor x3(sum, w1, cin);
    and x4(w3, w1, cin);
    or x5(carry, w2, w3);
endmodule

