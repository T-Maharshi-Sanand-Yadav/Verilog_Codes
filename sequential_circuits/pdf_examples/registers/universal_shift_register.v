// Universal shift register - based on PDF pages 61-64
module universal_shift_reg #(parameter WIDTH=4)(input clk,rst_n,input [1:0] sel,input serial_left,serial_right,input [WIDTH-1:0] parallel_in,output reg [WIDTH-1:0] q);
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) q<={WIDTH{1'b0}};
  else case(sel)
   2'b00:q<=q;
   2'b01:q<={serial_right,q[WIDTH-1:1]};
   2'b10:q<={q[WIDTH-2:0],serial_left};
   2'b11:q<=parallel_in;
  endcase
 end
endmodule
