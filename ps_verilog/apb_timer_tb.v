module apb_timer_tb;

  // Clock and reset
  reg PCLK, PCLKG, PRESETn;
  reg PSEL, PENABLE, PWRITE;
  reg [11:2] PADDR;
  reg [31:0] PWDATA;
  reg [3:0] ECOREVNUM = 4'hA;
  reg EXTIN;

  wire [31:0] PRDATA;
  wire PREADY;
  wire PSLVERR;
  wire TIMERINT;

  // Instantiate DUT
  apb_timer uut (
    .PCLK(PCLK),
    .PCLKG(PCLKG),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PADDR(PADDR),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PWDATA(PWDATA),
    .ECOREVNUM(ECOREVNUM),
    .PRDATA(PRDATA),
    .PREADY(PREADY),
    .PSLVERR(PSLVERR),
    .EXTIN(EXTIN),
    .TIMERINT(TIMERINT)
  );

  // Clock generation (10ns period)
  initial begin
    PCLK = 0;
    forever #5 PCLK = ~PCLK;
  end

  // Gated clock follows PCLK in this test
  always @(*) PCLKG = PCLK;

  // Reset logic
  initial begin
    PRESETn = 0;
    #20 PRESETn = 1;
  end

  // APB Task: Write
  task apb_write(input [11:2] addr, input [31:0] data);
    begin
      @(posedge PCLK);
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 1;
      PADDR   = addr;
      PWDATA  = data;
      @(posedge PCLK);
      PENABLE = 1;
      @(posedge PCLK);
      PSEL = 0; PENABLE = 0; PWRITE = 0;
    end
  endtask

  // APB Task: Read
  task apb_read(input [11:2] addr);
    begin
      @(posedge PCLK);
      PSEL    = 1;
      PENABLE = 0;
      PWRITE  = 0;
      PADDR   = addr;
      @(posedge PCLK);
      PENABLE = 1;
      @(posedge PCLK);
      $display("Read from 0x%0h = 0x%0h", {addr, 2'b00}, PRDATA);
      PSEL = 0; PENABLE = 0;
    end
  endtask

  // Test sequence
  initial begin
    $dumpfile("apb_timer.vcd");
    $dumpvars(0, apb_timer_tb);

    // Wait for reset deassertion
    wait (PRESETn == 1);
    @(posedge PCLK);

    // Initialize inputs
    PSEL = 0; PENABLE = 0; PWRITE = 0;
    PADDR = 0; PWDATA = 0;
    EXTIN = 0;

    // Set reload value to 10
    apb_write(10'h002, 32'd10); // Reload value at offset 0x08
    // Set control: enable timer (bit 0) and interrupt (bit 3)
    apb_write(10'h000, 32'b00001001); // Control register at offset 0x00

    // Read back control and reload values
    apb_read(10'h000); // Control
    apb_read(10'h002); // Reload value

    // Let timer run
    repeat (20) @(posedge PCLK);

    // Clear interrupt
    apb_write(10'h003, 32'b1); // Clear interrupt bit at offset 0x0C

    // End simulation
    repeat (5) @(posedge PCLK);
    $finish;
  end

endmodule

