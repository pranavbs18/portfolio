`timescale 1ns / 1ps
module filter_design(
    input clk,
    input rst,
    input signed [7:0] x_in,
    output reg signed [15:0] y_out
    );
    
    reg signed [7:0] coeffs[0:4];

initial begin
    coeffs[0] = 16;
    coeffs[1] = 32;
    coeffs[2] = 48;
    coeffs[3] = 16;
    coeffs[4] = 16;
end

    reg signed [7:0] shift_reg[0:4];
    integer i;
    
    always @ (posedge clk) begin
        if (rst) 
        begin
            for (i=0; i<5; i= i + 1)
                shift_reg[i] <= 0;
            y_out <= 0;
        end
        else begin
            for (i=4; i>0; i= i-1)
                shift_reg[i] <= shift_reg[i-1];
            shift_reg[0] <= x_in;
            
        y_out <= shift_reg[0]*coeffs[0] +
                 shift_reg[1]*coeffs[1] +
                 shift_reg[2]*coeffs[2] +
                 shift_reg[3]*coeffs[3] +
                 shift_reg[4]*coeffs[4];
            end
     end
endmodule
