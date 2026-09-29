module ClockDivider (
    input clkin, rstn, 
    output clkout
    );

    //Intermediate wire to propogate ff0 output to clock of ff1
    wire Q0;

    //Set up 2 bit counter with 2 TFF's for f/4 logic
    TFF ff0(.clk(clkin), .rstn(rstn), .T(1'b1), .Q(Q0));
    TFF ff1(.clk(~Q0), .rstn(rstn), .T(1'b1), .Q(clkout));

endmodule