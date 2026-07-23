// Flip-flop examples corresponding to PDF pages 48-60
module d_ff_async(input clk,rst_n,d,output reg q); always @(posedge clk or negedge rst_n) if(!rst_n) q<=1'b0; else q<=d; endmodule
module d_ff_sync(input clk,rst_n,d,output reg q); always @(posedge clk) if(!rst_n) q<=1'b0; else q<=d; endmodule
module sr_ff(input clk,rst_n,s,r,output reg q); always @(posedge clk or negedge rst_n) if(!rst_n) q<=1'b0; else case({s,r}) 2'b00:q<=q;2'b01:q<=1'b0;2'b10:q<=1'b1;default:q<=1'bx;endcase endmodule
module jk_ff(input clk,rst_n,j,k,output reg q); always @(posedge clk or negedge rst_n) if(!rst_n) q<=1'b0; else case({j,k}) 2'b00:q<=q;2'b01:q<=1'b0;2'b10:q<=1'b1;2'b11:q<=~q;endcase endmodule
module t_ff(input clk,rst_n,t,output reg q); always @(posedge clk or negedge rst_n) if(!rst_n) q<=1'b0; else if(t) q<=~q; endmodule
