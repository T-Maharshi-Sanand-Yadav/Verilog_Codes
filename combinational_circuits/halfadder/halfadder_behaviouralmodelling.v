// Source Code : Behavioural Modelling
module halfadder_behavioural(carry, sum, a, b);
    output reg carry, sum;
    input a, b;

    always @(a, b) begin
        carry = a & b;
        sum   = a ^ b;
    end
endmodule
