// Testbench for BCD Counter

module bcd_counter_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg enable;
    wire [3:0] units;
    wire [3:0] tens;

    // Instantiate the BCD Counter
    bcd_counter uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .enable(enable),
        .units(units),
        .tens(tens)
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

        // Test: Counter disabled
        #10 enable = 0;
        #40;

        // Test: Counter enabled, count from 0 to 99
        #10 enable = 1;
        #1000;  // 100 clock cycles to count 0-99

        // Test: Wrap around at 99
        #40;    // Show wrap around

        // Test: Synchronous reset
        #10 reset = 1;
        #10 reset = 0;
        #10 enable = 1;
        #200;   // Count to 10

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Enable=%b | Count=%d%d", 
                 $time, clk, enable, tens, units);
    end

endmodule
