// Combined Testbench
module halfadder_allmodels_tb;
    reg a, b;
    wire carry_gate, sum_gate;
    wire carry_df, sum_df;
    wire carry_beh, sum_beh;

    halfadder_gatelevel    uut_gate (.carry(carry_gate), .sum(sum_gate), .a(a), .b(b));
    halfadder_dataflow     uut_df   (.carry(carry_df),   .sum(sum_df),   .a(a), .b(b));
    halfadder_behavioural  uut_beh  (.carry(carry_beh),  .sum(sum_beh),  .a(a), .b(b));

    initial begin
        $dumpfile("halfadder_allmodels.vcd");
        $dumpvars(0, halfadder_allmodels_tb);

        $monitor($time, " a=%b b=%b | Gate(Carry=%b Sum=%b) DataFlow(Carry=%b Sum=%b) Behavioural(Carry=%b Sum=%b)",
                 a, b, carry_gate, sum_gate, carry_df, sum_df, carry_beh, sum_beh);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule
