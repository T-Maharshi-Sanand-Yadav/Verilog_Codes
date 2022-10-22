Source Code : Gate Level Modelling
  module halfsubtractor(difference,borrow,a,b);
  output difference;
  output borrow;
  input a;
  input b;
  wire w1;
  xor X1(difference,a,b);
  not X2(w1,a);
  and X3(borrow,w1,b);
  endmodule

Test Bench : Gate Level Modelling
  module halfsubtractor_TB;
    // Inputs are treated as registers
    reg a;
    reg b;
    // Outputs are treated as wires
    wire difference;
    wire borrow;
    //instantiation
    halfsubtractor hhh(difference,borrow,a,b);
    initial 
    begin
    $monitor($time,"a=%b,b=%b,difference=%b,borrow=%b",a,b,difference,borrow);
      // Initialize Inputs
      a = 0;
      b = 0;
      // Wait 100 ns for global reset to finish
      #100 a=0;
      #100 b=1;
      #100 a=1;
      #100 b=0;
      #100 a=1;
      #100 b=1;
    end  
  endmodule
..................................................................................................................
