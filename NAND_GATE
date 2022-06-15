Source Code : Gate Level Modelling

module nand_gatelevelmodelling(y,a,b);
//port declaration
output y;
input a,b;
//logic.....Gate Level Modelling
nand x1(y,a,b);
endmodule

Test Bench : Gate Level Modelling

module nand_gatelevelmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	nand_gatelevelmodelling uut (
		.y(y), 
		.a(a), 
		.b(b)
	);

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

module nand_dataflowmodelling(y,a,b);
//port declaration
output y;
input a,b;
//logic........Data flow modelling......continuous assignment statement
assign y = ~(a&b);
endmodule

Test Bench : Data Flow Modelling

module nand_dataflowmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	nand_dataflowmodelling uut (
		.y(y), 
		.a(a), 
		.b(b)
	);

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

module nand_behaviouralmodelling(y,a,b);
//port declaration
output y;
input a,b;
//logic......Behavioural Modelling
reg y;
always@(a or b)
y = ~(a&b);
endmodule

Test Bench : Behavioural Modelling

module nand_behaviouralmodelling_TB;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	nand_behaviouralmodelling uut (
		.y(y), 
		.a(a), 
		.b(b)
	);

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
