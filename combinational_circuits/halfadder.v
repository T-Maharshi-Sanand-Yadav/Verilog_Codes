// ===================================================
// Source Code : Gate Level Modelling
module halfadder_gatelevel(carry, sum, a, b);
    output carry, sum;
    input a, b;

    and a1(carry, a, b);
    xor x1(sum, a, b);
endmodule

// Testbench : Gate Level Modelling
module halfadder_gatelevel_tb;
    reg a, b;
    wire carry, sum;

    halfadder_gatelevel uut(carry, sum, a, b);

    initial begin
        $dumpfile("halfadder_gatelevel.vcd");
        $dumpvars(0, halfadder_gatelevel_tb);

        $monitor($time, " a=%b b=%b | Carry=%b Sum=%b", a, b, carry, sum);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule


// ===================================================
// Source Code : Data Flow Modelling
module halfadder_dataflow(carry, sum, a, b);
    output carry, sum;
    input a, b;

    assign carry = a & b;
    assign sum   = a ^ b;
endmodule

// Testbench : Data Flow Modelling
module halfadder_dataflow_tb;
    reg a, b;
    wire carry, sum;

    halfadder_dataflow uut(carry, sum, a, b);

    initial begin
        $dumpfile("halfadder_dataflow.vcd");
        $dumpvars(0, halfadder_dataflow_tb);

        $monitor($time, " a=%b b=%b | Carry=%b Sum=%b", a, b, carry, sum);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule


// ===================================================
// Source Code : Behavioural Modelling
module halfadder_behavioural(carry, sum, a, b);
    output reg carry, sum;
    input a, b;

    always @(a, b) begin
        carry = a & b;
        sum   = a ^ b;
    end
endmodule

// Testbench : Behavioural Modelling
module halfadder_behavioural_tb;
    reg a, b;
    wire carry, sum;

    halfadder_behavioural uut(carry, sum, a, b);

    initial begin
        $dumpfile("halfadder_behavioural.vcd");
        $dumpvars(0, halfadder_behavioural_tb);

        $monitor($time, " a=%b b=%b | Carry=%b Sum=%b", a, b, carry, sum);

        // Apply all combinations
        a = 0; b = 0; #50;
        a = 0; b = 1; #50;
        a = 1; b = 0; #50;
        a = 1; b = 1; #50;

        $finish;
    end
endmodule


// ===================================================
// ---------------------------------------------------
// Gate Level Modelling
module halfadder_gatelevel(carry, sum, a, b);
    output carry, sum;
    input a, b;

    and a1(carry, a, b);
    xor x1(sum, a, b);
endmodule

// ---------------------------------------------------
// Data Flow Modelling
module halfadder_dataflow(carry, sum, a, b);
    output carry, sum;
    input a, b;

    assign carry = a & b;
    assign sum   = a ^ b;
endmodule

// ---------------------------------------------------
// Behavioural Modelling
module halfadder_behavioural(carry, sum, a, b);
    output reg carry, sum;
    input a, b;

    always @(a, b) begin
        carry = a & b;
        sum   = a ^ b;
    end
endmodule


// ===================================================
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
