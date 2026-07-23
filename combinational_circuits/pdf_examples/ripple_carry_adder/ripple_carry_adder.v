// Ripple Carry Adder - adapted from PDF pages 11-12
module rca_full_adder(input a,b,cin, output sum,cout);
    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
module ripple_carry_adder #(parameter SIZE=4)(input [SIZE-1:0] A,B,input Cin,output [SIZE-1:0] S,output [SIZE-1:0] Cout);
    genvar g;
    rca_full_adder fa0(A[0],B[0],Cin,S[0],Cout[0]);
    generate for(g=1;g<SIZE;g=g+1) begin: GEN_FA
        rca_full_adder fa(A[g],B[g],Cout[g-1],S[g],Cout[g]);
    end endgenerate
endmodule
