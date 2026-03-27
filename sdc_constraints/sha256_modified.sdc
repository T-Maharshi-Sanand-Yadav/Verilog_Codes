# Set SDC version and units
set sdc_version 2.0

set_units -time 1000ps
set_units -capacitance 1000pF

# Define top design
current_design sha256

# Define primary and virtual clocks (Period = 0.71ns = 710ps)
create_clock -add -name CLK  -period 0.71 -waveform {0 0.35} [get_ports clk]
create_clock -add -name VCLK -period 0.71 -waveform {0 0.35}

# Set clock uncertainty in 1000ps units
set_clock_uncertainty -setup 0.14 [get_clocks CLK]
set_clock_uncertainty -hold  0.07 [get_clocks CLK]

# Optionally set clock transition (commented)
# set_clock_transition 0.25 [get_clocks CLK]

# Input delays relative to VCLK
set_input_delay -max 0.42 -clock [get_clocks VCLK] [get_ports {reset_n cs we address[*] write_data[*]}]
set_input_delay -min 0.18 -clock [get_clocks VCLK] [get_ports {reset_n cs we address[*] write_data[*]}]

# Output delays relative to VCLK
set_output_delay -max 0.14 -clock [get_clocks VCLK] [get_ports {read_data[*] error}]
set_output_delay -min 0.07 -clock [get_clocks VCLK] [get_ports {read_data[*] error}]

# Optional (for specific latch phase handling; comment if unused)
# set_db lbr_seq_in_out_phase_opto true

# Mark certain standard cells as 'don't use' (for synthesis)
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

