module fullsubtractor_gatelevel_tb;
    reg a, b, bin;
    wire borrow, difference;

    fullsubtractor_gatelevel uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_gatelevel.vcd");
        $dumpvars(0, fullsubtractor_gatelevel_tb);

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