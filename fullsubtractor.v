// ===================================================
// Source Code : Gate Level Modelling
module fullsubtractor_gatelevel(difference, borrow, a, b, bin);
    output difference, borrow;
    input a, b, bin;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(difference, w1, bin);

    and a1(w2, ~a, b);
    and a2(w3, ~w1, bin);
    or  o1(borrow, w2, w3);
endmodule

// Testbench : Gate Level Modelling
module fullsubtractor_gatelevel_tb;
    reg a, b, bin;
    wire difference, borrow;

    fullsubtractor_gatelevel uut(difference, borrow, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_gatelevel.vcd");
        $dumpvars(0, fullsubtractor_gatelevel_tb);

        $monitor($time, " a=%b b=%b bin=%b | Difference=%b Borrow=%b", a, b, bin, difference, borrow);

        a=0;b=0;bin=0; #50;
        a=0;b=0;bin=1; #50;
        a=0;b=1;bin=0; #50;
        a=0;b=1;bin=1; #50;
        a=1;b=0;bin=0; #50;
        a=1;b=0;bin=1; #50;
        a=1;b=1;bin=0; #50;
        a=1;b=1;bin=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Data Flow Modelling
module fullsubtractor_dataflow(difference, borrow, a, b, bin);
    output difference, borrow;
    input a, b, bin;

    assign difference = a ^ b ^ bin;
    assign borrow     = (~a & b) | (~(a ^ b) & bin);
endmodule

// Testbench : Data Flow Modelling
module fullsubtractor_dataflow_tb;
    reg a, b, bin;
    wire difference, borrow;

    fullsubtractor_dataflow uut(difference, borrow, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_dataflow.vcd");
        $dumpvars(0, fullsubtractor_dataflow_tb);

        $monitor($time, " a=%b b=%b bin=%b | Difference=%b Borrow=%b", a, b, bin, difference, borrow);

        a=0;b=0;bin=0; #50;
        a=0;b=0;bin=1; #50;
        a=0;b=1;bin=0; #50;
        a=0;b=1;bin=1; #50;
        a=1;b=0;bin=0; #50;
        a=1;b=0;bin=1; #50;
        a=1;b=1;bin=0; #50;
        a=1;b=1;bin=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Source Code : Behavioural Modelling
module fullsubtractor_behavioural(difference, borrow, a, b, bin);
    output reg difference, borrow;
    input a, b, bin;

    always @(a, b, bin) begin
        {borrow, difference} = a - b - bin;
    end
endmodule

// Testbench : Behavioural Modelling
module fullsubtractor_behavioural_tb;
    reg a, b, bin;
    wire difference, borrow;

    fullsubtractor_behavioural uut(difference, borrow, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_behavioural.vcd");
        $dumpvars(0, fullsubtractor_behavioural_tb);

        $monitor($time, " a=%b b=%b bin=%b | Difference=%b Borrow=%b", a, b, bin, difference, borrow);

        a=0;b=0;bin=0; #50;
        a=0;b=0;bin=1; #50;
        a=0;b=1;bin=0; #50;
        a=0;b=1;bin=1; #50;
        a=1;b=0;bin=0; #50;
        a=1;b=0;bin=1; #50;
        a=1;b=1;bin=0; #50;
        a=1;b=1;bin=1; #50;

        $finish;
    end
endmodule

// ===================================================
// Combined Testbench for Full Subtractor
module fullsubtractor_allmodels_tb;
    reg a, b, bin;
    wire difference_gate, borrow_gate;
    wire difference_df, borrow_df;
    wire difference_beh, borrow_beh;

    fullsubtractor_gatelevel   uut_gate (.difference(difference_gate), .borrow(borrow_gate), .a(a), .b(b), .bin(bin));
    fullsubtractor_dataflow    uut_df   (.difference(difference_df),   .borrow(borrow_df),   .a(a), .b(b), .bin(bin));
    fullsubtractor_behavioural uut_beh  (.difference(difference_beh),  .borrow(borrow_beh),  .a(a), .b(b), .bin(bin));

    initial begin
        $dumpfile("fullsubtractor_allmodels.vcd");
        $dumpvars(0, fullsubtractor_allmodels_tb);

        $monitor($time, " a=%b b=%b bin=%b | Gate(Difference=%b Borrow=%b) DataFlow(Difference=%b Borrow=%b) Behavioural(Difference=%b Borrow=%b)",
                 a, b, bin, difference_gate, borrow_gate, difference_df, borrow_df, difference_beh, borrow_beh);

        a=0;b=0;bin=0; #50;
        a=0;b=0;bin=1; #50;
        a=0;b=1;bin=0; #50;
        a=0;b=1;bin=1; #50;
        a=1;b=0;bin=0; #50;
        a=1;b=0;bin=1; #50;
        a=1;b=1;bin=0; #50;
        a=1;b=1;bin=1; #50;

        $finish;
    end
endmodule
