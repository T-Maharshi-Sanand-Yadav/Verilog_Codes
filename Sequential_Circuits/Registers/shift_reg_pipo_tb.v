// Testbench for Shift Register PIPO

module shift_reg_pipo_tb;
    reg clk;
    reg reset;
    reg async_reset;
    reg load;
    reg serial_in;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    // Instantiate the Shift Register PIPO
    shift_reg_pipo uut (
        .clk(clk),
        .reset(reset),
        .async_reset(async_reset),
        .load(load),
        .serial_in(serial_in),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
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
        load = 0;
        serial_in = 0;
        parallel_in = 4'b0000;

        // Apply asynchronous reset
        #10 async_reset = 0;
        #10 async_reset = 1;

        // Test: Load parallel data 1010
        #10 load = 1; parallel_in = 4'b1010;
        #10 load = 0;

        // Test: Shift in serial data 1111
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 1;
        #10 serial_in = 1;

        // Test: Load new parallel data 0101
        #10 load = 1; parallel_in = 4'b0101;
        #10 load = 0;

        // Test: Shift in serial data 1010
        #10 serial_in = 1;
        #10 serial_in = 0;
        #10 serial_in = 1;
        #10 serial_in = 0;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | CLK=%b | Load=%b | Serial_In=%b | Parallel_In=%b | Parallel_Out=%b", 
                 $time, clk, load, serial_in, parallel_in, parallel_out);
    end

endmodule
