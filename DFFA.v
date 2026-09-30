//Asynchronous DFF
module DFFA(
    input D, CLK, R,
    output reg Q
);  
    //Trigger during positive edge of the clock signal or the reset signal
    always@(posedge CLK or posedge R)
        begin 
            if (~R) 
                Q <= 1'b0;
            else 
                Q <= D;
        end
endmodule