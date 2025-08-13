// Source Code : Gate Level Modelling
module or_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    or x1(y, a, b);
endmodule

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

// Source Code : Data Flow Modelling
module or_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = a | b;
endmodule

// Testbench : Data Flow Modelling
module or_dataflowmodelling_tb;
    reg a, b;
    wire y;

    or_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("or_dataflow.vcd");
        $dumpvars(0, or_dataflowmodelling_tb);

        $monitor($time, " a=%b b=%b | DataFlow=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule

// Source Code : Behavioural Modelling
module or_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = a | b;
endmodule

// Testbench : Behavioural Modelling
module or_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    or_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("or_behavioural.vcd");
        $dumpvars(0, or_behaviouralmodelling_tb);

        $monitor($time, " a=%b b=%b | Behavioural=%b", a, b, y);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule

// -------------------------------------------------
// Gate Level Modelling
module or_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    or x1(y, a, b);
endmodule

// -------------------------------------------------
// Data Flow Modelling
module or_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = a | b;
endmodule

// -------------------------------------------------
// Behavioural Modelling
module or_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = a | b;
endmodule

// -------------------------------------------------
// Combined Testbench
module or_allmodels_tb;
    reg a, b;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    or_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a), .b(b));
    or_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a), .b(b));
    or_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a), .b(b));

    initial begin
        $dumpfile("or_allmodels.vcd");
        $dumpvars(0, or_allmodels_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b DataFlow=%b Behavioural=%b",
                 a, b, y_gatelevel, y_dataflow, y_behavioural);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
