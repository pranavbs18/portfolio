# ####################################################################

#  Created by Genus(TM) Synthesis Solution 17.22-s017_1 on Wed Jul 02 17:06:14 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

# Set the current design
current_design cla_4bit

set_clock_gating_check -setup 0.0 
set_input_delay -add_delay -max 0.2 [get_ports {a[3]}]
set_input_delay -add_delay -max 0.2 [get_ports {a[2]}]
set_input_delay -add_delay -max 0.2 [get_ports {a[1]}]
set_input_delay -add_delay -max 0.2 [get_ports {a[0]}]
set_input_delay -add_delay -max 0.2 [get_ports {b[3]}]
set_input_delay -add_delay -max 0.2 [get_ports {b[2]}]
set_input_delay -add_delay -max 0.2 [get_ports {b[1]}]
set_input_delay -add_delay -max 0.2 [get_ports {b[0]}]
set_input_delay -add_delay -max 0.2 [get_ports cin]
set_input_delay -add_delay -min 0.1 [get_ports {a[3]}]
set_input_delay -add_delay -min 0.1 [get_ports {a[2]}]
set_input_delay -add_delay -min 0.1 [get_ports {a[1]}]
set_input_delay -add_delay -min 0.1 [get_ports {a[0]}]
set_input_delay -add_delay -min 0.1 [get_ports {b[3]}]
set_input_delay -add_delay -min 0.1 [get_ports {b[2]}]
set_input_delay -add_delay -min 0.1 [get_ports {b[1]}]
set_input_delay -add_delay -min 0.1 [get_ports {b[0]}]
set_input_delay -add_delay -min 0.1 [get_ports cin]
set_output_delay -add_delay -max 0.2 [get_ports {sum[3]}]
set_output_delay -add_delay -max 0.2 [get_ports {sum[2]}]
set_output_delay -add_delay -max 0.2 [get_ports {sum[1]}]
set_output_delay -add_delay -max 0.2 [get_ports {sum[0]}]
set_output_delay -add_delay -max 0.2 [get_ports cout]
set_output_delay -add_delay -max 0.2 [get_ports pg]
set_output_delay -add_delay -max 0.2 [get_ports gg]
set_output_delay -add_delay -min 0.1 [get_ports {sum[3]}]
set_output_delay -add_delay -min 0.1 [get_ports {sum[2]}]
set_output_delay -add_delay -min 0.1 [get_ports {sum[1]}]
set_output_delay -add_delay -min 0.1 [get_ports {sum[0]}]
set_output_delay -add_delay -min 0.1 [get_ports cout]
set_output_delay -add_delay -min 0.1 [get_ports pg]
set_output_delay -add_delay -min 0.1 [get_ports gg]
set_wire_load_mode "enclosed"
set_dont_use [get_lib_cells slow/HOLDX1]
