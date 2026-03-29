# RISC-V 32-bit Pipelined Microprocessor (RV32I)

A 32-bit RISC-V pipelined microprocessor implemented in Verilog, supporting a subset of the RV32I instruction set. The design follows a classical 5-stage pipeline and uses forwarding logic to resolve data hazards efficiently.

🚀 Features
32-bit RISC-V (RV32I subset) implementation
5-stage pipelined architecture (IF, ID, EX, MEM, WB)
Modular RTL design (separate datapath and control units)
Forwarding-based data hazard handling (no stalls)
Synthesizable Verilog design
Verified using waveform simulation (Vivado)
🏗️ Architecture Overview

The processor is divided into 5 pipeline stages:

Instruction Fetch (IF)
Fetches instruction from memory
Updates Program Counter (PC)
Instruction Decode (ID)
Decodes instruction
Reads register operands
Generates control signals
Execute (EX)
Performs ALU operations
Computes branch/jump targets
Memory Access (MEM)
Handles load/store operations
Write Back (WB)
Writes results back to register file
📘 Supported Instructions (RV32I Subset)
R-Type
ADD, SUB, AND, OR, SLT
I-Type
ADDI, ANDI, ORI, LW
S-Type
SW
J-Type
JAL
⚙️ Key Components
🔹 Register File
32 registers (x0–x31)
32-bit width
x0 hardwired to zero
2 read ports, 1 write port
🔹 ALU
Supports arithmetic and logical operations
Controlled by ALU Decoder
🔹 Memories
Instruction Memory: Stores program instructions
Data Memory: Used for load/store operations
⚡ Hazard Handling
Forwarding-based data hazard resolution
Supports:
EX/MEM → EX forwarding
MEM/WB → EX forwarding
Eliminates need for pipeline stalls (except load-use not handled)
🧩 Project Structure
RISC-V-Microprocessor/
│── src/
│   ├── IF/
│   ├── ID/
│   ├── EX/
│   ├── MEM/
│   ├── WB/
│   ├── Hazard_Unit/
│   ├── Pipeline_Top.v
│
│── testbench/
│   ├── pipeline_tb.v
│
│── docs/
│   ├── architecture_diagram.png
│
│── README.md
🧪 Simulation & Verification
Tool: Xilinx Vivado
Testbench: pipeline_tb.v
Verified:
Arithmetic operations
Memory operations (LW, SW)
Forwarding scenarios
Pipeline execution flow
📊 Results
Correct execution of RV32I subset instructions
Reduced pipeline stalls using forwarding logic
Verified timing and functionality through waveform analysis
🎯 Learning Outcomes
RISC-V Instruction Set Architecture
Pipeline processor design
Data hazard handling techniques
RTL design using Verilog
Debugging using waveform analysis
📌 Future Improvements
Add stall mechanism for load-use hazards
Implement branch prediction
Extend instruction set (full RV32I)
Add cache memory
👨‍💻 Author

David Kumar
