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


module top(
    input reg clock
    );
    reg clock_2mhz;         //CPU clock
    reg [3:0] cyc_count     //Clock cycle counter
    reg [7:0] A;            //Accumulator
    reg [7:0] Y;            //Index Register
    reg [7:0] X;            //Index Register
    reg [15:0] PC;          //Program Counter
    reg [8:0] S;            //Stack Pointer
    reg [7:0] PSR;          //Process Status Register


    clock_divider cd (clock, 50, clock_2mhz); // Get 2mhz clock

    task automatic match_op() 
        case (op)
            8'h00: begin 
                // Your code here
            end
            8'h01: begin
                // Your code here
            end
            8'h02: begin
                // Your code here
            end
            8'h03: begin
                // Your code here
            end
            8'h04: begin
                // Your code here
            end
            8'h05: begin
                // Your code here
            end
            8'hEA: begin //NOP
                
            end
            // ...
            // Repeat for each hex value
            // ...
            8'hFA: begin
                // Your code here
            end
            8'hFB: begin
                // Your code here
            end
            8'hFC: begin
                // Your code here
            end
            8'hFD: begin
                // Your code here
            end
            8'hFE: begin
                // Your code here
            end
            8'hFF: begin
                // Your code here
            end
            default: begin
                // Your code here
            end
        endcase
    endtask

endmodule
