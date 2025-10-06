module fullsubtractor_using_basic_gates(borrow, difference, a, b, bin);
    output borrow, difference;
    input a, b, bin;

    wire a_bar, b_bar, bin_bar;
    wire w1, w2, w3, w4, w5, w6;

    // Inverters
    not n1 (a_bar, a);
    not n2 (b_bar, b);
    not n3 (bin_bar, bin);

    // AND gates for borrow
    and x1 (w1, a_bar, bin);
    and x2 (w2, a_bar, b);


    // AND gates for difference
    and x4 (w3, a_bar, b_bar, bin);
    and x5 (w4, a_bar, b, bin_bar);
    and x6 (w5, a, b_bar, bin_bar);
    and x7 (w6, a, b, bin);

    // OR gates to combine the results for borrow and difference
    or x3 (borrow, w1, w2);
    or x8 (difference, w3, w4, w5, w6);
endmodule

// Testbench for fullsubtractor_using_basic_gates
module fullsubtractor_using_basic_gates_tb;
    reg a, b, bin;
    wire borrow, difference;

    fullsubtractor_using_basic_gates uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_using_basic_gates.vcd");
        $dumpvars(0, fullsubtractor_using_basic_gates_tb);

        $monitor($time, " a=%b b=%b bin=%b | Borrow=%b Difference=%b", a, b, bin, borrow, difference);

        a=0;b=0;bin=0; #50;
        a=0;b=0;bin=1; #50;
        a=0;b=1;bin=0; #50;
        a=0;b=1;bin=1; #50;
        a=1;b=0;bin=0; #50;
        a=1;b=0;bin=1; #50;
        a=1;b=1;bin=0; #50;
        a=1;b=1;bin=1; #50;

        $finish;
    end
endmodule




