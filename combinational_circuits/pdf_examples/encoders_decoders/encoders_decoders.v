// Encoder/decoder examples - PDF pages 34-40
module binary_encoder_8_3(input [7:0] D,output [2:0] y);
 assign y[2]=D[4]|D[5]|D[6]|D[7]; assign y[1]=D[2]|D[3]|D[6]|D[7]; assign y[0]=D[1]|D[3]|D[5]|D[7];
endmodule
module priority_encoder_8_3(input [7:0] D,output reg [2:0] y,output reg valid);
 always @(*) begin valid=1'b1; casex(D) 8'b1xxxxxxx:y=3'd7;8'b01xxxxxx:y=3'd6;8'b001xxxxx:y=3'd5;8'b0001xxxx:y=3'd4;8'b00001xxx:y=3'd3;8'b000001xx:y=3'd2;8'b0000001x:y=3'd1;8'b00000001:y=3'd0;default:begin y=3'd0;valid=1'b0;end endcase end
endmodule
module binary_decoder_3_8(input [2:0] D,output [7:0] y); assign y=8'b00000001<<D; endmodule
