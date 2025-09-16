// Testbench : Data Flow Modelling
module halfadder_dataflow_tb;
    reg a, b;
    wire carry, sum;

    halfadder_dataflow uut(carry, sum, a, b);

    initial begin
        $dumpfile("halfadder_dataflow.vcd");
        $dumpvars(0, halfadder_dataflow_tb);

        $monitor($time, " a=%b b=%b | Carry=%b Sum=%b", a, b, carry, sum);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
