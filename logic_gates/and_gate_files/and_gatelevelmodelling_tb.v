
// Testbench : Gate Level Modelling
module and_gatelevelmodelling_tb;
    reg a, b;
    wire y;

    and_gatelevelmodelling uut(y, a, b);

    initial begin
        $dumpfile("and_gatelevel.vcd");
        $dumpvars(0, and_gatelevelmodelling_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
