// Testbench : Data Flow Modelling
module nand_dataflowmodelling_tb;
    reg a, b;
    wire y;

    nand_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("nand_dataflow.vcd");
        $dumpvars(0, nand_dataflowmodelling_tb);

        $monitor($time, " a=%b b=%b | DataFlow=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
