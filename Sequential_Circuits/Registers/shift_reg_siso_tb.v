// Testbench for Shift Register SISO

module shift_reg_siso_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg serial_in;
    wire serial_out;

    // Instantiate the Shift Register SISO
    shift_reg_siso uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
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
        serial_in = 0;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Shift in data: 1010
        #10 serial_in = 1;  // Shift 1
        #10 serial_in = 0;  // Shift 0
        #10 serial_in = 1;  // Shift 1
        #10 serial_in = 0;  // Shift 0

        // Shift in data: 1111
        #10 serial_in = 1;  // Shift 1
        #10 serial_in = 1;  // Shift 1
        #10 serial_in = 1;  // Shift 1
        #10 serial_in = 1;  // Shift 1

        // Shift in data: 0000
        #10 serial_in = 0;  // Shift 0
        #10 serial_in = 0;  // Shift 0
        #10 serial_in = 0;  // Shift 0
        #10 serial_in = 0;  // Shift 0

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Serial_In=%b | Serial_Out=%b", 
                 $time, clk, serial_in, serial_out);
    end

endmodule
