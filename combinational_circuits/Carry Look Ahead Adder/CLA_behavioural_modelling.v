// 4-bit Carry Look-Ahead Adder - Behavioral
module cla4_behavioural (
    output reg cout,
    output reg [3:0] sum,
    input      [3:0] a,
    input      [3:0] b,
    input      cin
);

    reg [3:0] p, g;
    reg [4:0] c;   // c[0]=cin, c[4]=cout

    always @* begin
        // propagate and generate
        p = a ^ b;
        g = a & b;

        // base carry
        c[0] = cin;

        // look-ahead carries (same as slides)
        c[1] = g[0] | (p[0] & c[0]);
        c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
        c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0])
                       | (p[2] & p[1] & p[0] & c[0]);
        c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1])
                       | (p[3] & p[2] & p[1] & g[0])
                       | (p[3] & p[2] & p[1] & p[0] & c[0]);

        // sums
        sum[0] = p[0] ^ c[0];
        sum[1] = p[1] ^ c[1];
        sum[2] = p[2] ^ c[2];
        sum[3] = p[3] ^ c[3];

        cout = c[4];
    end

endmodule