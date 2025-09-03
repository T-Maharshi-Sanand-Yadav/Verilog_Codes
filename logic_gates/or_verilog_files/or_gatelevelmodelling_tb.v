// Testbench : Gate Level Modelling
module or_gatelevelmodelling_tb;
    reg a, b;
    wire y;

    or_gatelevelmodelling uut(y, a, b);

    initial begin
        $dumpfile("or_gatelevel.vcd");
        $dumpvars(0, or_gatelevelmodelling_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
