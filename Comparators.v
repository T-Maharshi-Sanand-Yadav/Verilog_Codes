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
_____________________________________________________________________________________________________________________________________________________________________
Source Code: 4-bit Comparator
  module comparator_4_bit(g,e,l,a,b);
  output g,e,l;
  input [3:0] a,b;
  wire [3:0] abar,bbar;
  wire [46:1] w;
  not n1(abar[3],a[3]);
  not n2(abar[2],a[2]);
  not n3(abar[1],a[1]);
  not n4(abar[0],a[0]);
  not n5(bbar[3],b[3]);
  not n6(bbar[2],b[2]);
  not n7(bbar[1],b[1]);
  not n8(bbar[0],b[0]);
  and x1(w[1],bbar[3],a[0],bbar[2],bbar[1],bbar[0]);
  and x2(w[2],bbar[3],a[1],bbar[2],bbar[1]);
  and x3(w[3],a[0],a[1],bbar[3],b[2],bbar[0]);
  and x4(w[4],a[2],bbar[3],bbar[2]);
  and x5(w[5],a[0],a[2],bbar[3],bbar[1],bbar[0]);
  and x6(w[6],a[1],a[2],bbar[3],bbar[1]);
  and x7(w[7],a[1],a[2],a[0],bbar[3],bbar[0]);
  and x8(w[8],a[3],bbar[3]);
  and x9(w[9],a[0],a[3],bbar[2],bbar[1],bbar[0]);
  and x10(w[10],a[1],a[3],bbar[2],bbar[1]);
  and x11(w[11],a[1],a[3],a[0],bbar[2],bbar[0]);
  and x12(w[12],a[3],a[2],bbar[2]);
  and x13(w[13],a[2],a[3],a[0],bbar[1],bbar[0]);
  and x14(w[14],a[2],a[3],a[1],bbar[1]);
  and x15(w[15],a[2],a[3],a[1],a[0],bbar[0]);
  and y1(w[16],abar[0],abar[1],abar[2],abar[3],bbar[3],bbar[2],bbar[1],bbar[0]);
  and y2(w[17],a[0],abar[1],abar[2],abar[3],bbar[3],bbar[2],bbar[1],b[0]);
  and y3(w[18],abar[0],a[1],abar[2],abar[3],bbar[3],bbar[2],b[1],bbar[0]);
  and y4(w[19],a[0],a[1],abar[2],abar[3],bbar[3],bbar[2],b[1],b[0]);
  and y5(w[20],abar[0],abar[1],a[2],abar[3],bbar[3],b[2],bbar[1],b[0]);
  and y6(w[21],a[0],abar[1],a[2],abar[3],bbar[3],b[2],bbar[1],b[0]);
  and y7(w[22],abar[0],a[1],a[2],abar[3],bbar[3],b[2],b[1],bbar[0]);
  and y8(w[23],a[0],a[1],a[2],abar[3],bbar[3],b[2],b[1],b[0]);
  and y9(w[24],abar[0],abar[1],abar[2],a[3],b[3],b[2],bbar[1],bbar[0]);
  and y10(w[25],a[0],abar[1],abar[2],a[3],b[3],b[2],bbar[1],b[0]);
  and y11(w[26],abar[0],a[1],abar[2],a[3],b[3],bbar[2],b[1],bbar[0]);
  and y12(w[27],a[0],a[1],abar[2],a[3],b[3],b[2],b[1],b[0]);
  and y13(w[28],abar[0],abar[1],a[2],a[3],b[3],b[2],bbar[1],bbar[0]);
  and y14(w[29],a[0],abar[1],a[2],a[3],b[3],b[2],bbar[1],b[0]);
  and y15(w[30],abar[0],a[1],a[2],a[3],b[3],b[2],b[1],bbar[0]);
  and y16(w[31],a[0],a[1],a[2],a[3],b[3],b[2],b[1],b[0]);
  and z1(w[32],abar[2],abar[3],abar[1],abar[0],b[0]);
  and z2(w[33],abar[2],abar[3],abar[1],b[1]);
  and z3(w[34],abar[3],abar[2],b[2]);
  and z4(w[35],abar[3],b[3]);
  and z5(w[36],abar[2],abar[3],abar[0],b[1],b[0]);
  and z6(w[37],abar[1],abar[3],abar[0],b[2],b[0]);
  and z7(w[38],abar[1],abar[3],b[2],b[1]);
  and z8(w[39],abar[0],abar[3],b[2],b[1],b[0]);
  and z9(w[40],abar[1],abar[2],abar[0],b[3],b[0]);
  and z10(w[41],abar[1],abar[2],b[3],b[1]);
  and z11(w[42],abar[2],b[3],b[2]);
  and z12(w[43],abar[0],abar[2],b[3],b[1],b[0]);
  and z13(w[44],abar[0],abar[1],b[3],b[2],b[0]);
  and z14(w[45],b[3],abar[1],b[2],b[1]);
  and z15(w[46],b[3],abar[0],b[2],b[1],b[0]);
  or o1(g,w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8],w[9],w[10],w[11],w[12],w[13],w[14],w[15]);
  or o2(e,w[16],w[17],w[18],w[19],w[20],w[21],w[22],w[23],w[24],w[25],w[26],w[27],w[28],w[29],w[30],w[31]);
  or o3(l,w[32],w[33],w[34],w[35],w[36],w[37],w[38],w[39],w[40],w[41],w[42],w[43],w[44],w[45],w[46]);
  endmodule

Test Bench: 4-bit Comparator
  module comparator_4_bit_tb;
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    // Outputs
    wire g;
    wire e;
    wire l;
    // Instantiate the Unit Under Test (UUT)
    comparator_4_bit uut (
      .g(g), 
      .e(e), 
      .l(l), 
      .a(a), 
      .b(b)
    );
    initial
    begin
    $monitor($time,"g=%b,e=%b,l=%b,a=%b,b=%b",g,e,l,a,b);
      // Initialize Inputs
      a = 0;
      b = 0;
      end
      always #10 a=a+1;
      always #5 b=b+1;
  endmodule
_____________________________________________________________________________________________________________________________________________________________________
Source Code: 2-bit Comparator using 1-bit Comparator
  module comparator_2bit_using_1bit(G,E,L,A,B);
  //port declaration
  output G,E,L;
  input [1:0]A,B;
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  and x1(w7,w2,w4);
  and x2(E,w5,w2);
  and x3(w8,w2,w6);
  or x4(G,w1,w7);
  or x5(L,w3,w8);
  comparator_1bit x6(w1,w2,w3,A[1],B[1]);
  comparator_1bit x7(w4,w5,w6,A[0],B[0]);
  endmodule

Test Bench: 2-bit Comparator using 1-bit Comparator
  module comparator_2bit_using_1bit_tb;
    // Inputs
    reg [1:0] A;
    reg [1:0] B;
    // Outputs
    wire g2;
    wire e2;
    wire l2;
    // Instantiate the Unit Under Test (UUT)
    comparator_2bit_using_1bit uut (
      .g2(g2), 
      .e2(e2), 
      .l2(l2), 
      .A(A), 
      .B(B)
    );
    initial 
    begin
    $monitor($time,"g2=%b,e2=%b,l2=%b,A=%b,B=%b",g2,e2,l2,A,B);
      // Initialize Inputs
      A = 0;
      B = 0;
    end
      always #10 A = A + 1;
      always #5 B = B + 1;
  endmodule
_____________________________________________________________________________________________________________________________________________________________________
Source Code: 4-bit Comparator using 2-bit Comparator
  module comparator4bit_using_2bit(G,E,L,A,B);
  //port declaration
  output G,E,L;
  input [3:0]A,B;
  wire w1,w2,w3,w4,w5,w6,w7,w8;
  comparator_2bit Comp1(w1,w2,w3,A[3:2],B[3:2]);
  comparator_2bit Comp2(w4,w5,w6,A[1:0],B[1:0]);
  and x1(w7,w4,w2);
  and x2(E,w2,w5);
  and x3(w8,w2,w6);
  or x4(G,w1,w7);
  or x5(L,w8,w3);
  endmodule

Test Bench: 4-bit Comparator using 2-bit Comparator
  module comparator4bit_using_2bit_tb;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    // Outputs
    wire G;
    wire E;
    wire L;
    // Instantiate the Unit Under Test (UUT)
    comparator4bit_using_2bit uut (
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
