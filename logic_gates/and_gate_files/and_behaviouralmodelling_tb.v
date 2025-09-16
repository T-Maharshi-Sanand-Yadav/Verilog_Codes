
// Testbench : Behavioural Modelling
module and_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    and_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("and_behavioural.vcd");
        $dumpvars(0, and_behaviouralmodelling_tb);

        $monitor($time, " a=%b b=%b | Behavioural=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
