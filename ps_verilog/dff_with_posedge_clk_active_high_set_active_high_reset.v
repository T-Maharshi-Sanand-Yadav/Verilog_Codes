module  dff_with_posedge_clk_active_high_set_active_high_reset (q, qbar, d, clk, set, reset);
  output q, qbar;
  input d, clk, set, reset;
  wire dbar, w1, w2, w3, w4;

  // Invert D
  not (dbar, d);

  // Clock gating with D and ~D
  nand (w1, d, clk);       // Set input of latch
  nand (w2, dbar, clk);    // Reset input of latch

  // SR latch with async set and reset (active high)
  nand (w3, w1, qbar, ~set);   // Forces q = 1 if set = 1
  nand (w4, w2, q, ~reset);    // Forces q = 0 if reset = 1

  assign q = w3;
  assign qbar = w4;
endmodule

