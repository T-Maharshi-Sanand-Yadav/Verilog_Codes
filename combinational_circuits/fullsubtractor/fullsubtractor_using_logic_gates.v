module fullsubtractor_using_logic_gates(borrow, difference, a, b, bin);
    output borrow, difference;
    input a, b, bin;

    wire w1, w2, w3, w4, w5;

    // Difference = A XOR B XOR Bin
    xor x1(w2, a, b);
    not n1(w1,a);
    and x2(w4, w1, b);

    xor x3(difference, w2, bin);
    not n2(w3,w2);
    and x4(w5, w3, bin);

    or x5(borrow, w5, w4);
endmodule

// Testbench for fullsubtractor_using_logic_gates
module fullsubtractor_using_logic_gates_tb;
    reg a, b, bin;
    wire borrow, difference;

    fullsubtractor_using_logic_gates uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_using_logic_gates.vcd");
        $dumpvars(0, fullsubtractor_using_logic_gates_tb);

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
    


