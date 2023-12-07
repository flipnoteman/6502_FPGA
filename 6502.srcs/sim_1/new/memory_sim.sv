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

module testbench;
    reg clk;
    reg [15:0] address;
    reg rwb;
    wire [7:0] data_bus;
    reg [7:0] data;

    // Instantiate the memory module
    memory u1 (
        .clk(clk),
        .address(address),
        .rwb(rwb),
        .data_bus(data_bus)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        address = 0;
        rwb = 0;
        //data = 0;

        // Create clock signal
        forever #10 clk = ~clk;
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

// module memory_sim;
    
//     reg clk;
//     reg [15:0] address;
//     reg rwb;
//     reg [7:0] data_bus;
//     //wire [7:0] data;
   
//     //assign data_bus = (rwb) ? data : 8'bz;

   
//     memory mem (
//         .clk(clk),
//         .address(address),
//         .rwb(rwb),
//         .data_bus(data_bus)
//     );

//     initial begin    
//         clk = 1'b0;
//         forever begin
//             #10 clk = ~clk;
//         end
//     end

//     initial begin
//         data_bus = 8'bz;

//         #100;

//         address = 16'h1352;
//         rwb = 1'b1;
//         data_bus = 8'hFF;
        
//         #10;

//         rwb = 1'b0; 
//         data_bus = 8'bz;


//         #100;

//         address = 16'hFFFF; // Checking write outside of RAM space
//         rwb = 1'b1;
//         data_bus = 8'hFF;
        
//         #10;

//         rwb = 1'b0; 
//         data_bus = 8'bz;
        
//         #100;

//         address = 16'h14D2;
        
//         #100;
        
//         address = 16'hFFFF;
        
//         $finish;
//     end
// endmodule
