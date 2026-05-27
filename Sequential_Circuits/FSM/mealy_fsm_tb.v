// Testbench for Mealy FSM (Traffic Light Controller)

module mealy_fsm_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg sensor;
    wire red, yellow, green;

    // Instantiate the Mealy FSM
    mealy_fsm uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .sensor(sensor),
        .red(red),
        .yellow(yellow),
        .green(green)
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
        sensor = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: Stay in RED state (no sensor)
        #100 sensor = 0;

        // Test: Sensor detected, transition to GREEN
        #60 sensor = 1;  // Vehicle detected
        #100;            // Wait in RED

        // Test: Transition to YELLOW and back to RED
        #100;            // GREEN for some time

        // Test: Multiple cycles
        #100 sensor = 0;
        #100;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Sensor=%b | Red=%b | Yellow=%b | Green=%b | State=%s", 
                 $time, clk, sensor, red, yellow, green,
                 (uut.current_state == 2'b00 ? "RED" :
                  uut.current_state == 2'b01 ? "GREEN" :
                  uut.current_state == 2'b10 ? "YELLOW" : "UNKNOWN"));
    end

endmodule
