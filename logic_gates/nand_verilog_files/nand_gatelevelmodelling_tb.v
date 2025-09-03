// Testbench : Gate Level Modelling
module nand_gatelevelmodelling_tb;
    reg a, b;
    wire y;

    nand_gatelevelmodelling uut(y, a, b);

    initial begin
        $dumpfile("nand_gatelevel.vcd");
        $dumpvars(0, nand_gatelevelmodelling_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
