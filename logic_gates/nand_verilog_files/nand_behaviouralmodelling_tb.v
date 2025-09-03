// Testbench : Behavioural Modelling
module nand_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    nand_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("nand_behavioural.vcd");
        $dumpvars(0, nand_behaviouralmodelling_tb);

        $monitor($time, " a=%b b=%b | Behavioural=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
