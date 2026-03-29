module Hazard_unit(
    input [4:0] rs1, rs2, rd_ex, rd_mem,
    input RegWrite_ex, RegWrite_mem,
    output reg [1:0] forwardA, forwardB);

always @(*) begin
    forwardA = 2'b00;
    forwardB = 2'b00;

    if (RegWrite_ex && rd_ex != 0 && rd_ex == rs1)
        forwardA = 2'b10;

    if (RegWrite_mem && rd_mem != 0 && rd_mem == rs1)
        forwardA = 2'b01;

    if (RegWrite_ex && rd_ex != 0 && rd_ex == rs2)
        forwardB = 2'b10;

    if (RegWrite_mem && rd_mem != 0 && rd_mem == rs2)
        forwardB = 2'b01;
end
endmodule
