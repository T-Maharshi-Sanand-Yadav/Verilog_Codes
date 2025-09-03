// Source Code : Behavioural Modelling
module nand_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = ~(a & b);
endmodule
