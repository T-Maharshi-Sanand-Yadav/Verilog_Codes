Source Code : Gate Level Modelling

module or_gatelevelmodelling(y,a,b);
//port declartaion
output y;
input a,b;
//logic
or x1(y,a,b);
endmodule

Test Bench : Gate Level Modelling

module or_gatelevelmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	or_gatelevelmodelling orgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 0;
		#100 b = 1;
        
		#100 a = 1;
		#100 b = 0;
		
		#100 a = 1;
		#100 b = 1;

	end
      
endmodule
..............................................................................................................................................................
Source Code : Data Flow Modelling

module or_dataflowmodelling(y,a,b);
//port declaration
output y;
input a,b;
assign y = a | b;
endmodule

Test Bench : Data Flow Modelling

module or_dataflowmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	or_dataflowmodelling orgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 0;
		#100 b = 1;
        
		#100 a = 1;
		#100 b = 0;
		
		#100 a = 1;
		#100 b = 1;

	end
      
endmodule
..............................................................................................................................................................
Source Code : Behavioural Modelling

module or_behaviouralmodelling(y,a,b);
//port declaration
output y;
input a,b;
reg y;
//behaviouralmodelling
always@(a or b)
y = a | b;
endmodule

Test Bench : Behavioural Modelling

module or_behaviouralmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	or_behaviouralmodelling orgate(y,a,b);

	initial 
	begin
	$monitor($time,"y=%b,a=%b,b=%b",y,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 0;
		#100 b = 1;
        
		#100 a = 1;
		#100 b = 0;
		
		#100 a = 1;
		#100 b = 1;

	end
      
endmodule

