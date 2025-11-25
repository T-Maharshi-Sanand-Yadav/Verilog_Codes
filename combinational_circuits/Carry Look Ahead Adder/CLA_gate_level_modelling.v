// 4-bit Carry Look-Ahead Adder - Gate Level
module cla4_gate (
    output cout,
    output [3:0] sum,
    input  [3:0] a,
    input  [3:0] b,
    input  cin
);

    wire [3:0] p, g;
    wire c1, c2, c3;
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

    // Propagate p[i] = a[i] ^ b[i]
    xor (p[0], a[0], b[0]);
    xor (p[1], a[1], b[1]);
    xor (p[2], a[2], b[2]);
    xor (p[3], a[3], b[3]);

    // Generate g[i] = a[i] & b[i]
    and (g[0], a[0], b[0]);
    and (g[1], a[1], b[1]);
    and (g[2], a[2], b[2]);
    and (g[3], a[3], b[3]);

    // c1 = g0 + p0·cin
    and (w0, p[0], cin);
    or  (c1, g[0], w0);

    // c2 = g1 + p1·g0 + p1·p0·cin
    and (w1, p[1], g[0]);
    and (w2, p[1], p[0], cin);
    or  (c2, g[1], w1, w2);

    // c3 = g2 + p2·g1 + p2·p1·g0 + p2·p1·p0·cin
    and (w3, p[2], g[1]);
    and (w4, p[2], p[1], g[0]);
    and (w5, p[2], p[1], p[0], cin);
    or  (c3, g[2], w3, w4, w5);

    // c4 = g3 + p3·g2 + p3·p2·g1 + p3·p2·p1·g0 + p3·p2·p1·p0·cin
    and (w6, p[3], g[2]);
    and (w7, p[3], p[2], g[1]);
    and (w8, p[3], p[2], p[1], g[0]);
    and (w9, p[3], p[2], p[1], p[0], cin);
    or  (cout, g[3], w6, w7, w8, w9);

    // Sums: s[i] = p[i] ^ c[i]
    // c0 = cin
    xor (sum[0], p[0], cin);
    xor (sum[1], p[1], c1);
    xor (sum[2], p[2], c2);
    xor (sum[3], p[3], c3);

endmodule
