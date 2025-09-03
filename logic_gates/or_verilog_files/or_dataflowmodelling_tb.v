// Testbench : Data Flow Modelling
module or_dataflowmodelling_tb;
    reg a, b;
    wire y;

    or_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("or_dataflow.vcd");
        $dumpvars(0, or_dataflowmodelling_tb);

        $monitor($time, " a=%b b=%b | DataFlow=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
