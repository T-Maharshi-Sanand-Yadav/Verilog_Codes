`timescale 1ns/1ps
module half_subtractor_tb;
    reg a, b;
    wire difference, borrow;
    half_subtractor dut (.a(a), .b(b), .difference(difference), .borrow(borrow));
    initial begin
        $monitor("At time %0t: a=%b b=%b, difference=%b, borrow=%b", $time, a, b, difference, borrow);
        a=0; b=0; #1; a=0; b=1; #1; a=1; b=0; #1; a=1; b=1; #1;
        $finish;
    end
endmodule
