module fullsubtractor_behavioural(borrow, difference, a, b, bin);
    output reg borrow, difference;
    input a, b, bin;

    always @(a, b, bin) begin
        {borrow, difference} = a - b - bin;
    end
endmodule