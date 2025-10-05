module xor_dataflowmodelling_tb;
    reg a, b;
    wire y;

    xor_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("xor_dataflow.vcd");
        $dumpvars(0, xor_dataflowmodelling_tb);

        $monitor($time, " a=%b b=%b | DataFlow=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
