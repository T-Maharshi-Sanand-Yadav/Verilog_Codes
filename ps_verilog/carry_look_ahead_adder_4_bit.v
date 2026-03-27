module carry_look_ahead_adder_4_bit (
    output       cout,
    output [3:0] sum,
    input  [3:0] a, b,
    input        cin
);
    parameter N = 4;
    wire [N-1:0] p, g;
    wire [N:0]   c;

    assign c[0] = cin;

    // Compute carry generate and propagate
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : pq_cla
            assign p[i] = a[i] ^ b[i];       // propagate
            assign g[i] = a[i] & b[i];       // generate
        end
    endgenerate

    // Compute carry using CLA logic
    generate
        for (i = 1; i <= N; i = i + 1) begin : carry_cla
            assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
        end
    endgenerate

    // Compute sum bits
    generate
        for (i = 0; i < N; i = i + 1) begin : sum_cla
            assign sum[i] = p[i] ^ c[i];
        end
    endgenerate

    assign cout = c[N];
endmodule

