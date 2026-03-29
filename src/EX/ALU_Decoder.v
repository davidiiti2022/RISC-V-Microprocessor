module ALU_Decoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input funct7,
    output reg [2:0] ALUCtrl);

always @(*) begin
    case(ALUOp)
        2'b00: ALUCtrl = 3'b000; // ADD (LW, SW)
        2'b10: begin // R-type
            case({funct7, funct3})
                4'b0000: ALUCtrl = 3'b000; // ADD
                4'b1000: ALUCtrl = 3'b001; // SUB
                4'b0111: ALUCtrl = 3'b010; // AND
                4'b0110: ALUCtrl = 3'b011; // OR
                4'b0010: ALUCtrl = 3'b100; // SLT
            endcase
        end
        2'b11: begin // I-type
            case(funct3)
                3'b000: ALUCtrl = 3'b000; // ADDI
                3'b111: ALUCtrl = 3'b010; // ANDI
                3'b110: ALUCtrl = 3'b011; // ORI
            endcase
        end
        default: ALUCtrl = 3'b000;
    endcase
end
endmodule
