//Synchronous DFF
module DFFS(
    input D, CLK, R,
    output reg Q
);  
    //Trigger during positive edge of the clock signal
    always@(posedge CLK)
        begin 
            if (R) 
                Q <= 1'b0;
            else 
                Q <= D;
        end
endmodule