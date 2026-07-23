// 4x4 unsigned array-multiplier function - PDF array multiplier topic, pages 43-45
module array_multiplier_4bit(input [3:0] A,B,output [7:0] P);
 assign P = A * B;
endmodule
