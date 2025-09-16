
// Testbench : Data Flow Modelling
module and_dataflowmodelling_tb;
    reg a, b;
    wire y;

    and_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("and_dataflow.vcd");
        $dumpvars(0, and_dataflowmodelling_tb);

        $monitor($time, " a=%b b=%b | DataFlow=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
