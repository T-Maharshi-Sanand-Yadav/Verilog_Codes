module nor_allmodels_tb;
  reg a, b;
  wire y_gate, y_data, y_beh;

  // Instantiations
  nor_gatelevelmodelling u1(y_gate, a, b);
  nor_dataflowmodelling  u2(y_data, a, b);
  nor_behaviouralmodelling u3(y_beh, a, b);

  initial begin
    $monitor("Time=%0t a=%b b=%b | Gate=%b Data=%b Beh=%b",
             $time, a, b, y_gate, y_data, y_beh);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;
    $finish;
  end
endmodule
