 module latch(load, in, out);

 parameter WIDTH = 8;

 input load;
 input [WIDTH-1: 0] in;
 output reg [WIDTH-1: 0] out;

 always @(load or in)
   if (load)
     out <= in;

endmodule