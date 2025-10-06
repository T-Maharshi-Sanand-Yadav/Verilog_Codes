module halfsubtractor_using_basic_gates (borrow, difference, a, b);
    output borrow, difference;
    input a, b;

    wire a_bar, b_bar;
    wire w1, w2;

    // Inverters
    not n1 (a_bar, a);
    not n2 (b_bar, b);

    // AND gates
    and x1 (borrow,a_bar,b);       // borrow
    and x2 (w1,a_bar,b);
    and x3 (w2,a,b_bar);

    or x4 (difference, w1, w2); // OR of two AND outputs to get difference

endmodule



// Testbench for halfsubtractor_using_basic_gates
module halfsubtractor_using_basic_gates_tb;
    reg a, b;
    wire borrow, difference;

    halfsubtractor_using_basic_gates uut(borrow, difference, a, b);

    initial begin
        $dumpfile("halfsubtractor_using_basic_gates.vcd");
        $dumpvars(0, halfsubtractor_using_basic_gates_tb);

        $monitor($time, " a=%b b=%b | Borrow=%b Difference=%b", a, b, borrow, difference);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end


    