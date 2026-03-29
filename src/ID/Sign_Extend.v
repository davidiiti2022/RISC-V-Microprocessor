module Sign_Extend(input [31:0] instr, output reg [31:0] imm);
always @(*) begin
    imm = {{20{instr[31]}}, instr[31:20]};
end
endmodule
