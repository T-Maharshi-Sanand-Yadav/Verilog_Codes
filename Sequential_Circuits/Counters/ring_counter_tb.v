// Testbench for Ring Counter

module ring_counter_tb;
    reg clk;
    reg reset;
    reg async_reset;
    wire [3:0] count;

    // Instantiate the Ring Counter
    ring_counter uut (
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

        // Ring counter cycles through: 0001 -> 1000 -> 0100 -> 0010 -> 0001
        #100;  // Run for 10 clock cycles to see the pattern

        // Test: Synchronous reset
        #10 reset = 1;
        #10 reset = 0;
        #100;  // Run for 10 more clock cycles

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Count=%b", 
                 $time, clk, count);
    end

endmodule
