`timescale 1ns/1ps

module Count3Bit_tb;

//Declare IO
reg clk, en, rstn, up;
wire Q0, Q1, Q2;

//Instantiate 3-bit-counter object
Count3Bit uut(.clk(clk), .en(en), .rstn(rstn), .up(up), .Q0(Q0), .Q1(Q1), .Q2(Q2));

//Generate clock signal with 10ns period = 100000000 Hz = 100Mhz frequency
always #5 clk = ~clk;

initial begin
    //Initial inputs
    clk = 0;
    en = 0;
    rstn = 0; //reset initialized
    up = 1; //start in upcount mode

    #12 rstn = 1; //release reset
    #20; //hold for 2 cycles to observe output (should be 000)

    en = 1; //enable counting
    #100; //wait 10 cycles to observe count (0, 1, 2, 3, 4, 5, 6, 7, 0, 1, 2)

    en = 0; //disable counter,
    #20; // hold for 2 cycles to ensure output held at 2

    en = 1; //enable counting
    up = 0; //begin downcounting
    #80; // wait 8 cycles to observe count (2, 1, 0, 7, 6, 5, 4, 3, 2)

    #5 rstn = 0; //reset on while Q = 2
    #10 rstn = 1; //reset off
    #20; //verify counter restarts counting down from 0 and not 2 (last value)

    $finish;

end

endmodule