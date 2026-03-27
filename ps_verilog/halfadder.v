module halfadder(carry,sum,a,b);
  output carry,sum;
  input a,b;
  xor x1(sum,a,b);
  and x2(carry,a,b);
endmodule

