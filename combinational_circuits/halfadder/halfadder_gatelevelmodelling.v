// Source Code : Gate Level Modelling
module halfadder_gatelevel(carry, sum, a, b);
    output carry, sum;
    input a, b;

    and a1(carry, a, b);
    xor x1(sum, a, b);
endmodule
