# Set the working dir, where all compiled Verilog goes.
vlib Work

# Compile all Verilog modules in alu.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ns/1ns alureg.v

# Load simulation using mux as the top level simulation module.
vsim alureg

# Log all signals and add some signals to waveform window.
log {/*}
# add wave {/*} would add all items in top level simulation module.
add wave {/*}

# Not testing case 0 to 4 because I have the same code from last lab

force {SW[3:0]} 2#0000
force {SW[9]} 0
force {SW[7:5]} 2#000
force {KEY[0]} 0

# Test B left shift A
force {SW[3:0]} 2#0110
force {SW[9]} 1
force {SW[7:5]} 2#101
force {KEY[0]} 0
run 10ns

force {KEY[1]} 1
run 10ns

force {SW[3:0]} 2#0001
force {SW[9]} 1
force {KEY[0]} 0
run 10ns


# Test B right shift A
force {SW[3:0]} 2#1001
force {SW[9]} 1
force {SW[7:5]} 2#101
force {KEY[0]} 0
run 10ns

force {KEY[1]} 1
run 10ns

force {SW[3:0]} 2#0001
force {SW[9]} 1
force {KEY[0]} 0
run 10ns


force {KEY[1]} 1
run 10ns

# Test A * B 
force {SW[3:0]} 2#1001
force {SW[9]} 1
force {SW[7:5]} 2#110
force {KEY[0]} 0
run 10ns

force {KEY[1]} 1
run 10ns

force {SW[3:0]} 2#0001
force {SW[9]} 1
force {KEY[0]} 0
run 10ns

force {KEY[1]} 1
run 10ns