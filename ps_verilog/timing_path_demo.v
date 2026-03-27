module timing_path_demo (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        in1,
    input  wire        in2,
    output wire        out1,
    output wire        out2
);

    // Input → Register
    reg in_to_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            in_to_reg <= 1'b0;
        else
            in_to_reg <= in1;  // Case 1: Input to Register
    end

    // Combinational logic between registers
    wire comb1 = in_to_reg & in2;  // intermediate logic
    wire comb2 = in_to_reg | in2;

    // Register → Register
    reg reg_to_reg;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_to_reg <= 1'b0;
        else
            reg_to_reg <= comb1;  // Case 2: Register to Register
    end

    // Register → Output
    reg reg_to_out;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            reg_to_out <= 1'b0;
        else
            reg_to_out <= comb2;  // Case 3: Register to Output
    end
    assign out1 = reg_to_out;

    // Input → Output (Pure combinational)
    assign out2 = ~(in1 ^ in2);  // Case 4: Input to Output

endmodule

