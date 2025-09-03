// Testbench : Gate Level Modelling
module not_gatelevelmodelling_tb;
    reg a;
    wire y;

    not_gatelevelmodelling uut(y, a);

    initial begin
        $dumpfile("not_gatelevel.vcd");
        $dumpvars(0, not_gatelevelmodelling_tb);

        $monitor($time, " a=%b | GateLevel=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule
