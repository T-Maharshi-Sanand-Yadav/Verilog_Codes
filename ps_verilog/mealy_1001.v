module mealy_1001(x, clk, rst, y, present_state, next_state);
  input x;
  input clk;
  input rst;
  output y;
  output [1:0] present_state;
  output [1:0] next_state;

  reg [1:0] present_state;
  reg [1:0] next_state;
  reg y;

  parameter [1:0] a = 2'b00, b = 2'b01, c = 2'b10, d = 2'b11;

  // State register with async reset (active high)
  always @(posedge clk) begin
    if (rst)
      present_state <= a;
    else
      present_state <= next_state;
  end

  // Next-state logic
  always @(present_state, x) begin
    case (present_state)
      a: if (x)
            next_state <= b;
         else
            next_state <= a;
      b: if (~x)
            next_state <= c;
         else
            next_state <= b;
      c: if (~x)
            next_state <= d;
         else
            next_state <= b;
      d: if (x)
            next_state <= b;
         else
            next_state <= a;
      default: next_state <= a;
    endcase
  end

  // Output logic
  always @(present_state, next_state, x) begin
    if (present_state == d && next_state == b)
      y = 1'b1;
    else
      y = 1'b0;
  end

endmodule

