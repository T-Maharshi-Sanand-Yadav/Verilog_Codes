`timescale 1ns/1ps
module half_adder_tb;
    reg a, b;
    wire s, cout;

    half_adder dut (.a(a), .b(b), .s(s), .cout(cout));

    initial begin
        $monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b", $time, a, b, s, cout);
        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
        $finish;
    end
endmodule
