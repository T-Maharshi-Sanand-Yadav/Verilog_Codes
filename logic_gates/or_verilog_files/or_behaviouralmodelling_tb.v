// Testbench : Behavioural Modelling
module or_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    or_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("or_behavioural.vcd");
        $dumpvars(0, or_behaviouralmodelling_tb);

        $monitor($time, " a=%b b=%b | Behavioural=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
