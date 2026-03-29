module Control_Unit_Top(
    input [6:0] opcode,
    output reg RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg,
    output reg [1:0] ALUOp);

always @(*) begin
    case(opcode)
        7'b0110011: begin // R-type
            RegWrite=1; ALUSrc=0; MemRead=0;
            MemWrite=0; MemtoReg=0; ALUOp=2'b10;
        end
        7'b0010011: begin // I-type
            RegWrite=1; ALUSrc=1; MemRead=0;
            MemWrite=0; MemtoReg=0; ALUOp=2'b11;
        end
        7'b0000011: begin // LW
            RegWrite=1; ALUSrc=1; MemRead=1;
            MemWrite=0; MemtoReg=1; ALUOp=2'b00;
        end
        7'b0100011: begin // SW
            RegWrite=0; ALUSrc=1; MemRead=0;
            MemWrite=1; MemtoReg=0; ALUOp=2'b00;
        end
        default: begin
            RegWrite=0; ALUSrc=0; MemRead=0;
            MemWrite=0; MemtoReg=0; ALUOp=2'b00;
        end
    endcase
end
endmodule
