Source Code : Gate Level Modelling

module and_gatelevelmodelling(y,a,b);
//port declaration
output y;
input a,b;
//logic 
and x1(y,a,b);
endmodule


Test Bench : Gate Level Modelling
module and_gatelevelmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

and_gatelevelmodelling andgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;
	end
  always #10 a = a + 1;
  always #5 b = b + 1;
      
endmodule
..............................................................................................................................................................
Source Code : Data Flow Modelling

module and_dataflowmodelling(y,a,b);
output y;
input a,b;
assign y = a & b;
endmodule


Test Bench : Data Flow Modelling

module and_dataflowmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	and_dataflowmodelling andgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;
	end
    always #10 a = a + 1;
    always #5 b = b + 1; 
endmodule
..............................................................................................................................................................
Source Code : Behavioural Modelling

module and_behaviouralmodelling(y,a,b);
output y;
input a,b;
reg y;
always@(a or b)
y=a&b;
endmodule



Test Bench : Behavioural Modelling

module and_behaviouralmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	and_behaviouralmodelling andgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;
	end
    always #10 a = a + 1;
    always #5 b = b + 1;      
endmodule


