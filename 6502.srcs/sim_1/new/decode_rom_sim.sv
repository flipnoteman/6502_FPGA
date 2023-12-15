`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 04:38:11 PM
// Design Name: 
// Module Name: decode_rom_sim
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


module decode_rom_sim;
    logic [7:0] IR;
    logic [5:0] timing_sig;
    wire [129:0] pla;

    decode_rom uut(IR, timing_sig, pla);

    initial begin
        #10;

        IR = 8'h84;
        timing_sig = 6'b111110;

        #10 timing_sig = 6'b111101;
        #10 timing_sig = 6'b111011;
        #10 timing_sig = 6'b110111;
        #10 timing_sig = 6'b101111;
        #10 timing_sig = 6'b011111;


        $finish;
    end
endmodule
