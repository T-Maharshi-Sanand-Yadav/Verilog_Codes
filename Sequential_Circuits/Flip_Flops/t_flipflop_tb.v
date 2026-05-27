// Testbench for T Flip-Flop

module t_flipflop_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg t;
    wire q, q_bar;

    // Instantiate the T Flip-Flop
    t_flipflop uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .t(t),
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
        t = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: No toggle (T=0)
        #10 t = 0;
        #20;

        // Test: Toggle (T=1)
        #10 t = 1;
        #20;

        // Test: Toggle again (T=1)
        #10 t = 1;
        #20;

        // Test: No toggle (T=0)
        #10 t = 0;
        #20;

        // Test: Continuous toggle
        #10 t = 1;
        #10 t = 1;
        #10 t = 1;
        #10 t = 1;
        #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | T=%b | Q=%b | Q_bar=%b", 
                 $time, clk, t, q, q_bar);
    end

endmodule
