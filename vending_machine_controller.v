SOURCE CODE:

  module vending_machine_controller(present_state,next_state,clock,reset,x,z);
  output [1:0] present_state;
  output [1:0] next_state;
  input x;
  output z;
  input clock;
  input reset;
  reg [1:0] present_state;
  reg [1:0] next_state;
  reg z;
  parameter[1:0] s0=2'b00,s1=2'b01,s2=2'b10;

  always@(posedge clock)
  begin
    if (reset)
      present_state <= s0;
    else
      present_state <= next_state;
  end

  always@(present_state,x,z)
  begin
    case(present_state)

    2'b00: if(x==2'b00)
    begin
      next_state <= s0;
      z<=1'b0;
    end
    else if(x==2'b01)
    begin
      next_state <= s1;
      z<=1'b0;
    end	
    else if(x==2'b10)
    begin
      next_state <= s2;
      z<=1'b0;
    end	

  2'b01: if(x==2'b00)
    begin
      next_state <= s0;
      z<=1'b0;
    end
    else if(x==2'b01)
    begin
      next_state <= s2;
      z<=1'b0;
    end	
    else if(x==2'b10)
    begin
      next_state <= s0;
      z<=1'b1;
    end

  2'b10: if(x==2'b00)
    begin
      next_state <= s0;
      z<=1'b0;
    end
    else if(x==2'b01)
    begin
      next_state <= s0;
      z<=1'b1;
    end	
    else if(x==2'b10)
    begin
      next_state <= s0;
      z<=1'b1;
    end
    endcase
    end
  endmodule



TEST BENCH:

  module vending_machine_controller_TB;

    // Inputs
    reg clock;
    reg reset;
    reg x;

    // Outputs
    wire [1:0] present_state;
    wire [1:0] next_state;
    wire z;

    // Instantiate the Unit Under Test (UUT)
    vending_machine_controller uut (
      .present_state(present_state), 
      .next_state(next_state), 
      .clock(clock), 
      .reset(reset), 
      .x(x), 
      .z(z)
    );
  initial 
    begin
    $monitor($time,"reset=%b,clock=%b,present_state=%b,x=%b,next_state=%b,z=%b",reset,clock,present_state,x,next_state,z);
      // Initialize Inputs
        clock=1'b0;
        reset=1'b1;
        x=1'b0;
      #7  reset=1'b0;
      #10 x=1'b0;
      #10 x=1'b1;
      #10 x=1'b0;
      #10 x=1'b0;
      #5  x=1'b1;
      #10 x=1'b0;
      #10 x=1'b0;
      #10 x=1'b1;
      #10 x=1'b0;
      #10 x=1'b0;
      #10 x=1'b0;
      #10 x=1'b0;
      #10 x=1'b0;
      #10 x=1'b1;  
    end
  always #5 clock=~clock;
  endmodule
