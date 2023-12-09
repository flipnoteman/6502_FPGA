`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2023 03:35:50 PM
// Design Name: 
// Module Name: ALUsim
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


module ALUsim;

logic [7:0] A;          // Input Register A
logic [7:0] B;          // Input Register B
logic [4:0] ALUOP;      // ALU Operations (sum, and, xor, or, shift right)
logic dec_enable;       // Decimal Enable
logic carryi;           // Carry in
wire [7:0] out;         // Output Register
wire OF;                // Overflow
wire carry;             // Carry out
wire hcarry;            // Half Carry


ALU uut (A, B, ALUOP, dec_enable, carryi, out, OF, carry, hcarry);


initial begin
    #10;
    
    A = 2;
    //B = 1;
    ALUOP = 5'b01010;
    dec_enable = 1'b0;
    carryi = 1'b0;
    
    #100 $finish;
end

endmodule
