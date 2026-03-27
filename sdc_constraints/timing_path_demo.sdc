# Define the main clock
create_clock -name clk -period 10 [get_ports clk] ;# 100 MHz

# Input delays (assuming external source drives signals relative to clk)
set_input_delay 2.0 -clock clk [get_ports in1]
set_input_delay 2.0 -clock clk [get_ports in2]

# Output delays (assuming external device captures outputs relative to clk)
set_output_delay 2.0 -clock clk [get_ports out1]
set_output_delay 2.0 -clock clk [get_ports out2]

# Optional: Reset is asynchronous, so no delay needed, but can constrain for completeness
set_input_delay 0.0 [get_ports rst_n]
set_false_path -from [get_ports rst_n]

