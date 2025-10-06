module fulladder_behavioural(carry, sum, a, b, cin);
    output reg carry, sum;
    input a, b, cin;

    always @(a, b, cin) begin
        {carry, sum} = a + b + cin;
    end
endmodule