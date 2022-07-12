Source Code: 1-bit Comparator
  module comparator_1bit(G,E,L,A0,B0);
  //port declaration
  output G,E,L;
  input A0,B0;
  wire w1,w2;
  not x1(w1,A0);
  not x2(w2,B0);
  and x3(L,w1,B0);
  xnor x4(E,A0,B0);
  and x5(G,A0,w2);
  endmodule

Test Bench: 1-bit Comparator
  module comparator_1bit_tb;
    // Inputs
    reg A;
    reg B;
    // Outputs
    wire G;
    wire E;
    wire L;
    // Instantiate the Unit Under Test (UUT)
    comparator_1bit uut (
      .G(G), 
      .E(E), 
      .L(L), 
      .A(A), 
      .B(B)
    );
    initial 
    begin
    $monitor($time,"G=%b,E=%b,L=%b,A=%b,B=%b",G,E,L,A,B);
      // Initialize Inputs
      A = 0;
      B = 0;
    end
    always #10 A = A + 1;
    always #5 B = B + 1;
  endmodule
_____________________________________________________________________________________________________________________________________________________________________
Source Code: 2-bit Comparator

  module comparator_2bit(G,E,L,A,B);
  //port declaration
  output G,E,L;
  input [1:0]A,B;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
  not x1(w1,A[1]);
  not x2(w2,A[0]);
  not x3(w3,B[1]);
  not x4(w4,B[0]);
  and x5(w5,A[0],w3,w4);
  and x6(w6,A[1],w3);
  and x7(w7,A[1],A[0],w4);
  xnor x8(w8,A[0],B[0]);
  xnor x9(w9,A[1],B[1]);
  and x10(w10,w1,w2,B[0]);
  and x11(w11,w2,B[1],B[0]);
  and x12(w12,w1,B[1]);
  or x13(G,w5,w6,w7);
  and x14(E,w8,w9);
  or x15(L,w10,w11,w12);
  endmodule

Test Bench: 2-bit Comparator
  module comparator_2bit_tb;
    // Inputs
    reg [1:0] A;
    reg [1:0] B;
    // Outputs
    wire G;
    wire E;
    wire L;
    // Instantiate the Unit Under Test (UUT)
    comparator_2bit uut (
      .G(G), 
      .E(E), 
      .L(L), 
      .A(A), 
      .B(B)
    );
    initial 
    begin
    $monitor($time,"A=%b,B=%b,G=%b,E=%b,L=%b",A,B,G,E,L);
      // Initialize Inputs
      A = 0;
      B = 0;	
    end
    always #20 A=A+1;
    always #5 B=B+1;      
  endmodule

