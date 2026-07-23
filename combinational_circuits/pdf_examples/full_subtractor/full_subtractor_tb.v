`timescale 1ns/1ps
module full_subtractor_tb;
    reg a, b, bin;
    wire difference, bout;
    full_subtractor dut (.a(a), .b(b), .bin(bin), .difference(difference), .bout(bout));
    integer i;
    initial begin
        $monitor("a=%b b=%b bin=%b difference=%b borrow=%b",a,b,bin,difference,bout);
        for (i=0;i<8;i=i+1) begin {a,b,bin}=i; #1; end
        $finish;
    end
endmodule
