`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:33 07/29/2021 
// Design Name: 
// Module Name:    Synchronous_Down_Counter_4bit 
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
module Synchronous_Down_Counter_4bit(q,clk,reset);
output [3:0]q;
  input clk;
  input reset;
  reg [3:0] q = 4'b1111;
  always@(posedge clk)
    begin
      if(reset)
        q <= 0;
      else 
        q <= q - 1;
     end
endmodule
