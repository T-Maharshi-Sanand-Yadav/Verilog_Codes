# ------------------------------------------------------------
# Clock definition: 100 MHz (10 ns period)
# ------------------------------------------------------------
create_clock -name clk -period 10 [get_ports clk]

# ------------------------------------------------------------
# Input delay relative to external source
# Assuming 2.5 ns arrival time from IO to FPGA/ASIC input
# ------------------------------------------------------------
set_input_delay 2.5 -clock clk [get_ports x]
set_input_delay 2.5 -clock clk [get_ports rst]

# ------------------------------------------------------------
# Input transition time (slew)
# Assuming 0.1 ns external driver transition
# This avoids 'no external driver/transition' warnings
# ------------------------------------------------------------
set_input_transition 0.1 [get_ports x]
set_input_transition 0.1 [get_ports rst]

# ------------------------------------------------------------
# Output delay relative to external destination
# Assuming 2.5 ns required time to IO output
# ------------------------------------------------------------
set_output_delay 2.5 -clock clk [get_ports y]
set_output_delay 2.5 -clock clk [get_ports present_state*]
set_output_delay 2.5 -clock clk [get_ports next_state*]

# ------------------------------------------------------------
# Output load capacitance
# Assuming 5 fF typical pin capacitance
# This avoids 'no external load' warnings
# ------------------------------------------------------------
set_load 0.005 [get_ports y]
set_load 0.005 [get_ports present_state*]
set_load 0.005 [get_ports next_state*]

