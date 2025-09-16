// ===================================================
// Source Code : Gate Level Modelling
module halfsubtractor_gatelevel(difference, borrow, a, b);
    output difference, borrow;
    input a, b;

    xor g1(difference, a, b);
    and g2(borrow, ~a, b);
endmodule

// Testbench : Gate Level Modelling
module halfsubtractor_gatelevel_tb;
    reg a, b;
    wire difference, borrow;

    halfsubtractor_gatelevel uut(difference, borrow, a, b);

    initial begin
        $dumpfile("halfsubtractor_gatelevel.vcd");
        $dumpvars(0, halfsubtractor_gatelevel_tb);

        $monitor($time, " a=%b b=%b | Difference=%b Borrow=%b", a, b, difference, borrow);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Data Flow Modelling
module halfsubtractor_dataflow(difference, borrow, a, b);
    output difference, borrow;
    input a, b;

    assign difference = a ^ b;
    assign borrow     = (~a) & b;
endmodule

// Testbench : Data Flow Modelling
module halfsubtractor_dataflow_tb;
    reg a, b;
    wire difference, borrow;

    halfsubtractor_dataflow uut(difference, borrow, a, b);

    initial begin
        $dumpfile("halfsubtractor_dataflow.vcd");
        $dumpvars(0, halfsubtractor_dataflow_tb);

        $monitor($time, " a=%b b=%b | Difference=%b Borrow=%b", a, b, difference, borrow);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Behavioural Modelling
module halfsubtractor_behavioural(difference, borrow, a, b);
    output reg difference, borrow;
    input a, b;

    always @(a, b) begin
        difference = a ^ b;
        borrow     = (~a) & b;
    end
endmodule

// Testbench : Behavioural Modelling
module halfsubtractor_behavioural_tb;
    reg a, b;
    wire difference, borrow;

    halfsubtractor_behavioural uut(difference, borrow, a, b);

    initial begin
        $dumpfile("halfsubtractor_behavioural.vcd");
        $dumpvars(0, halfsubtractor_behavioural_tb);

        $monitor($time, " a=%b b=%b | Difference=%b Borrow=%b", a, b, difference, borrow);

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
    wire difference_gate, borrow_gate;
    wire difference_df, borrow_df;
    wire difference_beh, borrow_beh;

    halfsubtractor_gatelevel   uut_gate (.difference(difference_gate), .borrow(borrow_gate), .a(a), .b(b));
    halfsubtractor_dataflow    uut_df   (.difference(difference_df),   .borrow(borrow_df),   .a(a), .b(b));
    halfsubtractor_behavioural uut_beh  (.difference(difference_beh),  .borrow(borrow_beh),  .a(a), .b(b));

    initial begin
        $dumpfile("halfsubtractor_allmodels.vcd");
        $dumpvars(0, halfsubtractor_allmodels_tb);

        $monitor($time, " a=%b b=%b | Gate(Difference=%b Borrow=%b) DataFlow(Difference=%b Borrow=%b) Behavioural(Difference=%b Borrow=%b)",
                 a, b, difference_gate, borrow_gate, difference_df, borrow_df, difference_beh, borrow_beh);

        a=0;b=0; #50;
        a=0;b=1; #50;
        a=1;b=0; #50;
        a=1;b=1; #50;

        $finish;
    end
endmodule
