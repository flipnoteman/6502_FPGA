`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 11:21:10 AM
// Design Name: 
// Module Name: clock_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(
    input clock_in,
    input [27:0] divisor,
    output reg clock_out
    );
    
    reg[27:0] counter = 28'd0;
        
    always @(posedge clock_in) begin
        counter <= counter + 28'd1;
        if(counter >= (divisor - 1))
            counter <= 28'd0;
        clock_out <= (counter < divisor/2) ? 1'b1 : 1'b0;
    end
endmodule

