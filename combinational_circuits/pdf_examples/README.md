# Verilog Coding Examples PDF Integration

This directory contains cleaned educational RTL corresponding to the combinational-design topics in the uploaded 98-page **Verilog Examples** PDF.

## Integrated topics

- Half Adder + testbench
- Full Adder + testbench
- Half Subtractor + testbench
- Full Subtractor + testbench
- Ripple Carry Adder
- 4-bit / parameterized Adder-Subtractor
- Binary-to-Gray and Gray-to-Binary converters
- 2:1, 3:1 and 4:1 multiplexers, including structural 4:1 MUX
- 1:2 and 1:4 demultiplexers, including structural 1:4 DEMUX
- 8:3 Binary Encoder
- 8:3 Priority Encoder
- 3:8 Binary Decoder
- 4-bit Comparator
- Array Multiplier topic

## Important source note

The PDF contains a mixture of Verilog and SystemVerilog syntax and some apparent typographical/code issues. For example, its Half Adder declares `s` but assigns `S`, producing `z` for sum in the shown output. Files here are cleaned/adapted educational implementations rather than byte-for-byte OCR copies. Topic names and intended behavior follow the PDF; obvious naming/syntax issues are normalized for repository use.

Sequential examples from the same PDF are under `sequential_circuits/pdf_examples/`.
