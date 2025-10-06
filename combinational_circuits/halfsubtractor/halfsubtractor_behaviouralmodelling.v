module halfsubtractor_behavioural(borrow, difference, a, b);
    output reg borrow, difference;
    input a, b;

    always @(a, b) begin
        difference = a ^ b;
        borrow     = (~a) & b;
    end
endmodule