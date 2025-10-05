module xor_gatelevelmodelling_tb;
    reg a, b;
    wire y;

    xor_gatelevelmodelling uut(y, a, b);

    initial begin
        $dumpfile("xor_gatelevel.vcd");
        $dumpvars(0, xor_gatelevelmodelling_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
