// Testbench for D Flip-Flop

module d_flipflop_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .d(d),
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
        d = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: D = 0
        #10 d = 0;
        #20;

        // Test: D = 1
        #10 d = 1;
        #20;

        // Test: D = 1 (remains 1)
        #10 d = 1;
        #20;

        // Test: D = 0
        #10 d = 0;
        #20;

        // Test: D alternating
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | D=%b | Q=%b | Q_bar=%b", 
                 $time, clk, d, q, q_bar);
    end

endmodule
