// 4-bit LFSR - PDF pages 65-66; taps 4 and 3
module lfsr_4bit(input clk,rst,output reg [3:0] op);
 always @(posedge clk) begin
  if(rst) op<=4'b0001;
  else op<={op[2:0],op[3]^op[2]};
 end
endmodule
