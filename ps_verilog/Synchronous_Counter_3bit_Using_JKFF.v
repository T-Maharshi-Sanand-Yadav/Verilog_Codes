`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:02:50 08/23/2021 
// Design Name: 
// Module Name:    Synchronous_Counter_3bit_Using_JKFF 
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
module Synchronous_Counter_3bit_Using_JKFF(
    input [2:0] j,
    input [2:0] k,
    input clk,
    output [2:0] q
    );
//assign j[0]=1'b1;
//assign k[0]=1'b1;
//assign j[1]=q[0];
//assign k[1]=q[0];
//assign j[2]=q[1]&q[0];
//assign k[2]=q[1]&q[0];

JKFF No0(q[0],1'b1,1'b1,clk);
JKFF No1(q[1],q[0],q[0],clk);
JKFF No2(q[2],q[1]&q[0],q[1]&q[0],clk);


endmodule
