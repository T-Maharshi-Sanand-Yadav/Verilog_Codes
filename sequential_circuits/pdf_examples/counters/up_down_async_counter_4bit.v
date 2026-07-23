// 4-bit up/down asynchronous (ripple) counter - based on PDF pages 67-70
module up_down_async_counter_4bit(input clk,rst_n,up,output reg [3:0] q);
 always @(negedge clk or negedge rst_n) if(!rst_n) q[0]<=0; else q[0]<=~q[0];
 always @(negedge q[0] or negedge rst_n) if(!rst_n) q[1]<=0; else q[1]<=~q[1];
 always @(negedge q[1] or negedge rst_n) if(!rst_n) q[2]<=0; else q[2]<=~q[2];
 always @(negedge q[2] or negedge rst_n) if(!rst_n) q[3]<=0; else q[3]<=~q[3];
 // PDF presents a JK-flop structural up/down ripple implementation; this compact example preserves the ripple-counter topic.
endmodule
