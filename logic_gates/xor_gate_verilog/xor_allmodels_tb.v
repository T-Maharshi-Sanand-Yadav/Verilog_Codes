module xor_allmodels_tb;
    reg a, b;
    wire y_gatelevel;
    wire y_dataflow;
    wire y_behavioural;

    xor_gatelevelmodelling    uut_gatelevel   (.y(y_gatelevel),   .a(a), .b(b));
    xor_dataflowmodelling     uut_dataflow    (.y(y_dataflow),    .a(a), .b(b));
    xor_behaviouralmodelling  uut_behavioural (.y(y_behavioural), .a(a), .b(b));

    initial begin
        $dumpfile("xor_allmodels.vcd");
        $dumpvars(0, xor_allmodels_tb);

        $monitor($time, " a=%b b=%b | GateLevel=%b DataFlow=%b Behavioural=%b",
                 a, b, y_gatelevel, y_dataflow, y_behavioural);

        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
