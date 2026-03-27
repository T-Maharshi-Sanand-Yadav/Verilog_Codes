module carry_look_ahead_adder_8_bit (
    output       cout,
    output [7:0] sum,
    input  [7:0] a, b,
    input        cin
);
    parameter N = 8;
    wire [N-1:0] p, g;
    wire [N:0]   c;

    assign c[0] = cin;

    genvar i;

    // Generate propagate and generate signals
    generate
        for (i = 0; i < N; i = i + 1) begin : pg_gen
            assign p[i] = a[i] ^ b[i];   // propagate
            assign g[i] = a[i] & b[i];   // generate
        end
    endgenerate

    // Generate carry signals
    generate
        for (i = 1; i <= N; i = i + 1) begin : carry_gen
            assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
        end
    endgenerate

    // Generate sum outputs
    generate
        for (i = 0; i < N; i = i + 1) begin : sum_gen
            assign sum[i] = p[i] ^ c[i];
        end
    endgenerate

    assign cout = c[N];
endmodule

