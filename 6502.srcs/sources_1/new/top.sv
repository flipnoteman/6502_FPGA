`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 04:05:39 PM
// Design Name: 
// Module Name: top
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

// System Definition
module top(
    input clk
    );

    wire [7:0] data_bus;    // Data bus
    wire clock_2mhz;        // CPU clock
    wire rwb;
    wire [15:0] address;    // Address pins
    reg [3:0] cyc_count;    // Clock cycle counter

    clock_divider cd (clk, 50, clock_2mhz); // Get 2mhz clock

    cpu_6502 cpu (.clk(clock_2mhz), .address(address), .rwb(rwb), .data_bus(data_bus));
    memory mem (.address(address), .rwb(rwb), .data_bus(data_bus));

    
endmodule
