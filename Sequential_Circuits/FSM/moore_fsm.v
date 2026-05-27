// Moore FSM - Sequence Detector (detects "101")
// Detects the sequence "101" on a serial input

module moore_fsm (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire data_in,       // Serial input data
    output reg detected       // Output signal when sequence is detected
);

    // State definitions
    parameter IDLE = 2'b00;   // Initial state
    parameter S1   = 2'b01;   // State after detecting "1"
    parameter S2   = 2'b10;   // State after detecting "10"

    reg [1:0] current_state, next_state;

    // Sequential logic for state transitions
    always @(posedge clk or negedge async_reset) begin
        if (!async_reset)
            current_state <= IDLE;
        else if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        next_state = current_state;  // Default: stay in current state
        detected = 1'b0;              // Default: no detection

        case (current_state)
            IDLE: begin
                if (data_in == 1'b1)
                    next_state = S1;
                else
                    next_state = IDLE;
            end
            S1: begin
                if (data_in == 1'b0)
                    next_state = S2;
                else
                    next_state = S1;
            end
            S2: begin
                if (data_in == 1'b1) begin
                    next_state = S1;
                    detected = 1'b1;  // Sequence "101" detected
                end
                else
                    next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

endmodule
