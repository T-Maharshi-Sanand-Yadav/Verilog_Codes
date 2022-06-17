Source Code:

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:15 06/17/2022 
// Design Name: 
// Module Name:    moore_0100_sequence 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module moore_0100_sequence(Present_State,Next_State,x,z,clock,reset);
input clock;
input reset;
input x;
output reg z;
output reg[2:0]Present_State;
output reg[2:0]Next_State;
parameter[2:0] A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;

always @(posedge clock)
begin
if(reset==1)
Present_State<=A;
else
Present_State<=Next_State;
end

always @(Present_State,x)
begin
	case(Present_State)
		3'b000:begin
		if(x)
		Next_State<=A;
		else
		Next_State<=B;
		end
		
		3'b001:begin
		if(x)
		Next_State<=C;
		else
		Next_State<=B;
		end
		
		
		3'b010:begin
		if(x)
		Next_State<=A;
		else
		Next_State<=D;
		end
		
		3'b011:begin
		if(x)
		Next_State<=C;
		else
		Next_State<=E;
		end
		
		3'b100:begin
		if(x)
		Next_State<=C;
		else
		Next_State<=B;
		end
	endcase

end

always@(Present_State)
begin
	case(Present_State)
		A:z=1'b0;
		B:z=1'b0;
		C:z=1'b0;
		D:z=1'b0;
		D:z=1'b1;
	endcase
end

endmodule

.....................................................................................................................
Test Bench:

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:39:38 06/17/2022
// Design Name:   moore_0100_sequence
// Module Name:   D:/4. Verilog Program Execution/DSDV Lab/moore_0100_sequence/moore_0100_sequence_tb.v
// Project Name:  moore_0100_sequence
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: moore_0100_sequence
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module moore_0100_sequence_tb;

	// Inputs
	reg x;
	reg clock;
	reg reset;

	// Outputs
	wire [2:0] Present_State;
	wire [2:0] Next_State;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	moore_0100_sequence uut (
		.Present_State(Present_State), 
		.Next_State(Next_State), 
		.x(x), 
		.z(z), 
		.clock(clock), 
		.reset(reset)
	);

	initial 
	begin
	$monitor($time,"reset=%b,clock=%b,Present_State=%b,x=%b,Next_State=%b,z=%b",reset,clock,Present_State,x,Next_State,z);
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

