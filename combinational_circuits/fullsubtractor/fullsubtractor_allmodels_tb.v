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