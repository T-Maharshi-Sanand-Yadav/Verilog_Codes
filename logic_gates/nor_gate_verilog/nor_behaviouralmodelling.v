module nor_behaviouralmodelling(y, a, b);
  output reg y;
  input a, b;

  always @(a or b)
    y = ~(a | b);
endmodule
