Source Code : Gate Level Modelling

module NOT_gatelevelmodelling(y,a);
//port declaration
output y;
input a;
//logic
not x1(y,a);
endmodule

Test Bench : Gate Level Modelling

module NOT_gatelevelmodelling_TB;

	// Inputs
	reg a;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	NOT_gatelevelmodelling notgate(y,a);

	initial 
	begin
	$monitor($time,"y=%b,a=%b",y,a);
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 1;
        
	end
      
endmodule
..............................................................................................................................................................
Source Code : Data Flow Modelling

module NOT_dataflowmodelling(y,a);
//port declaration
output y;
input a;
//Data Flow Modelling
assign y=~a;
endmodule

Test Bench : Data Flow Modelling

module NOT_dataflowmodelling_TB;

	// Inputs
	reg a;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	NOT_dataflowmodelling notgate(y,a);

	initial 
	begin
	$monitor($time,"y=%b,a=%b",y,a);
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 1;
        
		// Add stimulus here

	end
      
endmodule
..............................................................................................................................................................
Source Code : Behavioural Modelling

module NOT_behaviouralmodelling(y,a);
//port declaration
output y;
input a;
reg y;
//In Behavioural Modelling outputs should be declared as registers 'reg'
//Behavioural Modelling
always@(a)
y = ~a;
endmodule

Test Bench : Behavioural Modelling

module NOT_behaviouralmodelling_TB;

	// Inputs
	reg a;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	NOT_behaviouralmodelling notgate(y,a);

	initial 
	begin
	$monitor($time,"y=%b,a=%b",y,a);
		// Initialize Inputs
		a = 0;

		// Wait 100 ns for global reset to finish
		#100 a = 1;   		
	end
endmodule

