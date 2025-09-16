module fulladder_behaviouralmodelling(sum, carry, a, b, cin);
  input a, b, cin;
  output reg sum, carry;

  always @(*) begin
    {carry, sum} = a + b + cin;
  end
endmodule
