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