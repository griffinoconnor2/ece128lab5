`timescale 1ns/1ps

module SRL_tb;

    reg R, S;
    wire Q, Qbar;

    SRL utt(S, R, Q, Qbar);

    initial
    begin
        //Initial inputs
        R = 0; S = 1; 
     
        #10 R = 0; S = 0; //Check hold
        #10 R = 1; S = 0; //Check reset
        #10 R = 0; S = 0; //Check hold
        #10 R = 0; S = 1; //Check set
        #10 R = 1; S = 1; //Check invalid

        #10 $finish;
    end
endmodule