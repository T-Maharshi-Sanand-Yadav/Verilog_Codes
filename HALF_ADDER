Source Code : Gate Level Modelling

module halfadder_gatelevelmodelling(sum,carry,a,b);
//port declaration
output sum,carry;
input a,b;
//Logic>>>>>>Gate level modelling
xor x1(sum,a,b);
and x2(carry,a,b);
endmodule

Test Bench : Gate Level Modelling

module halfadder_gatelevelmodelling_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	halfadder_gatelevelmodelling uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b)
	);

	initial 
	begin
	$monitor($time,"sum=%b,carry=%b,a=%b,b=%b",sum,carry,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

	end
	always #10 a = a + 1;
	always #5 b = b + 1;
      
endmodule

..............................................................................................................................................................
Source Code : Data Flow Modelling

module halfadder_dataflowmodelling(sum,carry,a,b);
//port declaration
output sum,carry;
input a,b;
//logic.......data flow modelling
assign sum = a ^ b;
assign carry = a & b;
endmodule

Test Bench : Data Flow Modelling

module halfadder_dataflowmodelling_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	halfadder_dataflowmodelling uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b)
	);

	initial 
	begin
	$monitor($time,"sum=%b,carry=%b,a=%b,b=%b",sum,carry,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

	end
	always #10 a = a + 1;
	always #5 b = b + 1;
      
endmodule



..............................................................................................................................................................
Source Code : Behavioural Modelling

module halfadder_behaviouralmodelling(sum,carry,a,b);
output sum;
output carry;
input a;
input b;
	reg sum,carry;
	always@(a or b)
	{carry,sum} = a + b;
endmodule

Test Bench : Behavioural Modelling

module halfadder_tb;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	halfadder_behaviouralmodelling uut (
		.sum(sum), 
		.carry(carry), 
		.a(a), 
		.b(b)
	);

	initial 
	begin
	$monitor($time,"sum=%b,carry=%b,a=%b,b=%b",sum,carry,a,b);
		// Initialize Inputs
		a = 0;
		b = 0;

	end
	always #10 a = a + 1;
	always #5 b = b + 1;
      
endmodule

