`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/17/2023 03:06:15 PM
// Design Name: 
// Module Name: clock_generator_sim
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


module clock_generator_sim;

    reg clk_in;
    wire clk_1;
    wire clk_2;

    clock_generator cg(clk_in, clk_1, clk_2);

    initial begin
        forever begin
            #10 clk_in = 1'b1;
            #10 clk_in = 1'b0;
        end
    end

endmodule