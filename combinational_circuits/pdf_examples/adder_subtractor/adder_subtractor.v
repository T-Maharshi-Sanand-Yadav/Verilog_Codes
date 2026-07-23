// Parameterized adder/subtractor - PDF pages 13-15
module adder_subtractor #(parameter SIZE=4)(input [SIZE-1:0] A,B,input CTRL,output [SIZE-1:0] S,output Cout);
    wire [SIZE-1:0] b_mod = B ^ {SIZE{CTRL}};
    assign {Cout,S} = A + b_mod + CTRL;
endmodule
