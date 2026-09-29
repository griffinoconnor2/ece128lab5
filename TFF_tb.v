`timescale 1ns/1ps

module tff_tb;

//Declare I/O
reg clk, rstn, T;
wire Q;

//instantiate TFF
TFF uut (.clk(clk), .rstn(rstn), .T(T), .Q(Q));

//Generate clock signal with 10ns period = 100000000 Hz = 100Mhz frequency
always #5 clk = ~clk;

initial begin
    //initial inputs
    clk = 0;
    rstn = 0; //reset initialized
    T = 0;

    //Test sequence
    #12 rstn = 1; //release reset
    #10 T = 0; //hold state, Q should still be low
    #10 T = 1; //toggle state, Q should now be high
    #40 T = 0; //toggle state. Q flips (hi, lo, hi, lo) during delay (as T is high), Q should now be low (at end)
    #20 T = 1; //toggle state, Q should now be high
    #10 rstn = 0; //reset, Q should now be low (even though T is high)
    #10 rstn = 1; //release reset, Q should now be high (as T is still high)
    #20;

    $finish;

end

endmodule