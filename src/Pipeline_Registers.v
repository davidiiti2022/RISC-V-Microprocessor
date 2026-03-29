// IF/ID
module IF_ID(input clk, reset,
    input [31:0] PC_in, instr_in,
    output reg [31:0] PC_out, instr_out);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC_out <= 0; instr_out <= 0;
    end else begin
        PC_out <= PC_in;
        instr_out <= instr_in;
    end
end
endmodule

// ID/EX
module ID_EX(input clk, reset,
    input [31:0] PC, rd1, rd2, imm,
    input [4:0] rs1, rs2, rd,
    input [2:0] ALUCtrl,
    input ALUSrc, RegWrite, MemRead, MemWrite, MemtoReg,
    output reg [31:0] PC_o, rd1_o, rd2_o, imm_o,
    output reg [4:0] rs1_o, rs2_o, rd_o,
    output reg [2:0] ALUCtrl_o,
    output reg ALUSrc_o, RegWrite_o, MemRead_o, MemWrite_o, MemtoReg_o);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC_o<=0; rd1_o<=0; rd2_o<=0; imm_o<=0;
        rs1_o<=0; rs2_o<=0; rd_o<=0;
    end else begin
        PC_o<=PC; rd1_o<=rd1; rd2_o<=rd2; imm_o<=imm;
        rs1_o<=rs1; rs2_o<=rs2; rd_o<=rd;
        ALUCtrl_o<=ALUCtrl;
        ALUSrc_o<=ALUSrc; RegWrite_o<=RegWrite;
        MemRead_o<=MemRead; MemWrite_o<=MemWrite;
        MemtoReg_o<=MemtoReg;
    end
end
endmodule

// EX/MEM
module EX_MEM(input clk, reset,
    input [31:0] alu_res, rd2,
    input [4:0] rd,
    input RegWrite, MemRead, MemWrite, MemtoReg,
    output reg [31:0] alu_res_o, rd2_o,
    output reg [4:0] rd_o,
    output reg RegWrite_o, MemRead_o, MemWrite_o, MemtoReg_o);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        alu_res_o<=0; rd2_o<=0; rd_o<=0;
    end else begin
        alu_res_o<=alu_res;
        rd2_o<=rd2;
        rd_o<=rd;
        RegWrite_o<=RegWrite;
        MemRead_o<=MemRead;
        MemWrite_o<=MemWrite;
        MemtoReg_o<=MemtoReg;
    end
end
endmodule

// MEM/WB
module MEM_WB(input clk, reset,
    input [31:0] mem_data, alu_res,
    input [4:0] rd,
    input RegWrite, MemtoReg,
    output reg [31:0] mem_data_o, alu_res_o,
    output reg [4:0] rd_o,
    output reg RegWrite_o, MemtoReg_o);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        mem_data_o<=0; alu_res_o<=0; rd_o<=0;
    end else begin
        mem_data_o<=mem_data;
        alu_res_o<=alu_res;
        rd_o<=rd;
        RegWrite_o<=RegWrite;
        MemtoReg_o<=MemtoReg;
    end
end
endmodule
