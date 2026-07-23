`timescale 1ns/1ps
module full_adder_tb;
    reg a, b, cin;
    wire s, cout;

    full_adder dut (.a(a), .b(b), .cin(cin), .s(s), .cout(cout));

    initial begin
        $monitor("At time %0t: a=%b b=%b cin=%b, sum=%b, carry=%b", $time, a, b, cin, s, cout);
        a=0; b=0; cin=0; #1;
        a=0; b=0; cin=1; #1;
        a=0; b=1; cin=0; #1;
        a=0; b=1; cin=1; #1;
        a=1; b=0; cin=0; #1;
        a=1; b=0; cin=1; #1;
        a=1; b=1; cin=0; #1;
        a=1; b=1; cin=1; #1;
        $finish;
    end
endmodule
