module Register_File(input clk,
    input [4:0] rs1, rs2, rd,
    input [31:0] wd,
    input regwrite,
    output [31:0] rd1, rd2);

reg [31:0] regfile[0:31];

assign rd1 = regfile[rs1];
assign rd2 = regfile[rs2];

always @(posedge clk) begin
    if (regwrite && rd != 0)
        regfile[rd] <= wd;
end
endmodule
