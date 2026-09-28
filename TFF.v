module TFF(
    input clk, rstn, t,
    output reg q
)

//TFF Logic
always @ (posedge clk) begin
    if (!rstn)
        q <= 1'b0;
    else if (T)
        q <= ~q;
    else
        q <= q;
end

endmodule