module Count3Bit (
    input clk, en,
    output Q0, Q1, Q2
)

//Intermediate wires for TFF toggle
wire T1, T2;

assign T1 = Q0 & en;
assign T2 = Q1 & Q0 & en;

//Instantiate TFF with clock input, enable (from above logic), and bit outputs
TFF ff0(.clk(clk), .T(en), .Q(Q0));
TFF ff1(.clk(clk), .T(T1), .Q(Q1));
TFF ff1(.clk(clk), .T(T2), .Q(Q2));

endmodule