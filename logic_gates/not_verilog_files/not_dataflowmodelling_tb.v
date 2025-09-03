// Testbench : Data Flow Modelling
module not_dataflowmodelling_tb;
    reg a;
    wire y;

    not_dataflowmodelling uut(y, a);

    initial begin
        $dumpfile("not_dataflow.vcd");
        $dumpvars(0, not_dataflowmodelling_tb);

        $monitor($time, " a=%b | DataFlow=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule
