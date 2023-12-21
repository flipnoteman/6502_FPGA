`timescale 1ns / 1ps

module clock_generator(
        input clk_in,
        output clk_1,
        output clk_2
    );

    assign clk_1 = (clk_2 == 1'bz) ? ~clk_in : ~clk_in & ~clk_2;
    assign clk_2 = (clk_1 == 1'bz) ? clk_in : clk_in & ~clk_1;

endmodule
