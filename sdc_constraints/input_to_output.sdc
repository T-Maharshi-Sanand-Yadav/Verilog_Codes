create_clock -name clk -period 4 -waveform {0 2} [get_ports clk]
create_clock -name vclk -period 4 -waveform {0 2}
set_input_delay -max 0.8 -clock vclk [get_ports in]
set_input_delay -min 0.8 -clock vclk [get_ports in]
set_output_delay -max 0.8 -clock vclk [get_ports out]
set_output_delay -min 0.8 -clock vclk [get_ports out]
set_max_delay 0.8 -from in -to out
set_min_delay 0.8 -from in -to out
