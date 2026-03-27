module input_to_output (
    input wire in1,
    input wire in2,
    output wire out
);
    assign out = in1 & in2;  // Input to Output via combinational logic
endmodule
