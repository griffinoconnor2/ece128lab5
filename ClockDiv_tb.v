`timescale 1ns/1ps

module ClockDivider_tb;

//Declare I/O
reg clkin, rstn;
wire clkout;

//Instantiate divider
ClockDivider uut(.clkin(clkin), .rstn(rstn), .clkout(clkout));

//Generate clock signal with 10ns period = 100000000 Hz = 100Mhz frequency
always #5 clkin = ~clkin;

initial begin
    //Initial inputs
    clkin = 0;
    rstn = 0; //reset initialized

    #12 rstn = 1; //release reset

    #200; //Wait 20 cycles (20 100MHz / 4 = 5 25MHz cycles )

    $finish;
    
end

endmodule