// 1010 sequence detectors corresponding to PDF pages 71-79
module mealy_1010_nonoverlap(input clk,rst_n,x,output reg z);
 localparam A=2'd0,B=2'd1,C=2'd2,D=2'd3; reg [1:0] state,next;
 always @(posedge clk or negedge rst_n) if(!rst_n) state<=A; else state<=next;
 always @(*) begin z=0; next=state; case(state) A:next=x?B:A; B:next=x?B:C; C:next=x?D:A; D:begin z=~x;next=A;end endcase end
endmodule
module mealy_1010_overlap(input clk,rst_n,x,output reg z);
 localparam A=2'd0,B=2'd1,C=2'd2,D=2'd3; reg [1:0] state,next;
 always @(posedge clk or negedge rst_n) if(!rst_n) state<=A; else state<=next;
 always @(*) begin z=0; next=state; case(state) A:next=x?B:A; B:next=x?B:C; C:next=x?D:A; D:begin z=~x;next=x?B:C;end endcase end
endmodule
module moore_1010_overlap(input clk,rst_n,x,output z);
 localparam A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4; reg [2:0] state,next; assign z=(state==E);
 always @(posedge clk or negedge rst_n) if(!rst_n) state<=A; else state<=next;
 always @(*) case(state) A:next=x?B:A;B:next=x?B:C;C:next=x?D:A;D:next=x?B:E;E:next=x?D:A;default:next=A;endcase
endmodule
module moore_1010_nonoverlap(input clk,rst_n,x,output z);
 localparam A=3'd0,B=3'd1,C=3'd2,D=3'd3,E=3'd4; reg [2:0] state,next; assign z=(state==E);
 always @(posedge clk or negedge rst_n) if(!rst_n) state<=A; else state<=next;
 always @(*) case(state) A:next=x?B:A;B:next=x?B:C;C:next=x?D:A;D:next=x?B:E;E:next=x?B:A;default:next=A;endcase
endmodule
