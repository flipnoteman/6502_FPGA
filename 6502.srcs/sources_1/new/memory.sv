`timescale 1ns / 1ps

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
