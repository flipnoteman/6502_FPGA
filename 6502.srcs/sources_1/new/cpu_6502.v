`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 04:03:51 PM
// Design Name: 
// Module Name: cpu_6502
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


module cpu_6502(
    input clk,
    output [15:0] address,
    output rwb,
    inout [7:0] data_bus
    );
        
    reg [7:0] A;            //Accumulator
    reg [7:0] Y;            //Index Register
    reg [7:0] X;            //Index Register
    reg [15:0] PC;          //Program Counter
    reg [7:0] SP;           //Stack Pointer
    reg [7:0] SR;           //Processor Status Register

    


endmodule

