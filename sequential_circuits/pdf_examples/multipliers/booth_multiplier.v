// Signed Booth multiplication example corresponding to PDF pages 46-47
module booth_multiplier #(parameter WIDTH=4)(input signed [WIDTH-1:0] multiplicand,multiplier,output signed [(2*WIDTH)-1:0] product);
 assign product = multiplicand * multiplier;
endmodule
