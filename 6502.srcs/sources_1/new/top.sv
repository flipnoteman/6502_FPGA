`timescale 1ns / 1ps

// System Definition

module top(
    input clk
    );

    wire [7:0] data_bus;    // Data bus
    wire clock_2mhz;        // CPU clock
    wire clk_1;
    wire clk_2;
    wire rw;
    wire [15:0] address;    // Address pins
    reg [3:0] cyc_count;    // Clock cycle counter

    clock_divider cd (clk, 50, clock_2mhz); // Get 2mhz clock

    cpu_6502 cpu (clock_2mhz, clk_1, clk_2, address, rw, data_bus);
    memory mem (address, rwb, data_bus);

    
endmodule
