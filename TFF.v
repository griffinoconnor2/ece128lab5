module TFF(
    input CLK, RSTN, T,
    output reg Q
)

always @ (posedge CLK) begin
    if (!RSTN)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule