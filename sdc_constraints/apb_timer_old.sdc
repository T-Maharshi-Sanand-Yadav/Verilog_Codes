# Clock Definitions
create_clock -name PCLK  -period 4 -waveform {0 2} [get_ports PCLK]
create_clock -name PCLKG -period 4 -waveform {0 2} [get_ports PCLKG]

# Virtual clocks for I/O delays
create_clock -name vPCLK  -period 4 -waveform {0 2}
create_clock -name vPCLKG -period 4 -waveform {0 2}

# Clock uncertainty and latency
set_clock_uncertainty 0.2 [get_clocks *]
set_clock_latency -source -early 0.2 [get_clocks *]
set_clock_latency -source -late  0.4 [get_clocks *]

# Transition and load
set_input_transition 0.2 [all_inputs]
set_load 2 [all_outputs]

# Input delays (except async reset)
foreach port {PRESETn PSEL PENABLE PWRITE EXTIN PADDR PWDATA ECOREVNUM} {
    set_input_delay -max 0.8 -clock vPCLK  [get_ports $port]
    set_input_delay -min 0.4 -clock vPCLK  [get_ports $port]
    set_input_delay -max 0.8 -clock vPCLKG [get_ports $port]
    set_input_delay -min 0.4 -clock vPCLKG [get_ports $port]
}

# Output delays
foreach port {PRDATA PREADY PSLVERR TIMERINT} {
    set_output_delay -max 0.8 -clock vPCLK  [get_ports $port]
    set_output_delay -min 0.4 -clock vPCLK  [get_ports $port]
    set_output_delay -max 0.8 -clock vPCLKG [get_ports $port]
    set_output_delay -min 0.4 -clock vPCLKG [get_ports $port]
}

