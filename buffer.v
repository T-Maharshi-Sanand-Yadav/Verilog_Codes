// ========================================================
// BUFX1, BUFX2, BUFX3, BUFX4, BUFX8, BUFX12, BUFX16, BUFX20
// Simple Buffer Cells in Verilog
// ========================================================

module BUFX1 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX2 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX3 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX4 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX8 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX12 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX16 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

module BUFX20 (
    input  wire A,
    output wire Y
);
    assign Y = A;
endmodule

// ========================================================
// BUFX1, BUFX2, BUFX3, BUFX4, BUFX8, BUFX12, BUFX16, BUFX20
// TEST BENCH
// ========================================================
`timescale 1ns/1ps

module BUFX_tb;
    reg A;
    wire Y1, Y2, Y3, Y4, Y8, Y12, Y16, Y20;

    // Instantiate all buffer modules
    BUFX1  bufX1  (.A(A), .Y(Y1));
    BUFX2  bufX2  (.A(A), .Y(Y2));
    BUFX3  bufX3  (.A(A), .Y(Y3));
    BUFX4  bufX4  (.A(A), .Y(Y4));
    BUFX8  bufX8  (.A(A), .Y(Y8));
    BUFX12 bufX12 (.A(A), .Y(Y12));
    BUFX16 bufX16 (.A(A), .Y(Y16));
    BUFX20 bufX20 (.A(A), .Y(Y20));

    initial begin
        // Initialize input
        A = 0;
        #10;  // wait 10ns
        A = 1;
        #10;
        A = 0;
        #10;
        $finish;
    end

    // Monitor outputs
    initial begin
        $display("Time\tA\tY1 Y2 Y3 Y4 Y8 Y12 Y16 Y20");
        $monitor("%0dns\t%b\t%b  %b  %b  %b  %b  %b   %b   %b", 
                 $time, A, Y1, Y2, Y3, Y4, Y8, Y12, Y16, Y20);
    end
endmodule
