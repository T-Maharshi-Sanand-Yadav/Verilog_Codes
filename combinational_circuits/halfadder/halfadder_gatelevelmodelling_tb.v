// Testbench : Gate Level Modelling
module halfadder_gatelevel_tb;
    reg a, b;
    wire carry, sum;

    halfadder_gatelevel uut(carry, sum, a, b);

    initial begin
        $dumpfile("halfadder_gatelevel.vcd");
        $dumpvars(0, halfadder_gatelevel_tb);

        $monitor($time, " a=%b b=%b | Carry=%b Sum=%b", a, b, carry, sum);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
