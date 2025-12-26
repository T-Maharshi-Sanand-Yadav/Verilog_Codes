// Source Code : Gate Level Modelling
module not_gatelevelmodelling(y, a);
    output y;
    input a;
    not x1(y, a);
endmodule

// Testbench : Gate Level Modelling
module not_gatelevelmodelling_tb;
    reg a;
    wire y;

    not_gatelevelmodelling uut(y, a);

    initial begin
        $dumpfile("not_gatelevel.vcd");
        $dumpvars(0, not_gatelevelmodelling_tb);

        $monitor($time, " a=%b | y=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule

// Source Code : Data Flow Modelling
module not_dataflowmodelling(y, a);
    output y;
    input a;
    assign y = ~a;
endmodule

// Testbench : Data Flow Modelling
module not_dataflowmodelling_tb;
    reg a;
    wire y;

    not_dataflowmodelling uut(y, a);

    initial begin
        $dumpfile("not_dataflow.vcd");
        $dumpvars(0, not_dataflowmodelling_tb);

        $monitor($time, " a=%b | y=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule

// Source Code : Behavioural Modelling
module not_behaviouralmodelling(y, a);
    output y;
    input a;
    reg y;
    always @(a)
        y = ~a;
endmodule

// Testbench : Behavioural Modelling
module not_behaviouralmodelling_tb;
    reg a;
    wire y;

    not_behaviouralmodelling uut(y, a);

    initial begin
        $dumpfile("not_behavioural.vcd");
        $dumpvars(0, not_behaviouralmodelling_tb);

        $monitor($time, " a=%b | y=%b", a, y);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule

// -------------------------------------------------
// Gate Level Modelling
module not_gatelevelmodelling(y, a);
    output y;
    input a;
    not x1(y, a);
endmodule

// -------------------------------------------------
// Data Flow Modelling
module not_dataflowmodelling(y, a);
    output y;
    input a;
    assign y = ~a;
endmodule

// -------------------------------------------------
// Behavioural Modelling
module not_behaviouralmodelling(y, a);
    output y;
    input a;
    reg y;
    always @(a)
        y = ~a;
endmodule

// -------------------------------------------------
// Combined Testbench
module not_allmodels_tb;
    reg a;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    not_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a));
    not_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a));
    not_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a));

    initial begin
        $dumpfile("not_allmodels.vcd");
        $dumpvars(0, not_allmodels_tb);

        $monitor($time, " a=%b | GateLevel=%b DataFlow=%b Behavioural=%b",
                 a, y_gatelevel, y_dataflow, y_behavioural);

        a = 0; #50;   // Start at 0
        a = 1; #50;   // Then go to 1

        $finish;
    end
endmodule
