`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:23:44 08/23/2021 
// Design Name: 
// Module Name:    Synchronous_Counter_3bit_Using_DFF 
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
module Synchronous_Counter_3bit_Using_DFF(
	 input [2:0] d,
    input clk,
    output [2:0] q
    );
DFF No0(q[0],~q[0],clk);
DFF No1(q[1],(~q[1]&q[0])|(q[1]&~q[0]),clk);
DFF No2(q[2],(q[2]&~q[1])|(q[2]&~q[0])|(~q[2]&q[1]&q[0]),clk);
endmodule
