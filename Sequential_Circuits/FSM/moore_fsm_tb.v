// Testbench for Moore FSM

module moore_fsm_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg data_in;
    wire detected;

    // Instantiate the Moore FSM
    moore_fsm uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .data_in(data_in),
        .detected(detected)
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
        data_in = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: Input sequence 1 0 1 (should detect)
        #10 data_in = 1;  // First 1
        #10 data_in = 0;  // Then 0
        #10 data_in = 1;  // Then 1 (should detect "101")
        #10 data_in = 0;

        // Test: Input sequence 1 0 1 0 1 (should detect twice)
        #10 data_in = 1;  // First 1
        #10 data_in = 0;  // Then 0
        #10 data_in = 1;  // Then 1 (should detect "101")
        #10 data_in = 0;  // Then 0
        #10 data_in = 1;  // Then 1 (should detect "101" again)
        #10 data_in = 0;

        // Test: Input sequence 1 1 0 1 (should detect once)
        #10 data_in = 1;  // First 1
        #10 data_in = 1;  // Stay at S1
        #10 data_in = 0;  // Then 0
        #10 data_in = 1;  // Then 1 (should detect "101")
        #10 data_in = 0;

        // Test: No detection sequence 1 1 0 0
        #10 data_in = 1;  // First 1
        #10 data_in = 1;  // Stay at S1
        #10 data_in = 0;  // Then 0
        #10 data_in = 0;  // No detection
        #10 data_in = 0;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Data_In=%b | Detected=%b | State=%s", 
                 $time, clk, data_in, detected, 
                 (uut.current_state == 2'b00 ? "IDLE" : 
                  uut.current_state == 2'b01 ? "S1" : 
                  uut.current_state == 2'b10 ? "S2" : "UNKNOWN"));
    end

endmodule
