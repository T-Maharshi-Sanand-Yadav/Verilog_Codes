pt_shell> report_timing -from [all_inputs] -to [all_registers -data_pins]
pt_shell> report_timing -from [all_registers -clock_pins] -to [all_registers -data_pins]
pt_shell> report_timing -from [all_registers -clock_pins] -to [all_outputs]
pt_shell> report_timing -from [all_inputs] -to [all_outputs]

pt_shell> report_timing -to [all_registers -data_pins]
pt_shell> report_timing -to [all_outputs]

pt_shell> set_multicycle_path <multiplier_value> -from <from_list> -to <to_list>

pt_shell> set_multicycle_path 2 -from regA -to regB

pt_shell> set_multicycle_path 2 -setup -from regA/CP -to regB/D

pt_shell> set_min_delay 0 -from regA/CP -to regB/D




1. Define a clock:

 
create_clock -period 5 -name clk [get_ports clk]

2. Set input delay:

 
set_input_delay 1.2 -clock clk [get_ports data_in]

3. Set output delay:

 
set_output_delay 1.0 -clock clk [get_ports data_out]

4. Define multicycle paths:

 
set_multicycle_path 2 -from [get_pins reg1/Q] -to [get_pins reg2/D]

5. Define false paths:

 
set_false_path -from [get_ports async_reset] -to [get_ports clk]

6. Clock uncertainty:

 
set_clock_uncertainty 0.1 [get_clocks clk]

7. Clock groups:

 
set_clock_groups -asynchronous -group {clk1} -group {clk2}

8. Input transition:

 
set_input_transition 0.5 [get_ports clk]

9. Define output load:

 
set_load 0.05 [get_ports data_out]

10. Set max delay:

 
set_max_delay 5 -from [get_ports in1] -to [get_ports out1]

1. set_clock_groups
Defines mutually exclusive clock groups to avoid false timing analysis across clocks.
Example:

 
set_clock_groups -asynchronous -group {clk1} -group {clk2}

________________________________________
2. create_clock
Defines a primary clock and its period.
Example:

 
create_clock -period 10 [get_ports clk]

________________________________________
3. create_generated_clock
Defines clocks derived from a primary clock (e.g., dividers or PLL outputs).
Example:

 
create_generated_clock -name clk_div2 -source [get_ports clk] [get_pins divider/clk_out]

________________________________________
4. set_input_delay
Specifies input arrival time relative to the clock.
Example:

 
set_input_delay 2.5 -clock [get_clocks clk] [get_ports input_signal]

________________________________________
5. set_output_delay
Specifies output required time relative to the clock.
Example:

set_output_delay 1.5 -clock [get_clocks clk] [get_ports output_signal]

________________________________________
6. set_false_path
Excludes specific paths from timing analysis.
Example:
set_false_path -from [get_clocks clk1] -to [get_clocks clk2]

________________________________________
7. set_multicycle_path
Specifies paths that require multiple cycles for data propagation.
Example:

 
set_multicycle_path 2 -from [get_pins reg1/Q] -to [get_pins reg2/D]

________________________________________
8. set_max_delay
Defines a maximum allowable delay for a path.
Example:

 
set_max_delay 15 -from [get_ports in1] -to [get_ports out1]

________________________________________
9. set_min_delay
Defines a minimum allowable delay for a path.
Example:
set_min_delay 2 -from [get_ports in1] -to [get_ports out1]

________________________________________
10. set_dont_touch
Prevents optimization of specified cells, nets, or modules.
Example:
set_dont_touch [get_cells {u0/u1}]

________________________________________
11. set_dont_touch_network
Prevents optimization on specified nets.
Example:
set_dont_touch_network [get_nets clk]

________________________________________
12. set_driving_cell
Defines the driving strength and delay characteristics of an input pin.
Example:
set_driving_cell -cell AND2X1 [get_ports in1]

________________________________________
13. set_load
Specifies the capacitive load on output ports or internal nets.
Example:
set_load 0.05 [get_ports out1]

________________________________________
14. set_max_transition
Specifies the maximum transition time for signals.
Example:
set_max_transition 0.5 [get_ports in1]

________________________________________
15. set_max_capacitance
Specifies the maximum capacitance allowed for nets.
Example:
set_max_capacitance 0.1 [get_ports out1]

________________________________________
16. set_max_fanout
Specifies the maximum fanout of a net.
Example:
set_max_fanout 10 [get_ports clk]

________________________________________
17. set_clock_uncertainty
Defines uncertainty in the clock signal (e.g., jitter and skew).
Example:
set_clock_uncertainty 0.2 [get_clocks clk]

________________________________________
18. set_clock_latency
Specifies the latency of a clock at a specific point.
Example:
set_clock_latency 0.5 [get_clocks clk]

________________________________________
19. set_propagated_clock
Indicates that the clock will use actual delay from physical design.
Example:
set_propagated_clock [get_clocks clk]

________________________________________
20. set_disable_timing
Disables specific timing checks between pins.
Example:
set_disable_timing [get_pins reg1/Q] [get_pins reg2/D]

________________________________________
21. set_case_analysis
Specifies a fixed logic value (0 or 1) on specific nets or ports.
Example:
set_case_analysis 1 [get_ports mode]

________________________________________
22. set_logic_one / set_logic_zero
Applies constant logic values to input pins or ports.
Example:
set_logic_one [get_ports reset]
set_logic_zero [get_ports enable]

________________________________________
23. report_timing
Generates a timing analysis report.
Example:
report_timing -from [get_ports in1] -to [get_ports out1]

________________________________________
24. report_power
Generates a power consumption report.
Example:
report_power

________________________________________
25. report_area
Generates an area usage report.
Example:
report_area

________________________________________
26. set_input_transition
Specifies the input transition time.
Example:
set_input_transition 0.1 [get_ports in1]

________________________________________
27. set_timing_derate
Applies derating factors to timing for pessimistic or optimistic analysis.
Example:
set_timing_derate -early 0.95 -late 1.05

________________________________________
28. set_output_transition
Specifies the transition time for outputs.
Example:
set_output_transition 0.1 [get_ports out1]

________________________________________
29. group_path
Groups specific timing paths for easier reporting.
Example:
group_path -name critical_paths -from [get_ports in1] -to [get_ports out1]

________________________________________
30. check_timing
Checks the timing constraints applied in the design.
Example:
check_timing

________________________________________
Example  File:
 
# Define primary clock
create_clock -period 10 [get_ports clk]

# Input/output delay
set_input_delay 2.5 -clock [get_clocks clk] [get_ports in1]
set_output_delay 1.5 -clock [get_clocks clk] [get_ports out1]

# Timing constraints
set_false_path -from [get_clocks clk1] -to [get_clocks clk2]
set_multicycle_path 2 -from [get_pins reg1/Q] -to [get_pins reg2/D]

# Clock uncertainty
set_clock_uncertainty 0.2 [get_clocks clk]

# Driving cells and loads
set_driving_cell -cell AND2X1 [get_ports in1]
set_load 0.05 [get_ports out1]

# Transition and capacitance limits
set_max_transition 0.5 [get_ports clk]
set_max_capacitance 0.1 [get_ports out1]

# Area, power, and timing reports
report_area
report_power
report_timing -from [get_ports in1] -to [get_ports out1]

# clock gating verilog code example
always @(posedge clk)
if(enable)
    data_out <= data_in;



