`timescale 1ns/1ps

module DFFA_tb;
    reg D, CLK, R;
    wire Q;

    DFFA uut(D, CLK, R, Q);

    always #5 CLK = ~CLK;

    initial 
    begin 
        //Initialize
        CLK = 0; R = 0; D = 0;

        #12 R = 1; //Reset off
        #10 D = 1; //D on
        #10 D = 0; //D off
        #10 D = 1; //D on to check reset
        #10 R = 0; //Check reset
        #10 R = 1; //Reset off

        #10 $finish;

    end
endmodule