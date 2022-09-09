create_clock -name clk -period 20 [get_ports {clk}]

set_clock_uncertainty 0.2 [get_ports {clk}]

