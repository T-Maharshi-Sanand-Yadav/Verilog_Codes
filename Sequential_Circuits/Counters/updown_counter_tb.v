// Testbench for Up/Down Counter

module updown_counter_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg enable;
    reg up_down;
    wire [3:0] count;

    // Instantiate the Up/Down Counter
    updown_counter uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .enable(enable),
        .up_down(up_down),
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
        up_down = 1;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: Counter disabled
        #10 enable = 0;
        #40;

        // Test: Count up from 0 to 15
        #10 enable = 1; up_down = 1;
        #160;

        // Test: Count down from 15 to 0
        #10 up_down = 0;
        #160;

        // Test: Synchronous reset and count up again
        #10 reset = 1;
        #10 reset = 0; up_down = 1;
        #80;

        // Test: Change direction mid-count
        #10 up_down = 0;  // Switch to count down
        #80;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Enable=%b | Direction=%s | Count=%d", 
                 $time, clk, enable, (up_down ? "UP" : "DOWN"), count);
    end

endmodule
