`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:13:37 08/23/2021 
// Design Name: 
// Module Name:    vending_machine_controller 
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
	