# VHDL Counter with Race Condition

This repository demonstrates a potential race condition in a simple VHDL counter.  The `buggy_counter.vhdl` file contains code that may produce unexpected behavior due to the way the reset signal is handled in relation to the clock edge.  The `fixed_counter.vhdl` file provides a corrected version.

**Problem:**
The original counter design has a risk of incorrect counting if the `rst` signal changes precisely at the same moment as a rising clock edge. This can lead to unpredictable values in the `count` output.

**Solution:**
The corrected counter uses a more robust approach to handle the reset, ensuring that the reset operation is synchronized to the clock signal and preventing the race condition.

## How to Run
1. Simulate using your favorite VHDL simulator (e.g. ModelSim, GHDL, Icarus Verilog).
2. Test with various scenarios, including scenarios where `rst` changes simultaneously with the clock.