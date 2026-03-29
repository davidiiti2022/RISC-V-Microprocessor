module Data_Memory(input clk,
    input MemWrite, MemRead,
    input [31:0] addr, wd,
    output [31:0] rd);

reg [31:0] mem[0:255];

always @(posedge clk) begin
    if (MemWrite)
        mem[addr[9:2]] <= wd;
end

assign rd = MemRead ? mem[addr[9:2]] : 0;
endmodule
