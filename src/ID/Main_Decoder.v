module Main_Decoder(input [6:0] opcode,
    output reg RegWrite, ALUSrc, MemWrite, MemRead);

always @(*) begin
    case(opcode)
        7'b0110011: begin // R-type
            RegWrite=1; ALUSrc=0; MemWrite=0; MemRead=0;
        end
        7'b0010011: begin // I-type
            RegWrite=1; ALUSrc=1; MemWrite=0; MemRead=0;
        end
        7'b0000011: begin // LW
            RegWrite=1; ALUSrc=1; MemRead=1;
        end
        7'b0100011: begin // SW
            MemWrite=1;
        end
        default: begin
            RegWrite=0; ALUSrc=0; MemWrite=0; MemRead=0;
        end
    endcase
end
endmodule
