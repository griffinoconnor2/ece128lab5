module TFF(
    input clk, rstn, T,
    output reg Q
);

//TFF Logic
always @ (posedge clk) begin
    if (!rstn)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule