Source Code: Gate Level Modelling
  module fullsubtractor(difference,borrow,a,b,bin);
  output difference;
  output borrow;
  input a;
  input b;
  input bin;
  wire w1,w2,w3,w4,w5;
  xor X1(w2,a,b);
  not X2(w1,a);
  and X3(w4,w1,b);
  xor X4(difference,w2,bin);
  not X5(w3,w2);
  and X6(w5,w3,bin);
  or X7(borrow,w5,w4);
  endmodule

Test Bench: Gate Level Modelling
  module fullsubtractor_TB;
    // Inputs
    reg a;
    reg b;
    reg bin;
    // Outputs
    wire difference;
    wire borrow;
    // Instantiation
    fullsubtractor hhh(difference,borrow,a,b,bin);
    initial 
    begin
    $monitor($time,"a=%b,b=%b,bin=%b,difference=%b,borrow=%b",a,b,bin,difference,borrow);
      // Initialize Inputs
      a = 0;
      b = 0;
      bin = 0;
      // Wait 100 ns for global reset to finish
      #100 {a,b,bin}=3'b000;
      #100 {a,b,bin}=3'b001;
      #100 {a,b,bin}=3'b010;
      #100 {a,b,bin}=3'b011;
      #100 {a,b,bin}=3'b100;
      #100 {a,b,bin}=3'b101;
      #100 {a,b,bin}=3'b110;
      #100 {a,b,bin}=3'b111;    
    end      
  endmodule
..................................................................................................................
Source Code: Data Flow Modelling
  module fullsubtractor(difference,borrow,a,b,bin);
  output difference;
  output borrow;
  input a;
  input b;
  input bin;
  assign difference = a ^ b ^ bin;
  assign borrow = ((~a&b)|(~a&bin)|(b&bin));
  endmodule

Test Bench: Data Flow Modelling
..................................................................................................................
Source Code: Behavioural Modelling
  module fullsubtractor(difference,borrow,a,b,bin);
  output difference;
  output borrow;
  input a;
  input b;
  input bin;
  always@(a or b or bin)
  {borrow,difference} = a - b - bin;
  endmodule

Test Bench: Behavioural Modelling
..................................................................................................................
