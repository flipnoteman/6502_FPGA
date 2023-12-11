`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 01:43:42 PM
// Design Name: 
// Module Name: memory
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


module memory(
        input [15:0] address,
        input rwb,                  // Read/Write Bus 1: Read; 0: Write
        inout [7:0] data_bus
    );

    parameter SIZE = 16'h7FFF; 
    logic [7:0] RAM [0:SIZE];       // 32K x 8 bits of RAM

    assign data_bus = (rwb) ? RAM[address] : 8'hZZ; // Tri-state buffer for in_out port

    always @(rwb or data_bus or address) begin
        if (~rwb)              // Write Logic
            RAM[address] = data_bus;
    end

endmodule
