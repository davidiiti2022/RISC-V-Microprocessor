module Pipeline_Top(input clk, reset);

// Simplified top integration (expand with pipeline registers)

wire [31:0] instr, PC;

Fetch_Cycle fetch(clk, reset, instr, PC);

// Further stages connect here (ID, EX, MEM, WB)

endmodule
