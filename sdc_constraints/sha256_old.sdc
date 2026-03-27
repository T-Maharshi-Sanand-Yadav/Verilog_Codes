set sdc_version 2.0

set_units -time 1000ps
set_units -capacitance 1000pF

##1.4GHz
current_design sha256 

create_clock -add -name CLK -period 0.71 -waveform {0 0.35} [get_ports clk] 
create_clock -add -name VCLK -period 0.71 -waveform {0 0.35} 

set_clock_uncertainty -setup 0.14 [get_clocks CLK]
set_clock_uncertainty -hold 0.07 [get_clocks CLK]

#set_clock_transition 0.25 [get_clocks CLK]


set_input_delay -max  0.42 -clock [get_clocks VCLK ] [get_ports reset_n]
set_input_delay -max  0.42 -clock [get_clocks VCLK ] [get_ports cs]
set_input_delay -max  0.42 -clock [get_clocks VCLK ] [get_ports we]
set_input_delay -max  0.42 -clock [get_clocks VCLK ] [get_ports address[*]]
set_input_delay -max  0.42 -clock [get_clocks VCLK ] [get_ports write_data[*]]

set_input_delay -min  0.18 -clock [get_clocks VCLK ] [get_ports reset_n]
set_input_delay -min  0.18 -clock [get_clocks VCLK ] [get_ports cs]
set_input_delay -min  0.18 -clock [get_clocks VCLK ] [get_ports we]
set_input_delay -min  0.18 -clock [get_clocks VCLK ] [get_ports address[*]]
set_input_delay -min  0.18 -clock [get_clocks VCLK ] [get_ports write_data[*]]

set_output_delay -max 0.14 -clock [get_clocks VCLK ] [get_ports read_data[*]]
set_output_delay -max 0.14 -clock [get_clocks VCLK ] [get_ports error]

set_output_delay -min  0.07 -clock [get_clocks VCLK ] [get_ports read_data[*]]
set_output_delay -min  0.07 -clock [get_clocks VCLK ] [get_ports error]

#set_db lbr_seq_in_out_phase_opto true

set_dont_use {DFFNSRX1 DFFNSRX2 DFFNSRX4 DFFNSRXL DFFRHQX1 DFFRHQX2 DFFRHQX4 DFFRHQX8 DFFSHQX4 DFFSHQX8 DFFSRHQX1 DFFSRHQX2 DFFSRHQX4 DFFSRHQX8 DFFSRX1 DFFSRX2 DFFSRX4 DFFSRXL DFFSX4 DFFSXL  SDFFNSRX1 SDFFNSRX2 SDFFNSRX4 SDFFNSRXL SDFFSHQX2 SDFFSHQX4 SDFFSHQX8 SDFFSRHQX1 SDFFSRHQX2 SDFFSRHQX4 SDFFSRHQX8 SDFFSRX1 SDFFSRX2 SDFFSRX4 SDFFSRXL SDFFSX4 SDFFSXL} 
