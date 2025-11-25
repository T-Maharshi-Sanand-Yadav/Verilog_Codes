`timescale 1ns/1ps

module cla4_behavioural_tb;

    // DUT signals
    reg  [3:0] a, b;
    reg        cin;
    wire       cout;
    wire [3:0] sum;

    integer i;
    reg [4:0] expected;   // 4 bits sum + 1 carry

    // Instantiate DUT
    // Port order: (cout, sum, a, b, cin)
    cla4_behavioural dut (
        .cout(cout),
        .sum(sum),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial begin
        // For waveform viewing (optional)
        $dumpfile("cla4_behavioural_tb.vcd");
        $dumpvars(0, cla4_behavioural_tb);

        $display("Time  a    b    cin | cout sum  || expected  Result");
        $display("-----------------------------------------------------");

        // Apply all possible combinations in order
        for (i = 0; i < 512; i = i + 1) begin
            {a, b, cin} = i[8:0];   // 4+4+1 = 9 bits
            #1;                     // allow combinational logic to settle

            expected = a + b + cin;

            if ({cout, sum} !== expected) begin
                $display("%4t  %b  %b   %b  |  %b   %b  ||  %b   MISMATCH",
                         $time, a, b, cin, cout, sum, expected);
            end else begin
                $display("%4t  %b  %b   %b  |  %b   %b  ||  %b   OK",
                         $time, a, b, cin, cout, sum, expected);
            end
        end

        $display("-----------------------------------------------------");
        $finish;
    end

endmodule
