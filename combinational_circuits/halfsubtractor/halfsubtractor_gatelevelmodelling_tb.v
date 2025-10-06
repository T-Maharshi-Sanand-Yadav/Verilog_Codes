module halfsubtractor_gatelevel_tb;
    reg a, b;
    wire borrow, difference;

    halfsubtractor_gatelevel uut(borrow, difference, a, b);

    initial begin
        $dumpfile("halfsubtractor_gatelevel.vcd");
        $dumpvars(0, halfsubtractor_gatelevel_tb);

        $monitor($time, " a=%b b=%b | Borrow=%b Difference=%b", a, b, borrow, difference);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule