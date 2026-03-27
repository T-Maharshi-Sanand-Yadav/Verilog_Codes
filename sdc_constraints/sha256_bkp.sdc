#---------------------------------------------
# Design Setup
#---------------------------------------------
set sdc_version 2.0

set_units -time 1000ps
set_units -capacitance 1000pF

current_design sha256

#---------------------------------------------
# Clock Definitions
#---------------------------------------------
create_clock -name CLK  -period 0.71 -waveform {0 0.35} [get_ports clk]
create_clock -name VCLK  -period 0.71 -waveform {0 0.35}

set_clock_uncertainty -setup 0.14 [get_clocks VCLK]
set_clock_uncertainty -hold  0.07  [get_clocks VCLK]

set_clock_transition 0.25 [get_clocks VCLK]

#---------------------------------------------
# Input Timing Constraints (all relative to VCLK)
#---------------------------------------------
set_input_delay -max 0.42 -clock VCLK [get_ports {reset_n cs we address[*] write_data[*]}]
set_input_delay -min 0.18 -clock VCLK [get_ports {reset_n cs we address[*] write_data[*]}]

set_input_delay -max 0.42 -clock VCLK [get_ports {Scan_enable Test_mode scan_in_1 scan_in_2 scan_in_3 scan_in_4 scan_in_5 scan_in_6 scan_out_5 scan_out_6}]
set_input_delay -min 0.18 -clock VCLK [get_ports {Scan_enable Test_mode scan_in_1 scan_in_2 scan_in_3 scan_in_4 scan_in_5 scan_in_6 scan_out_5 scan_out_6}]

#---------------------------------------------
# Output Timing Constraints (all relative to VCLK)
#---------------------------------------------
set_output_delay -max 0.14 -clock VCLK [get_ports {read_data[*] error scan_out_1 scan_out_2 scan_out_3 scan_out_4 scan_in_5 scan_in_6 scan_out_5 scan_out_6}]
set_output_delay -min 0.07 -clock VCLK [get_ports {read_data[*] error scan_out_1 scan_out_2 scan_out_3 scan_out_4 scan_in_5 scan_in_6 scan_out_5 scan_out_6}]

#---------------------------------------------
# Drive Strength and Load Constraints
#---------------------------------------------
set_input_transition 100 [all_inputs]
set_load 0.01 [all_outputs]

#---------------------------------------------
# Don't Use Cells
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

