module fulladder_allmodels_tb;
  reg a, b, cin;
  wire sum_gate, carry_gate;
  wire sum_data, carry_data;
  wire sum_beh, carry_beh;

  fulladder_gatelevelmodelling U1(sum_gate, carry_gate, a, b, cin);
  fulladder_dataflowmodelling U2(sum_data, carry_data, a, b, cin);
  fulladder_behaviouralmodelling U3(sum_beh, carry_beh, a, b, cin);

  initial begin
    $monitor("Time=%0t a=%b b=%b cin=%b | Gate: sum=%b carry=%b | Dataflow: sum=%b carry=%b | Beh: sum=%b carry=%b",
              $time, a, b, cin, sum_gate, carry_gate, sum_data, carry_data, sum_beh, carry_beh);
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
