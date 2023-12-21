`timescale 1ns / 1ps

module ALU(
        input [7:0] A,          // Input Register A
        input [7:0] B,          // Input Register B
        input [4:0] ALUOP,      // ALU Operations (sum, and, xor, or, shift right)
        input dec_enable,       // Decimal Enable
        input carryi,           // Carry in
        output [7:0] out,       // Output Register
        output OF,              // Overflow
        output carry,           // Carry out
        output hcarry           // Half Carry
    );
    
    logic [7:0] rout;
    logic cout;
    
    assign carry = cout;
    assign out = rout;
    
    always @(*) begin
        case(ALUOP)
            5'h0D: begin // ADD 011BBB01
                assign {cout, rout} = A + B + carryi;
            end
            5'h05: begin // AND 001BBB01
                assign rout = A & B;
            end
            5'h01: begin // OR 000BBB01
                assign rout = A | B;
            end
            5'h09: begin // XOR 010BBB01
                assign rout = A ^ B;
            end
            5'b01010: begin // SHIFT RIGHT 010BBB10
                assign cout = A[0];
                assign rout = A >> 1'b1;
            end
        endcase
    end

endmodule