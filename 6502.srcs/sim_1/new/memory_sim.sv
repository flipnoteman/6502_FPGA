`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 03:22:33 PM
// Design Name: 
// Module Name: memory_sim
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

module memory_sim;
    reg [15:0] address;
    reg rwb;
    wire [7:0] data_bus;
    reg [7:0] data;

    // Instantiate the memory module
    memory u1 (
        .address(address),
        .rwb(rwb),
        .data_bus(data_bus)
    );

    initial begin
        // Initialize inputs
        address = 0;
        rwb = 0;
    end

    assign data_bus = (rwb) ? 8'hZZ : data;

    initial begin
        // Test write operation
        #100 address = 8'h01; rwb = 0; data = 8'hF0; // Write 0xF0 to address 0x01

        #100 address = 8'h02; data = 8'h11; // Write 0x11 to address 0x02
        // Test read operation
        #100 rwb = 1; address = 16'h0001;  // Read from address 0xAA

        #100 address = 16'h0002; // Read from address 0xAB

        #10 $finish; // End simulation
    end

    always @(negedge clk) begin
        if (rwb)
            $display("At time %t, wrote %h at address %h", $time, data_bus, address);
        else
            $display("At time %t, read %h from address %h", $time, data_bus, address);
    end
endmodule
