create_clock -name clk -period 4 -waveform {0 2} [get_ports clk]
create_clock -name vclk -period 4 -waveform {0 2}
set_input_delay -max 0.8 -clock vclk [get_ports d_in]
set_input_delay -min 0.8 -clock vclk [get_ports d_in]
set_output_delay -max 0.8 -clock vclk [get_ports q_out]
set_output_delay -min 0.8 -clock vclk [get_ports q_out]
set_max_delay 0.8 -from d_in -to q_out
set_min_delay 0.8 -from d_in -to q_out

set_clock_uncertainty 0.1 [get_clocks clk]
set_clock_latency -source 0.2 [get_clocks clk]
set_clock_latency 0.8 [get_clocks clk]

set_timing_derate -late 1.1
set_timing_derate -early 0.9

set_analysis_mode -analysisType onChipVariation

#early is for clock paths [min delay]
#late is for data paths [max delay]
