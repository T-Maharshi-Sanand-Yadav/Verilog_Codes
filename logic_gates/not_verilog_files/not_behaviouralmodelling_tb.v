// Testbench : Behavioural Modelling
module not_behaviouralmodelling_tb;
    reg a;
    wire y;

    not_behaviouralmodelling uut(y, a);

    initial begin
        $dumpfile("not_behavioural.vcd");
        $dumpvars(0, not_behaviouralmodelling_tb);

        $monitor($time, " a=%b | Behavioural=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule
