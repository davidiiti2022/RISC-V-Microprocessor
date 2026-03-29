module Instruction_Memory(input [31:0] addr, output [31:0] instr);
reg [31:0] mem[0:255];

initial begin
    $readmemh("program.mem", mem);
end

assign instr = mem[addr[9:2]];
endmodule
