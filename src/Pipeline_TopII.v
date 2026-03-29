module Pipeline_Top(input clk, reset);

// IF
wire [31:0] PC, instr;
Fetch_Cycle IF(clk, reset, instr, PC);

// IF/ID
wire [31:0] PC_ID, instr_ID;
IF_ID ifid(clk, reset, PC, instr, PC_ID, instr_ID);

// Decode fields
wire [4:0] rs1 = instr_ID[19:15];
wire [4:0] rs2 = instr_ID[24:20];
wire [4:0] rd  = instr_ID[11:7];

// Register File
wire [31:0] rd1, rd2;
Register_File RF(clk, rs1, rs2, rd, wb_data, RegWrite_WB, rd1, rd2);

// Control
wire RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg;
wire [1:0] ALUOp;

Control_Unit_Top CU(instr_ID[6:0], RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, ALUOp);

// Immediate
wire [31:0] imm;
Sign_Extend SE(instr_ID, imm);

// ID/EX
wire [31:0] rd1_EX, rd2_EX, imm_EX;
wire [4:0] rs1_EX, rs2_EX, rd_EX;
wire [2:0] ALUCtrl;

ALU_Decoder ALUdec(ALUOp, instr_ID[14:12], instr_ID[30], ALUCtrl);

ID_EX idex(clk, reset, PC_ID, rd1, rd2, imm,
           rs1, rs2, rd, ALUCtrl,
           ALUSrc, RegWrite, MemRead, MemWrite, MemtoReg,
           , rd1_EX, rd2_EX, imm_EX,
           rs1_EX, rs2_EX, rd_EX,
           , , , , );

// Forwarding
wire [1:0] forwardA, forwardB;
Hazard_unit HU(rs1_EX, rs2_EX, rd_MEM, rd_WB,
               RegWrite_MEM, RegWrite_WB,
               forwardA, forwardB);

// Forward mux
wire [31:0] A, B;
Forwarding_Mux FM(rd1_EX, rd2_EX, alu_MEM, wb_data,
                  forwardA, forwardB, A, B);

// ALU input mux
wire [31:0] alu_in2 = ALUSrc ? imm_EX : B;

// ALU
wire [31:0] alu_out;
ALU alu(A, alu_in2, ALUCtrl, alu_out);

// EX/MEM
wire [31:0] alu_MEM, rd2_MEM;
wire [4:0] rd_MEM;
wire RegWrite_MEM, MemRead_MEM, MemWrite_MEM, MemtoReg_MEM;

EX_MEM exmem(clk, reset, alu_out, rd2_EX, rd_EX,
             RegWrite, MemRead, MemWrite, MemtoReg,
             alu_MEM, rd2_MEM, rd_MEM,
             RegWrite_MEM, MemRead_MEM, MemWrite_MEM, MemtoReg_MEM);

// Memory
wire [31:0] mem_data;
Data_Memory DM(clk, MemWrite_MEM, MemRead_MEM,
               alu_MEM, rd2_MEM, mem_data);

// MEM/WB
wire [31:0] mem_WB, alu_WB;
wire [4:0] rd_WB;
wire RegWrite_WB, MemtoReg_WB;

MEM_WB memwb(clk, reset, mem_data, alu_MEM, rd_MEM,
             RegWrite_MEM, MemtoReg_MEM,
             mem_WB, alu_WB, rd_WB,
             RegWrite_WB, MemtoReg_WB);

// Writeback
wire [31:0] wb_data = MemtoReg_WB ? mem_WB : alu_WB;

endmodule
