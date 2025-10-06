// ===================================================
// Source Code : Gate Level Modelling
module fullsubtractor_gatelevel(borrow, difference, a, b, bin);
    output borrow, difference;
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
    wire borrow, difference;

    fullsubtractor_gatelevel uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_gatelevel.vcd");
        $dumpvars(0, fullsubtractor_gatelevel_tb);

        $monitor($time, " a=%b b=%b bin=%b | Borrow=%b Difference=%b", a, b, bin, borrow, difference);

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
module fullsubtractor_dataflow(borrow, difference, a, b, bin);
    output borrow, difference;
    input a, b, bin;

    assign difference = a ^ b ^ bin;
    assign borrow     = (~a & b) | (~(a ^ b) & bin);
endmodule

// Testbench : Data Flow Modelling
module fullsubtractor_dataflow_tb;
    reg a, b, bin;
    wire borrow, difference;

    fullsubtractor_dataflow uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_dataflow.vcd");
        $dumpvars(0, fullsubtractor_dataflow_tb);

        $monitor($time, " a=%b b=%b bin=%b | Borrow=%b Difference=%b", a, b, bin, borrow, difference);

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
module fullsubtractor_behavioural(borrow, difference, a, b, bin);
    output reg borrow, difference;
    input a, b, bin;

    always @(a, b, bin) begin
        {borrow, difference} = a - b - bin;
    end
endmodule

// Testbench : Behavioural Modelling
module fullsubtractor_behavioural_tb;
    reg a, b, bin;
    wire borrow, difference;

    fullsubtractor_behavioural uut(borrow, difference, a, b, bin);

    initial begin
        $dumpfile("fullsubtractor_behavioural.vcd");
        $dumpvars(0, fullsubtractor_behavioural_tb);

        $monitor($time, " a=%b b=%b bin=%b | Borrow=%b Difference=%b", a, b, bin, borrow, difference);

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
    wire borrow_gate, difference_gate;
    wire borrow_df, difference_df;
    wire borrow_beh, difference_beh;

    fullsubtractor_gatelevel   uut_gate (.borrow(borrow_gate), .difference(difference_gate), .a(a), .b(b), .bin(bin));
    fullsubtractor_dataflow    uut_df   (.borrow(borrow_df),   .difference(difference_df),   .a(a), .b(b), .bin(bin));
    fullsubtractor_behavioural uut_beh  (.borrow(borrow_beh),  .difference(difference_beh),  .a(a), .b(b), .bin(bin));

    initial begin
        $dumpfile("fullsubtractor_allmodels.vcd");
        $dumpvars(0, fullsubtractor_allmodels_tb);

        $monitor($time, " a=%b b=%b bin=%b | Gate(Borrow=%b Difference=%b) DataFlow(Borrow=%b Difference=%b) Behavioural(Borrow=%b Difference=%b)",
                 a, b, bin, borrow_gate, difference_gate, borrow_df, difference_df, borrow_beh, difference_beh);

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
// EDA Playground: 
// ===================================================
fullsubtractor_gatelevel = https://edaplayground.com/x/L6TP
fullsubtractor_dataflow = https://edaplayground.com/x/RVFF
fullsubtractor_behavioural = https://edaplayground.com/x/Wu37
// ===================================================



