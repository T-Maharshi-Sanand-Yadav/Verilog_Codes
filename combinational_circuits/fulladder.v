// ===================================================
// Source Code : Gate Level Modelling
module fulladder_gatelevel(carry, sum, a, b, cin);
    output carry, sum;
    input a, b, cin;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(sum, w1, cin);

    and a1(w2, w1, cin);
    and a2(w3, a, b);
    or  o1(carry, w2, w3);
endmodule

// Testbench : Gate Level Modelling
module fulladder_gatelevel_tb;
    reg a, b, cin;
    wire carry, sum;

    fulladder_gatelevel uut(carry, sum, a, b, cin);

    initial begin
        $dumpfile("fulladder_gatelevel.vcd");
        $dumpvars(0, fulladder_gatelevel_tb);

        $monitor($time, " a=%b b=%b cin=%b | Carry=%b Sum=%b", a, b, cin, carry, sum);

        // Apply all combinations
        a=0;b=0;cin=0; #50;
        a=0;b=0;cin=1; #50;
        a=0;b=1;cin=0; #50;
        a=0;b=1;cin=1; #50;
        a=1;b=0;cin=0; #50;
        a=1;b=0;cin=1; #50;
        a=1;b=1;cin=0; #50;
        a=1;b=1;cin=1; #50;

        $finish;
    end
endmodule


// ===================================================
// Source Code : Data Flow Modelling
module fulladder_dataflow(carry, sum, a, b, cin);
    output carry, sum;
    input a, b, cin;

    assign sum   = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

// Testbench : Data Flow Modelling
module fulladder_dataflow_tb;
    reg a, b, cin;
    wire carry, sum;

    fulladder_dataflow uut(carry, sum, a, b, cin);

    initial begin
        $dumpfile("fulladder_dataflow.vcd");
        $dumpvars(0, fulladder_dataflow_tb);

        $monitor($time, " a=%b b=%b cin=%b | Carry=%b Sum=%b", a, b, cin, carry, sum);

        // Apply all combinations
        a=0;b=0;cin=0; #50;
        a=0;b=0;cin=1; #50;
        a=0;b=1;cin=0; #50;
        a=0;b=1;cin=1; #50;
        a=1;b=0;cin=0; #50;
        a=1;b=0;cin=1; #50;
        a=1;b=1;cin=0; #50;
        a=1;b=1;cin=1; #50;

        $finish;
    end
endmodule


// ===================================================
// Source Code : Behavioural Modelling
module fulladder_behavioural(carry, sum, a, b, cin);
    output reg carry, sum;
    input a, b, cin;

    always @(a, b, cin) begin
        {carry, sum} = a + b + cin;
    end
endmodule

// Testbench : Behavioural Modelling
module fulladder_behavioural_tb;
    reg a, b, cin;
    wire carry, sum;

    fulladder_behavioural uut(carry, sum, a, b, cin);

    initial begin
        $dumpfile("fulladder_behavioural.vcd");
        $dumpvars(0, fulladder_behavioural_tb);

        $monitor($time, " a=%b b=%b cin=%b | Carry=%b Sum=%b", a, b, cin, carry, sum);

        // Apply all combinations
        a=0;b=0;cin=0; #50;
        a=0;b=0;cin=1; #50;
        a=0;b=1;cin=0; #50;
        a=0;b=1;cin=1; #50;
        a=1;b=0;cin=0; #50;
        a=1;b=0;cin=1; #50;
        a=1;b=1;cin=0; #50;
        a=1;b=1;cin=1; #50;

        $finish;
    end
endmodule


// ===================================================
// ---------------------------------------------------
// Gate Level Modelling
module fulladder_gatelevel(carry, sum, a, b, cin);
    output carry, sum;
    input a, b, cin;
    wire w1, w2, w3;

    xor x1(w1, a, b);
    xor x2(sum, w1, cin);

    and a1(w2, w1, cin);
    and a2(w3, a, b);
    or  o1(carry, w2, w3);
endmodule

// ---------------------------------------------------
// Data Flow Modelling
module fulladder_dataflow(carry, sum, a, b, cin);
    output carry, sum;
    input a, b, cin;

    assign sum   = a ^ b ^ cin;
    assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

// ---------------------------------------------------
// Behavioural Modelling
module fulladder_behavioural(carry, sum, a, b, cin);
    output reg carry, sum;
    input a, b, cin;

    always @(a, b, cin) begin
        {carry, sum} = a + b + cin;
    end
endmodule


// ===================================================
// Combined Testbench
module fulladder_allmodels_tb;
    reg a, b, cin;
    wire carry_gate, sum_gate;
    wire carry_df, sum_df;
    wire carry_beh, sum_beh;

    fulladder_gatelevel    uut_gate (.carry(carry_gate), .sum(sum_gate), .a(a), .b(b), .cin(cin));
    fulladder_dataflow     uut_df   (.carry(carry_df),   .sum(sum_df),   .a(a), .b(b), .cin(cin));
    fulladder_behavioural  uut_beh  (.carry(carry_beh),  .sum(sum_beh),  .a(a), .b(b), .cin(cin));

    initial begin
        $dumpfile("fulladder_allmodels.vcd");
        $dumpvars(0, fulladder_allmodels_tb);

        $monitor($time, " a=%b b=%b cin=%b | Gate(Carry=%b Sum=%b) DataFlow(Carry=%b Sum=%b) Behavioural(Carry=%b Sum=%b)",
                 a, b, cin, carry_gate, sum_gate, carry_df, sum_df, carry_beh, sum_beh);

        // Apply all combinations
        a=0;b=0;cin=0; #50;
        a=0;b=0;cin=1; #50;
        a=0;b=1;cin=0; #50;
        a=0;b=1;cin=1; #50;
        a=1;b=0;cin=0; #50;
        a=1;b=0;cin=1; #50;
        a=1;b=1;cin=0; #50;
        a=1;b=1;cin=1; #50;

        $finish;
    end
endmodule
