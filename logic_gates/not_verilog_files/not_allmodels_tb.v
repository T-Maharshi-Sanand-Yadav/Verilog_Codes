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
