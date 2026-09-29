module TFF(
    input clk, rstn, T,
    output reg Q
);

//TFF Logic 
always @ (posedge clk) begin
    if (!rstn) //rstn --> active low reset signal (reset when rstn == 0)
        Q <= 1'b0;
    else if (T)
        Q <= ~Q;
    else
        Q <= Q;
end

endmodule