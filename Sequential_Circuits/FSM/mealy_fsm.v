// Mealy FSM - Traffic Light Controller
// Controls traffic light based on sensor input

module mealy_fsm (
    input wire clk,           // Clock signal
    input wire reset,         // Synchronous reset
    input wire async_reset,   // Asynchronous reset
    input wire sensor,        // Vehicle sensor (1: vehicle detected, 0: no vehicle)
    output reg red,           // Red light
    output reg yellow,        // Yellow light
    output reg green          // Green light
);

    // State definitions
    parameter RED    = 2'b00;  // Red state
    parameter GREEN  = 2'b01;  // Green state
    parameter YELLOW = 2'b10;  // Yellow state

    reg [1:0] current_state, next_state;
    reg [3:0] timer;            // Timer for state transitions

    // Sequential logic
    always @(posedge clk or negedge async_reset) begin
        if (!async_reset) begin
            current_state <= RED;
            timer <= 4'b0000;
        end
        else if (reset) begin
            current_state <= RED;
            timer <= 4'b0000;
        end
        else begin
            current_state <= next_state;
            if (next_state != current_state)
                timer <= 4'b0000;
            else
                timer <= timer + 1;
        end
    end

    // Combinational logic for output and next state
    always @(*) begin
        // Default outputs
        red = 1'b0;
        yellow = 1'b0;
        green = 1'b0;
        next_state = current_state;

        case (current_state)
            RED: begin
                red = 1'b1;
                if (sensor && timer > 4'd5)  // Wait for vehicle
                    next_state = GREEN;
            end
            GREEN: begin
                green = 1'b1;
                if (timer > 4'd7)  // Green for 7 cycles
                    next_state = YELLOW;
            end
            YELLOW: begin
                yellow = 1'b1;
                if (timer > 4'd2)  // Yellow for 2 cycles
                    next_state = RED;
            end
            default: next_state = RED;
        endcase
    end

endmodule
