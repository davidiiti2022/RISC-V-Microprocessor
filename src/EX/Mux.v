module Mux(input sel,
           input [31:0] a, b,
           output [31:0] y);
assign y = sel ? b : a;
endmodule
