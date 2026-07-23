// Demultiplexer examples - PDF pages 29-33
module demux_1_2(input d,input sel,output y0,y1); assign y0=d&~sel; assign y1=d&sel; endmodule
module demux_1_4(input d,input [1:0] sel,output reg [3:0] y);
 always @(*) begin y=4'b0000; case(sel) 2'b00:y[0]=d;2'b01:y[1]=d;2'b10:y[2]=d;2'b11:y[3]=d; endcase end
endmodule
module demux_1_4_struct(input d,input [1:0] sel,output y0,y1,y2,y3);
 wire a,b; demux_1_2 s0(d,sel[1],a,b); demux_1_2 s1(a,sel[0],y0,y1); demux_1_2 s2(b,sel[0],y2,y3);
endmodule
