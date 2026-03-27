# Virtual Clock Definition (for I/O timing reference)
create_clock -name vCLK -period 4 -waveform {0 2}

# Clock uncertainty and latency
set_clock_uncertainty 0.2 [get_clocks *]
set_clock_latency -source -early 0.2 [get_clocks *]
set_clock_latency -source -late  0.4 [get_clocks *]

# Transition and load
set_input_transition 0.2 [all_inputs]
set_load 0.814 [all_outputs]

# Input delays
foreach port {a b cin} {
    set_input_delay -max 0.8 -clock vCLK [get_ports $port]
    set_input_delay -min 0.4 -clock vCLK [get_ports $port]
    set_max_transition 0.814 [get_ports $port]
}

# Output delays
foreach port {sum cout} {
    set_output_delay -max 0.8 -clock vCLK [get_ports $port]
    set_output_delay -min 0.4 -clock vCLK [get_ports $port]
}

