module SRFF(
    input S, R, CLK,
    output Q, Qbar
);
    wire w1, w2;
    
    and A1(w1, R, CLK);
    and A2(w2, S, CLK);

    nor N1(Q, w1, Qbar);
    nor N2(Qbar, w2, Q);

endmodule