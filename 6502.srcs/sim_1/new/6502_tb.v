`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:06:25 PM
// Design Name: 
// Module Name: 6502_tb
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


module 6502_tb ();

reg clock = 1'b0;

top uut (.clock(clock));

initial begin
    clock = 1'b0;
    forever begin
       #10 clock = ~clock;
    end
end

endmodule
