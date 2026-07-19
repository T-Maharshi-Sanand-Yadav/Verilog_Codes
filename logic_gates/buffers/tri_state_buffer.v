// ========================================================
// TBUFX1, TBUFX2, TBUFX4
// Tri-State Buffer Cells in Verilog
// ========================================================

module TBUFX1 (
    input  wire A,
    input  wire EN,  // Enable signal
    output wire Y
);
    assign Y = EN ? A : 1'bz;  // High-impedance when EN=0
endmodule

module TBUFX2 (
    input  wire A,
    input  wire EN,
    output wire Y
);
    assign Y = EN ? A : 1'bz;
endmodule

module TBUFX4 (
    input  wire A,
    input  wire EN,
    output wire Y
);
    assign Y = EN ? A : 1'bz;
endmodule

// ========================================================
// TBUFX1, TBUFX2, TBUFX4
// Tri-State Buffer Cells TESTBENCH in Verilog
// ========================================================

`timescale 1ns/1ps

module TBUFX_tb;
    reg A, EN;
    wire Y1, Y2, Y4;

    // Instantiate tri-state buffer modules
    TBUFX1 bufX1 (.A(A), .EN(EN), .Y(Y1));
    TBUFX2 bufX2 (.A(A), .EN(EN), .Y(Y2));
    TBUFX4 bufX4 (.A(A), .EN(EN), .Y(Y4));

    initial begin
        // Initialize signals
        A = 0; EN = 0;
        #10; A = 1; EN = 0;   // Disabled, output should be Z
        #10; EN = 1;           // Enabled, output follows A
        #10; A = 0;
        #10; A = 1;
        #10; EN = 0;           // Disabled again
        #10;
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tA EN\tY1 Y2 Y4");
        $monitor("%0dns\t%b %b\t%b  %b  %b", $time, A, EN, Y1, Y2, Y4);
    end
endmodule
