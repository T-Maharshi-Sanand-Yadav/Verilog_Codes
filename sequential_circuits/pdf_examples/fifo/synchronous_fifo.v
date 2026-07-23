// Synchronous FIFO - based on PDF pages 80-89
module synchronous_fifo #(parameter DEPTH=8, DATA_WIDTH=8, ADDR_WIDTH=3)(input clk,rst_n,input wr_en,rd_en,input [DATA_WIDTH-1:0] data_in,output reg [DATA_WIDTH-1:0] data_out,output full,empty);
 reg [DATA_WIDTH-1:0] fifo[0:DEPTH-1]; reg [ADDR_WIDTH:0] count; reg [ADDR_WIDTH-1:0] w_ptr,r_ptr;
 assign full=(count==DEPTH); assign empty=(count==0);
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin w_ptr<=0;r_ptr<=0;count<=0;data_out<=0; end
  else begin
   if(wr_en && !full) begin fifo[w_ptr]<=data_in;w_ptr<=w_ptr+1'b1;end
   if(rd_en && !empty) begin data_out<=fifo[r_ptr];r_ptr<=r_ptr+1'b1;end
   case({wr_en&&!full,rd_en&&!empty}) 2'b10:count<=count+1'b1;2'b01:count<=count-1'b1;default:count<=count;endcase
  end
 end
endmodule
