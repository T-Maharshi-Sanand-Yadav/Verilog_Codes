// Testbench for Johnson Counter

module johnson_counter_tb;
    reg clk;
    reg reset;
    reg async_reset;
    wire [3:0] count;

    // Instantiate the Johnson Counter
    johnson_counter uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .count(count)
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

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Johnson counter cycles through: 0000 -> 1000 -> 1100 -> 1110 -> 1111 -> 0111 -> 0011 -> 0001 -> 0000
        #160;  // Run for 16 clock cycles to complete a full cycle

        // Test: Synchronous reset
        #10 reset = 1;
        #10 reset = 0;
        #160;  // Run for 16 more clock cycles

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Count=%b", 
                 $time, clk, count);
    end

endmodule
