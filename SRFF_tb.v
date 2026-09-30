`timescale 1ns/1ps

module SRFF_tb;
    reg S, R, CLK;
    wire Q, Qbar;

    SRFF uut(S, R, CLK, Q, Qbar);

    always #5 CLK = ~CLK;

    initial 
    begin
        //Initial
        CLK = 0; S = 1; R = 0;

        //Test Cases
        #12 R = 0; S = 0; //Check hold
        #10 R = 1; S = 0; //Check reset
        #10 R = 0; S = 0; //Check hold
        #10 R = 0; S = 1; //Check set
        #10 R = 1; S = 1; //Check invalid

        #10 $finish;

    end
endmodule