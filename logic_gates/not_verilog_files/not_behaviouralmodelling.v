// Source Code : Behavioural Modelling
module not_behaviouralmodelling(y, a);
    output y;
    input a;
    reg y;
    always @(a)
        y = ~a;
endmodule
