// Binary/Gray converters - PDF pages 16-19
module binary_to_gray #(parameter WIDTH=4)(input [WIDTH-1:0] binary,output [WIDTH-1:0] gray);
    assign gray = binary ^ (binary >> 1);
endmodule
module gray_to_binary #(parameter WIDTH=4)(input [WIDTH-1:0] gray,output [WIDTH-1:0] binary);
    genvar i;
    generate for(i=0;i<WIDTH;i=i+1) begin: GEN_G2B
        assign binary[i] = ^(gray >> i);
    end endgenerate
endmodule
