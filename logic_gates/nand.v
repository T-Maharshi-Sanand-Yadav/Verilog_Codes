// ==========================
// Source Code : Gate Level Modelling
module nand_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    nand x1(y, a, b);
endmodule

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

// ==========================
// Source Code : Data Flow Modelling
module nand_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = ~(a & b);
endmodule

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

// ==========================
// Source Code : Behavioural Modelling
module nand_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = ~(a & b);
endmodule

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

// ==========================
// Combined Testbench for NAND
module nand_allmodels_tb;
    reg a, b;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    nand_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a), .b(b));
    nand_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a), .b(b));
    nand_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a), .b(b));

    initial begin
        $dumpfile("nand_allmodels.vcd");
        $dumpvars(0, nand_allmodels_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b DataFlow=%b Behavioural=%b",
                 a, b, y_gatelevel, y_dataflow, y_behavioural);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
