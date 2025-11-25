`timescale 1ns/1ps

module cla4_gate_tb;

    // DUT signals
    reg  [3:0] a, b;
    reg        cin;
    wire       cout;
    wire [3:0] sum;

    integer i;
    reg [4:0] expected;   // 4-bit sum + carry => 5 bits

    // Instantiate DUT
    // Port order: (cout, sum, a, b, cin)
    cla4_gate dut (
        .cout(cout),
        .sum(sum),
        .a(a),
        .b(b),
        .cin(cin)
    );

    initial begin
        // for waveform (optional)
        $dumpfile("cla4_gate_tb.vcd");
        $dumpvars(0, cla4_gate_tb);

        $display("Time  a    b    cin | cout sum  || expected  Result");
        $display("-----------------------------------------------------");

        // Sweep all 512 combinations in order
        for (i = 0; i < 512; i = i + 1) begin
            {a, b, cin} = i[8:0];  // pack/unpack 4+4+1 bits
            #1;                    // wait for combinational settle

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
