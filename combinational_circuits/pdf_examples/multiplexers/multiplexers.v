// Multiplexer examples - PDF pages 20-28
module mux_2_1(input sel,input i0,i1,output y); assign y=sel?i1:i0; endmodule
module mux_4_1(input [1:0] sel,input i0,i1,i2,i3,output reg y);
 always @(*) case(sel) 2'b00:y=i0;2'b01:y=i1;2'b10:y=i2;2'b11:y=i3;default:y=1'b0; endcase
endmodule
module mux_4_1_struct(input [1:0] sel,input i0,i1,i2,i3,output y);
 wire y0,y1; mux_2_1 m0(sel[0],i0,i1,y0); mux_2_1 m1(sel[0],i2,i3,y1); mux_2_1 m2(sel[1],y0,y1,y);
endmodule
module mux_3_1(input [1:0] sel,input i0,i1,i2,output reg y);
 always @(*) case(sel) 2'b00:y=i0;2'b01:y=i1;2'b10:y=i2;default:y=1'b0; endcase
endmodule
