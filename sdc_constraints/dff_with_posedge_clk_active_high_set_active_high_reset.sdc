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


set_dont_touch DFFHQX1
set_dont_touch DFFHQX2
set_dont_touch DFFNSRX2
set_dont_touch DFFQX1
set_dont_touch DFFQX2
set_dont_touch DFFQX4
set_dont_touch DFFRHQX2
set_dont_touch DFFRX1
set_dont_touch DFFRX4
set_dont_touch DFFRXL
set_dont_touch DFFSHQX2
set_dont_touch DFFSHQX4
set_dont_touch DFFSHQX8
set_dont_touch DFFSRHQX1
set_dont_touch DFFSRHQX2
set_dont_touch DFFSRX1
set_dont_touch DFFSRXL
set_dont_touch DFFTRX2
set_dont_touch DFFX1
set_dont_touch DFFX2
set_dont_touch EDFFHQX2
set_dont_touch EDFFTRX1
set_dont_touch EDFFTRX4
set_dont_touch EDFFX1
set_dont_touch EDFFX4
set_dont_touch MDFFHQX8
set_dont_touch SDFFHQX8
set_dont_touch SDFFNSRX2
set_dont_touch SDFFNSRXL
set_dont_touch SDFFQX1
set_dont_touch SDFFRHQX1
set_dont_touch SDFFRHQX4
set_dont_touch SDFFRX1
set_dont_touch SDFFRX2
set_dont_touch SDFFRXL
set_dont_touch SDFFSHQX1
set_dont_touch SDFFSRHQX1
set_dont_touch SDFFSRHQX2
set_dont_touch SDFFSRHQX4
set_dont_touch SDFFSRX1
set_dont_touch SDFFSRX4
set_dont_touch SDFFSX1
set_dont_touch SDFFSXL
set_dont_touch SDFFTRX1
set_dont_touch SDFFTRX2
set_dont_touch SDFFTRX4
set_dont_touch SDFFTRXL
set_dont_touch SDFFX1
set_dont_touch SEDFFHQX2
set_dont_touch SEDFFHQX8
set_dont_touch SEDFFTRX2
set_dont_touch SEDFFTRX4
set_dont_touch SEDFFTRXL
set_dont_touch SEDFFX2
set_dont_touch SEDFFXL
set_dont_touch SMDFFHQX1
set_dont_touch SMDFFHQX2
set_dont_touch SMDFFHQX4
set_dont_touch SMDFFHQX8
set_dont_touch DFFNSRX1
set_dont_touch DFFNSRXL
set_dont_touch DFFRHQX1
set_dont_touch DFFRHQX4
set_dont_touch DFFRX2
set_dont_touch DFFSRHQX4
set_dont_touch DFFSRX2
set_dont_touch DFFSX4
set_dont_touch DFFSXL
set_dont_touch DFFTRX1
set_dont_touch DFFTRX4
set_dont_touch DFFX4
set_dont_touch EDFFHQX1
set_dont_touch EDFFX2
set_dont_touch EDFFXL
set_dont_touch MDFFHQX1
set_dont_touch MDFFHQX2
set_dont_touch MDFFHQX4
set_dont_touch SDFFHQX1
set_dont_touch SDFFHQX2
set_dont_touch SDFFQX4
set_dont_touch SDFFQXL
set_dont_touch SDFFRHQX8
set_dont_touch SDFFRX4
set_dont_touch SDFFSHQX2
set_dont_touch SDFFSRX2
set_dont_touch SDFFSX2
set_dont_touch SDFFX2
set_dont_touch SDFFX4
set_dont_touch SDFFXL
set_dont_touch DFFQXL
set_dont_touch DFFRHQX8
set_dont_touch DFFSRX4
set_dont_touch DFFSX1
set_dont_touch DFFTRXL
set_dont_touch DFFXL
set_dont_touch EDFFHQX8
set_dont_touch SDFFHQX4
set_dont_touch SDFFNSRX1
set_dont_touch SDFFNSRX4
set_dont_touch SDFFRHQX2
set_dont_touch SDFFSHQX4
set_dont_touch SDFFSHQX8
set_dont_touch SDFFSRHQX8
set_dont_touch SEDFFTRX1
set_dont_touch SEDFFX1
set_dont_touch DFFSHQX1
set_dont_touch DFFSRHQX8
set_dont_touch EDFFTRXL
set_dont_touch SDFFSRXL
set_dont_touch SDFFSX4
set_dont_touch DFFHQX8
set_dont_touch EDFFHQX4
set_dont_touch SDFFQX2
set_dont_touch SEDFFHQX4
set_dont_touch SEDFFX4
set_dont_touch DFFHQX4
set_dont_touch EDFFTRX2
set_dont_touch SEDFFHQX1


