1. Objectives

The purpose of this lab is to design and simulate various sequential circuit elements used to store data in Verilog implementation. Specifically, we will design SR Latch, SR Flip-flop, synchronous DFF, asynchronous DFF, and TFF modules, along with 3-bit Counter and Clock Divider modules that instantiate the TFF design. Each design module is paired with a corresponding test bench that verifies the functionality of the devices according to the below truth tables.

2. Introduction

Latches and flip-flops (FF) are powerful digital circuits used to implement sequential logic in digital systems. At the most basic level, each device is used to store (and hold) a single bit of information utilizing feedback of their outputs to their inputs, though differ in the mechanisms used to implement this behavior. Generally speaking, updating a latch or FF’s input(s) will result in either an update (inversion) or hold of the current state’s output.

The FF takes in in a varying number of inputs depending on its specific design (an SRFF takes in both S and R, while the DFF and TFF take only D or T, respectively), producing both an output (Q) and its complement (~Q or Q). In an effort to make our design/waveforms more readable, we omitted the complement from our FF designs, as its output would simply display the inverse of Q. Though the designs differ in their specific implementation philosophies, each is powered by a clock signal, with its output updating alongside changes to the input(s). One small caveat is that FF’s may be implemented synchronously or asynchronously. The former may only update its output on the specified clock edge regardless of when the input signal changes, whereas the latter may either update on the clock edge or abruptly should the specified reset signal update mid cycle.

The latch, on the other hand, is not implemented with a clock, and instead relies solely on feedback to update its values. Implemented as the SR latch in this lab, it makes use of 3 valid states, 1 to reset the output, 1 to set the output, and 1 to hold the previous state. A small issue with this specific latch implementation is the S = 1 with R= 1 state, as it results in an invalid scenario (one cannot set and reset the latch simultaneously).

In this lab, we also implemented a 3-bit Up/Down counter and a 1/4 clock divider. The 3-bit counter instantiates 3 TFFs to perform the counting logic, along with a common clock shared between them and a signal to indicate whether to count up or down. 2 intermediate wires are used to forward outputs of the previous bit to the input of the subsequent. These wires use additional counting logic to dictate their values, as the next bit should only update from 0 to 1 when the previous is currently 1. The clock divider uses 2 TFFs to divide the input clock signal in half, twice (resulting in an output signal with a frequency one quarter of that of the input). As the input signal may not be shared between TFFs, the second was passed the complement of the previous’s output, ensuring each stage toggles at the previous stage’s falling edge.


3. Additional Sources

https://hilite.me/ - Used to format Appendix code in Lab Report
