// ==========================
// Source Code : Gate Level Modelling
module xnor_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    xnor x1(y, a, b);
endmodule

// Testbench : Gate Level Modelling
module xnor_gatelevelmodelling_tb;
    reg a, b;
    wire y;

    xnor_gatelevelmodelling uut(y, a, b);

    initial begin
        $dumpfile("xnor_gatelevel.vcd");
        $dumpvars(0, xnor_gatelevelmodelling_tb);

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
module xnor_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = ~(a ^ b);
endmodule

// Testbench : Data Flow Modelling
module xnor_dataflowmodelling_tb;
    reg a, b;
    wire y;

    xnor_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("xnor_dataflow.vcd");
        $dumpvars(0, xnor_dataflowmodelling_tb);

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
module xnor_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = ~(a ^ b);
endmodule

// Testbench : Behavioural Modelling
module xnor_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    xnor_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("xnor_behavioural.vcd");
        $dumpvars(0, xnor_behaviouralmodelling_tb);

        $monitor($time, " a=%b b=%b | Behavioural=%b", a, b, y);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule

// ==========================
// Combined Testbench for XNOR
module xnor_allmodels_tb;
    reg a, b;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    xnor_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a), .b(b));
    xnor_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a), .b(b));
    xnor_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a), .b(b));

    initial begin
        $dumpfile("xnor_allmodels.vcd");
        $dumpvars(0, xnor_allmodels_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b DataFlow=%b Behavioural=%b",
                 a, b, y_gatelevel, y_dataflow, y_behavioural);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
