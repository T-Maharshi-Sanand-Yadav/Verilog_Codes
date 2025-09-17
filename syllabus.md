# 🧩 Logic Gates & Combinational Circuits

## 🔹 Logic Gates

* AND Gate == DoneOR Gate == Done
* NOT Gate (Inverter) == Done
* NAND Gate == Done
* NOR Gate == Done
* XOR Gate (Exclusive-OR) == Done
* XNOR Gate (Exclusive-NOR) == Done

---

## 🔹 Combinational Circuits

### 1️⃣ Arithmetic Circuits

* Half Adder == Done
* Full Adder == Done
* Ripple Carry Adder
  * 4-bit Ripple Carry Adder
  * 8-bit Ripple Carry Adder
  * 16-bit Ripple Carry Adder
* Carry Look Ahead Adder
  * 4-bit Carry Look Ahead Adder
  * 8-bit Carry Look Ahead Adder
  * 16-bit Carry Look Ahead Adder
* Carry Select Adder
  * 4-bit Carry Select Adder
  * 8-bitCarry Select Adder
  * 16-bitCarry Select Adder
* Carry Save Adder
  * 4-bit Carry Save Adder
  * 8-bit Carry Save Adder
  * 16-bit Carry Save Adder
* Brent Kung Adder
  * 4-bit Brent Kung Adder
  * 8-bit Brent Kung Adder
  * 16-bit Brent Kung Adder
* Kogge Stone Adder
  * 4-bit Kogge Stone Adder
  * 8-bit Kogge Stone Adder
  * 16-bit Kogge Stone Adder
* BCD Adder
* Half Subtractor == Done
* Full Subtractor == Done
* Parallel Adder/Subtractor

### 🔹 Common Multipliers in Digital Design

1. **Array Multiplier**
   * Simple structure using add-and-shift.
   * Example: Braun Multiplier.
2. **Booth Multiplier**
   * Uses Booth’s algorithm for signed multiplication.
   * Reduces number of partial products.
3. **Modified Booth Multiplier (Radix-4, Radix-8)**
   * Faster than normal Booth, groups bits for fewer partial products.
4. **Wallace Tree Multiplier**
   * Uses a tree of carry-save adders (CSAs) to reduce partial products quickly.
5. **Dadda Multiplier**
   * Similar to Wallace tree but with minimum number of adders.
   * Optimized delay and area.
6. **Shift-and-Add Multiplier**
   * Sequential multiplier (iterative).
   * Low area, but slower.
7. **Baugh-Wooley Multiplier**
   * Specifically for **signed multiplication** using two’s complement.
8. **Vedic Multiplier (Urdhva Tiryakbhyam)**
   * Based on ancient Vedic mathematics.
   * Parallel partial product generation.
   * Popular in low-power and FPGA designs.
9. **Serial Multiplier**
   * Multiplies bit by bit, very small hardware.
   * Used in area-constrained applications.
10. **Parallel Multiplier**
    * All partial products generated simultaneously.
    * High speed but large area.
11. **Pipelined Multiplier**
    * Uses pipeline registers to improve throughput.
    * Good for high-performance DSP applications.
12. **Distributed Arithmetic Multiplier**
    * Efficient for FIR filters in DSP, replaces multipliers with LUT-based add-shift operations.

---

### 2️⃣ Data Routing Circuits

#### 🔸 Multiplexer (MUX) – Types

* 2-to-1 MUX
* 4-to-1 MUX
* 8-to-1 MUX
* 16-to-1 MUX
* n-to-1 MUX (general form)
* Cascaded Multiplexers
* Tree Multiplexers

#### 🔸 Demultiplexer (DEMUX) – Types

* 1-to-2 DEMUX
* 1-to-4 DEMUX
* 1-to-8 DEMUX
* 1-to-16 DEMUX
* n-to-2ⁿ DEMUX (general form)
* Cascaded Demultiplexers

#### 🔸 Encoder – Types

* 4-to-2 Encoder
* 8-to-3 Encoder
* 16-to-4 Encoder
* n-to-log₂(n) Encoder (general form)

#### 🔸 Priority Encoder – Types

* 4-to-2 Priority Encoder
* 8-to-3 Priority Encoder
* 16-to-4 Priority Encoder
* n-to-log₂(n) Priority Encoder (general form)

#### 🔸 Decoder – Types

* 2-to-4 Decoder
* 3-to-8 Decoder
* 4-to-16 Decoder
* n-to-2ⁿ Decoder (general form)
* Binary to Decimal Decoder
* BCD to Decimal Decoder
* 7-Segment Decoder (for display)
* Cascaded Decoders

---

### 3️⃣ Code Converters

* Binary to Gray Converter
* Gray to Binary Converter
* Binary to BCD Converter
* BCD to Binary Converter
* Binary to Excess-3 Converter
* Excess-3 to Binary Converter

---

### 4️⃣ Other Combinational Circuits

* Magnitude Comparator (1-bit, 4-bit, n-bit)
* Parity Generator
* Parity Checker
* Arithmetic Logic Unit (ALU)
