// Source Code : Gate Level Modelling
module and_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    and x1(y, a, b);
endmodule

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

// Source Code : Data Flow Modelling
module and_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = a & b;
endmodule

// Testbench : Data Flow Modelling
module and_dataflowmodelling_tb;
    reg a, b;
    wire y;

    and_dataflowmodelling uut(y, a, b);

    initial begin
        $dumpfile("and_dataflow.vcd");
        $dumpvars(0, and_dataflowmodelling_tb);

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
module and_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = a & b;
endmodule

// Testbench : Behavioural Modelling
module and_behaviouralmodelling_tb;
    reg a, b;
    wire y;

    and_behaviouralmodelling uut(y, a, b);

    initial begin
        $dumpfile("and_behavioural.vcd");
        $dumpvars(0, and_behaviouralmodelling_tb);

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
module and_gatelevelmodelling(y, a, b);
    output y;
    input a, b;
    and x1(y, a, b);
endmodule

// -------------------------------------------------
// Data Flow Modelling
module and_dataflowmodelling(y, a, b);
    output y;
    input a, b;
    assign y = a & b;
endmodule

// -------------------------------------------------
// Behavioural Modelling
module and_behaviouralmodelling(y, a, b);
    output y;
    input a, b;
    reg y;
    always @(a, b)
        y = a & b;
endmodule

// -------------------------------------------------
// Combined Testbench
module and_allmodels_tb;
    reg a, b;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    and_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a), .b(b));
    and_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a), .b(b));
    and_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a), .b(b));

    initial begin
        $dumpfile("and_allmodels.vcd");
        $dumpvars(0, and_allmodels_tb);

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
