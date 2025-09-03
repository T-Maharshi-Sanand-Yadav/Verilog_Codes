// Source Code : Gate Level Modelling
module nand_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    nand x1(y, a, b);
endmodule
