module fulladder_behaviouralmodelling_tb;
  reg a, b, cin;
  wire sum, carry;

  fulladder_behaviouralmodelling UUT (sum, carry, a, b, cin);

  initial begin
    $monitor("Time=%0t a=%b b=%b cin=%b | sum=%b carry=%b", $time, a, b, cin, sum, carry);
    a=0; b=0; cin=0; #10;
    a=0; b=0; cin=1; #10;
    a=0; b=1; cin=0; #10;
    a=0; b=1; cin=1; #10;
    a=1; b=0; cin=0; #10;
    a=1; b=0; cin=1; #10;
    a=1; b=1; cin=0; #10;
    a=1; b=1; cin=1; #10;
    $finish;
  end
endmodule
