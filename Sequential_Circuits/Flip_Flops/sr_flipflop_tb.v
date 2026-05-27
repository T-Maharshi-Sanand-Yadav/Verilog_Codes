// Testbench for SR Flip-Flop

module sr_flipflop_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg s, r;
    wire q, q_bar;

    // Instantiate the SR Flip-Flop
    sr_flipflop uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 0;
        async_reset = 1;
        s = 0;
        r = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: No change (S=0, R=0)
        #10 s = 0; r = 0;
        #20;

        // Test: Set (S=1, R=0)
        #10 s = 1; r = 0;
        #20;

        // Test: No change (S=0, R=0)
        #10 s = 0; r = 0;
        #20;

        // Test: Reset (S=0, R=1)
        #10 s = 0; r = 1;
        #20;

        // Test: Invalid state (S=1, R=1)
        #10 s = 1; r = 1;
        #20;

        // Test: Back to valid state
        #10 s = 0; r = 0;
        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | S=%b | R=%b | Q=%b | Q_bar=%b", 
                 $time, clk, s, r, q, q_bar);
    end

endmodule
