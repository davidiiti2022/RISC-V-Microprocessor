module Fetch_Cycle(input clk, reset,
                   output [31:0] instr, PC_out);

wire [31:0] PC_next;

PC pc(clk, reset, PC_next, PC_out);
PC_Adder adder(PC_out, PC_next);
Instruction_Memory imem(PC_out, instr);

endmodule
