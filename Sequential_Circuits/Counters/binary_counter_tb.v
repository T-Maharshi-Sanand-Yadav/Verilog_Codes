// Testbench for Binary Counter

module binary_counter_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg enable;
    wire [3:0] count;

    // Instantiate the Binary Counter
    binary_counter uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .enable(enable),
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
        enable = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: Counter disabled (enable = 0)
        #10 enable = 0;
        #40;

        // Test: Counter enabled, count from 0 to 15
        #10 enable = 1;
        #160;  // 16 clock cycles to complete the full count

        // Test: Counter wraps around
        #10 enable = 1;
        #80;   // 8 more clock cycles

        // Test: Synchronous reset
        #10 reset = 1;
        #10 reset = 0;
        #10 enable = 1;
        #80;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Enable=%b | Count=%d", 
                 $time, clk, enable, count);
    end

endmodule
