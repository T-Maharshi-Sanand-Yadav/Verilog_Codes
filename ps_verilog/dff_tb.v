module dff_tb;

    // Testbench signals
    reg clk;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    dff uut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        // Dump VCD waveform
        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);

        // Test vectors
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;

        $finish;
    end

endmodule

