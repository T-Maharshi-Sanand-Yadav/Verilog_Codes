module fulladder (carry, sum, a, b, cin);

    output carry, sum;
    input a, b, cin;

    wire s1, c1, c2;

    // First Half Adder
    halfadder HA1 (
        .carry(c1),
        .sum(s1),
        .a(a),
        .b(b)
    );

    // Second Half Adder
    halfadder HA2 (
        .carry(c2),
        .sum(sum),
        .a(s1),
        .b(cin)
    );

    // OR gate for final carry
    or (carry, c1, c2);

endmodule