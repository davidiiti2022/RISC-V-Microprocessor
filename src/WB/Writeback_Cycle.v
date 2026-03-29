module Writeback_Cycle(input sel,
    input [31:0] alu, mem,
    output [31:0] wb);

assign wb = sel ? mem : alu;
endmodule
