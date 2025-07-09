`timescale 1ns / 1ps
module freqdiv(input clk, rst,
                output reg [25:0]q);
                
always @(posedge clk)
begin
    if(rst)
    assign q=26'b0;
    else
    assign q=26'b1;
    end
endmodule
