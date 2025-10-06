// ===================================================
// Source Code : Gate Level Modelling
module halfsubtractor_gatelevel(borrow, difference, a, b);
    output borrow, difference;
    input a, b;
    wire a_bar;
    xor x1(difference, a, b);
    not n1(a_bar, a);
    and x2(borrow, a_bar, b);
endmodule

// Testbench : Gate Level Modelling
module halfsubtractor_gatelevel_tb;
    reg a, b;
    wire borrow, difference;

    halfsubtractor_gatelevel uut(borrow, difference, a, b);

    initial begin
        $dumpfile("halfsubtractor_gatelevel.vcd");
        $dumpvars(0, halfsubtractor_gatelevel_tb);

        $monitor($time, " a=%b b=%b | Borrow=%b Difference=%b", a, b, borrow, difference);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Data Flow Modelling
module halfsubtractor_dataflow(borrow, difference, a, b);
    output borrow, difference;
    input a, b;

    assign difference = a ^ b;
    assign borrow     = (~a) & b;
endmodule

// Testbench : Data Flow Modelling
module halfsubtractor_dataflow_tb;
    reg a, b;
    wire borrow, difference;

    halfsubtractor_dataflow uut(borrow, difference, a, b);

    initial begin
        $dumpfile("halfsubtractor_dataflow.vcd");
        $dumpvars(0, halfsubtractor_dataflow_tb);

        $monitor($time, " a=%b b=%b | Borrow=%b Difference=%b", a, b, borrow, difference);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Behavioural Modelling
module halfsubtractor_behavioural(borrow, difference, a, b);
    output reg borrow, difference;
    input a, b;

    always @(a, b) begin
        difference = a ^ b;
        borrow     = (~a) & b;
    end
endmodule

// Testbench : Behavioural Modelling
module halfsubtractor_behavioural_tb;
    reg a, b;
    wire borrow, difference;

    halfsubtractor_behavioural uut(borrow, difference, a, b);

    initial begin
        $dumpfile("halfsubtractor_behavioural.vcd");
        $dumpvars(0, halfsubtractor_behavioural_tb);

        $monitor($time, " a=%b b=%b | Borrow=%b Difference=%b", a, b, borrow, difference);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Combined Testbench for Half Subtractor
module halfsubtractor_allmodels_tb;
    reg a, b;
    wire borrow_gate, difference_gate;
    wire borrow_df, difference_df;
    wire borrow_beh, difference_beh;

    halfsubtractor_gatelevel   uut_gate (.borrow(borrow_gate), .difference(difference_gate), .a(a), .b(b));
    halfsubtractor_dataflow    uut_df   (.borrow(borrow_df),   .difference(difference_df),   .a(a), .b(b));
    halfsubtractor_behavioural uut_beh  (.borrow(borrow_beh),  .difference(difference_beh),  .a(a), .b(b));

    initial begin
        $dumpfile("halfsubtractor_allmodels.vcd");
        $dumpvars(0, halfsubtractor_allmodels_tb);

        $monitor($time, " a=%b b=%b | Gate(Borrow=%b Difference=%b) DataFlow(Borrow=%b Difference=%b) Behavioural(Borrow=%b Difference=%b)",
                 a, b, borrow_gate, difference_gate, borrow_df, difference_df, borrow_beh, difference_beh);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule


// ===================================================
// EDA Playground: 
// ===================================================
halfsubtractor_gatelevel = https://edaplayground.com/x/8DKu
halfsubtractor_dataflow = https://edaplayground.com/x/bDGC
halfsubtractor_behavioural = https://edaplayground.com/x/n_qv
// ===================================================