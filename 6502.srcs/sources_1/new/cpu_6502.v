`timescale 1ns / 1ps

module cpu_6502(
    input clk,
    output clk_1,
    output clk_2,
    output [15:0] address,
    output rw,
    inout [7:0] data_bus
    );
        
    reg [7:0] A;            //Accumulator
    reg [7:0] Y;            //Index Register
    reg [7:0] X;            //Index Register
    reg [15:0] PC;          //Program Counter
    reg [7:0] SP;           //Stack Pointer
    reg [7:0] SR;           //Processor Status Register


    /////////////////////////////////////////////////////////////////////////////////////
    //
    //  Clock Generator and Decode Rom
    //
    /////////////////////////////////////////////////////////////////////////////////////
    reg [7:0] IR;
    reg [5:0] timing_sig;
    reg [129:0] pla;

    clock_generator cg(clk, CLK_1, CLK_2);
    
    decode_rom dcr(IR, timing_sig, pla);

    
endmodule

