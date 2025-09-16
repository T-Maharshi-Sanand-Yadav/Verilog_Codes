// ========================================================
// CLKBUFX1, CLKBUFX2, CLKBUFX3, CLKBUFX4, CLKBUFX8, CLKBUFX12, CLKBUFX16, CLKBUFX20
// Clock Buffer Cells in Verilog
// ========================================================

module CLKBUFX1 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX2 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX3 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX4 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX8 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX12 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX16 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module CLKBUFX20 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

// ========================================================
// CLKBUFX1, CLKBUFX2, CLKBUFX3, CLKBUFX4, CLKBUFX8, CLKBUFX12, CLKBUFX16, CLKBUFX20
// TEST BENCH
// ========================================================
`timescale 1ns/1ps

module CLKBUFX_tb;
    reg CLK;
    wire Y1, Y2, Y3, Y4, Y8, Y12, Y16, Y20;

    // Instantiate all clock buffer modules
    CLKBUFX1  bufX1  (.A(CLK), .Y(Y1));
    CLKBUFX2  bufX2  (.A(CLK), .Y(Y2));
    CLKBUFX3  bufX3  (.A(CLK), .Y(Y3));
    CLKBUFX4  bufX4  (.A(CLK), .Y(Y4));
    CLKBUFX8  bufX8  (.A(CLK), .Y(Y8));
    CLKBUFX12 bufX12 (.A(CLK), .Y(Y12));
    CLKBUFX16 bufX16 (.A(CLK), .Y(Y16));
    CLKBUFX20 bufX20 (.A(CLK), .Y(Y20));

    // Generate clock
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK; // 10ns period clock
    end

    // Monitor outputs
    initial begin
        $display("Time\tCLK\tY1 Y2 Y3 Y4 Y8 Y12 Y16 Y20");
        $monitor("%0dns\t%b\t%b  %b  %b  %b  %b  %b   %b   %b", 
                 $time, CLK, Y1, Y2, Y3, Y4, Y8, Y12, Y16, Y20);
        #50;  // Run simulation for 50ns
        $finish;
    end
endmodule
