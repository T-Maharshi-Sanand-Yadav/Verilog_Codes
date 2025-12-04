//==================================================================================//
// 4x2 Priority Encoder – Gate-level Modelling
//==================================================================================//
module priority_encoder_4x2 (
    output Y1,
    output Y0,
    input  I3,
    input  I2,
    input  I1
);

    wire nI2, and_term;

    not  U1 (nI2, I2);           // nI2 = ~I2
    and  U2 (and_term, nI2, I1); // and_term = ~I2 & I1

    or   U3 (Y1, I2, I3);        // Y1 = I2 + I3
    or   U4 (Y0, I3, and_term);  // Y0 = I3 + (~I2 & I1)

endmodule

//==================================================================================//
// 4x2 Priority Encoder – Dataflow Modelling
//==================================================================================//
module priority_encoder_4x2 (
    output Y1,
    output Y0,
    input  I3,
    input  I2,
    input  I1
);

    assign Y1 = I2 | I3;
    assign Y0 = I3 | ((~I2) & I1);

endmodule

//==================================================================================//
// 4x2 Priority Encoder – Behavioral Modelling
//==================================================================================//
module priority_encoder_4x2 (
    output reg Y1,
    output reg Y0,
    input      I3,
    input      I2,
    input      I1
);

    always @(*) begin
        Y1 = I2 | I3;
        Y0 = I3 | ((~I2) & I1);
    end

endmodule

//==================================================================================//
// Testbench for 4x2 Priority Encoder
//==================================================================================//
`timescale 1ns/1ps

module priority_encoder_4x2_tb;

    reg  I3, I2, I1, I0;   // Inputs
    wire Y1, Y0;           // Outputs

    // DUT instance
    priority_encoder_4x2 dut (
        .I3(I3),
        .I2(I2),
        .I1(I1),
        .Y1(Y1),
        .Y0(Y0)
    );

    integer k;

    initial begin
        // VCD dump
        $dumpfile("dump.vcd");
        $dumpvars(0, priority_encoder_4x2_tb);

        $display("I3 I2 I1 I0 | Y1 Y0");
        $display("-------------------");

        for (k = 0; k < 16; k = k + 1) begin
            {I3, I2, I1, I0} = k[3:0];   // 0000 to 1111
            #10;
            $display(" %b  %b  %b  %b |  %b  %b",
                     I3, I2, I1, I0, Y1, Y0);
        end

        $finish;
    end

endmodule
//==================================================================================//
