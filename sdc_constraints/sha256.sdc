#---------------------------------------------
# Design Setup
#---------------------------------------------
set sdc_version 2.0

set_units -time 1000ps
set_units -capacitance 1000fF

current_design sha256

#---------------------------------------------
# Clock Definitions (750 MHz = 1.333 ns)
#---------------------------------------------
create_clock -name CLK -period 1.333 -waveform {0 0.666} [get_ports clk]
create_clock -name VCLK -period 1.333 -waveform {0 0.666}

#---------------------------------------------
# Clock Uncertainty (≈10% of clock period)
#---------------------------------------------
set_clock_uncertainty -setup 0.133 [get_clocks VCLK]	;# ~10% of 1.333 ns
set_clock_uncertainty -hold 0.066 [get_clocks VCLK]	;# ~5% of 1.333 ns

#---------------------------------------------
# Recommended clock transition (≈7.5%) (a bit faster to reduce slew violations)
#---------------------------------------------
set_clock_transition 0.1 [get_clocks VCLK]

#---------------------------------------------
# Input Timing Constraints (relative to VCLK)
#---------------------------------------------
# Max Input Delay = 0.8 ns → ~60% of clock period
# Min Input Delay = 0.2 ns → ~15% of clock period

set_input_delay -max 0.8 -clock VCLK [get_ports {reset_n cs we address[*] write_data[*]}]
set_input_delay -min 0.2 -clock VCLK [get_ports {reset_n cs we address[*] write_data[*]}]

set_input_delay -max 0.8 -clock VCLK [get_ports {Scan_enable Test_mode scan_in_1 scan_in_2 scan_in_3 scan_in_4 scan_in_5 scan_in_6}]
set_input_delay -min 0.2 -clock VCLK [get_ports {Scan_enable Test_mode scan_in_1 scan_in_2 scan_in_3 scan_in_4 scan_in_5 scan_in_6}]

# Add input delays also on scan_out ports (for inout behavior)
set_input_delay -max 0.8 -clock VCLK [get_ports {scan_out_5 scan_out_6}]
set_input_delay -min 0.2 -clock VCLK [get_ports {scan_out_5 scan_out_6}]

#---------------------------------------------
# Output Timing Constraints (relative to VCLK)
#---------------------------------------------
# Max Output Delay = 0.5 ns → ~37.5% of clock period
# Min Output Delay = 0.2 ns → ~15% of clock period

set_output_delay -max 0.5 -clock VCLK [get_ports {read_data[*] error scan_out_1 scan_out_2 scan_out_3 scan_out_4 scan_out_5 scan_out_6}]
set_output_delay -min 0.2 -clock VCLK [get_ports {read_data[*] error scan_out_1 scan_out_2 scan_out_3 scan_out_4 scan_out_5 scan_out_6}]

# Add output delays also on scan_in ports (for inout behavior)
set_output_delay -max 0.5 -clock VCLK [get_ports {scan_in_5 scan_in_6}]
set_output_delay -min 0.2 -clock VCLK [get_ports {scan_in_5 scan_in_6}]

#---------------------------------------------
# Drive and Load Constraints (realistic values)
#---------------------------------------------
set_input_transition 0.05 [all_inputs]     ;# 50ps = ~3.75% of 1.333 ns
set_load 0.001 [all_outputs]               ;# 1fF load on outputs (very light)

#---------------------------------------------
# Don't Use Cells (unchanged)
#---------------------------------------------
set_dont_use {
  DFFNSRX1 DFFNSRX2 DFFNSRX4 DFFNSRXL
  DFFRHQX1 DFFRHQX2 DFFRHQX4 DFFRHQX8
  DFFSHQX4 DFFSHQX8
  DFFSRHQX1 DFFSRHQX2 DFFSRHQX4 DFFSRHQX8
  DFFSRX1 DFFSRX2 DFFSRX4 DFFSRXL
  DFFSX4 DFFSXL
  SDFFNSRX1 SDFFNSRX2 SDFFNSRX4 SDFFNSRXL
  SDFFSHQX2 SDFFSHQX4 SDFFSHQX8
  SDFFSRHQX1 SDFFSRHQX2 SDFFSRHQX4 SDFFSRHQX8
  SDFFSRX1 SDFFSRX2 SDFFSRX4 SDFFSRXL
  SDFFSX4 SDFFSXL
}

