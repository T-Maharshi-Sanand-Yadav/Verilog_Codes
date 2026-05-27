// Testbench for JK Flip-Flop

module jk_flipflop_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg j, k;
    wire q, q_bar;

    // Instantiate the JK Flip-Flop
    jk_flipflop uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .j(j),
        .k(k),
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
        j = 0;
        k = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: No change (J=0, K=0)
        #10 j = 0; k = 0;
        #20;

        // Test: Reset (J=0, K=1)
        #10 j = 0; k = 1;
        #20;

        // Test: No change (J=0, K=0)
        #10 j = 0; k = 0;
        #20;

        // Test: Set (J=1, K=0)
        #10 j = 1; k = 0;
        #20;

        // Test: Toggle (J=1, K=1)
        #10 j = 1; k = 1;
        #20;

        // Test: Toggle again (J=1, K=1)
        #10 j = 1; k = 1;
        #20;

        // Test: No change (J=0, K=0)
        #10 j = 0; k = 0;
        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | J=%b | K=%b | Q=%b | Q_bar=%b", 
                 $time, clk, j, k, q, q_bar);
    end

endmodule
