//3 bit up/down counter

module Count3Bit (
    input clk, en, rstn, up,
    output Q0, Q1, Q2
);

//Intermediate wires for TFF toggle
wire T1, T2;

//Note that up == 1 indicates upcount and up == 0 indicates downcount
assign T1 = en & ((up & Q0) | (~up & ~Q0));
assign T2 = en & ((up & Q1 & Q0) | (~up & ~Q1 & ~Q0));

//Instantiate TFF with clock input, enable (from above logic), and bit outputs
TFF ff0 (.clk(clk), .rstn(rstn), .T(en), .Q(Q0));
TFF ff1 (.clk(clk), .rstn(rstn), .T(T1), .Q(Q1));
TFF ff2 (.clk(clk), .rstn(rstn), .T(T2), .Q(Q2));

endmodule