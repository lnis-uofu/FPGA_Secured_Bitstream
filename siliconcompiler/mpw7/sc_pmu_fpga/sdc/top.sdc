create_clock -name clk -period 20 [get_ports {user_clock2}]

set_clock_uncertainty 0.2 [get_ports {user_clock2}]

