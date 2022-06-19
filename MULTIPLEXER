module multiplexer_4x1(y,i,s);
output reg y;
input [3:0]i;
input [1:0]s;
always@(i or s)
begin
case(s)
2'b00:y=i[0];
2'b01:y=i[1];
2'b10:y=i[2];
2'b11:y=i[3];
endcase
end
endmodule


module multiplexer_4x1_tb;

	// Inputs
	reg [3:0] i;
	reg [1:0] s;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	multiplexer_4x1 uut (
		.y(y), 
		.i(i), 
		.s(s)
	);

	initial 
	begin
	$monitor($time,"s=%b,i=%b,y=%b",s,i,y);
		// Initialize Inputs
		i = 0;
		s = 0;
	end
	always #5 s = s + 1;      
	always #10 i = i + 1;
endmodule
