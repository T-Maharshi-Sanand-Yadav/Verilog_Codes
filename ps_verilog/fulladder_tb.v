`timescale 1ns/1ps

module fulladder_tb;

    // Testbench signals
    reg a, b, cin;
    wire sum, carry;

    // Instantiate DUT
    fulladder DUT (
        .carry(carry),
        .sum(sum),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial begin
        $display("a b cin | sum carry");
        $display("---------------------");

        $monitor("%b %b  %b  |  %b    %b", a, b, cin, sum, carry);

        // All combinations
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;

        #10;
        $finish;
    end

endmodule