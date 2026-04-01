# RISC-V-32-bit-Pipelined-Microprocessor

**Domain:** Digital Design / Computer Architecture  
**Language:** Verilog HDL  
**Tools:** Xilinx Vivado  

---

## 📌 Project Overview
This project presents the design and implementation of a **32-bit RISC-V (RV32I) pipelined microprocessor** using Verilog HDL. The processor follows a **classical 5-stage pipeline architecture** to improve instruction throughput and overall performance.  

To address pipeline inefficiencies, **data hazards are resolved using forwarding (bypassing) logic**, allowing dependent instructions to execute without pipeline stalls (except load-use cases).

---

## 🎯 Objectives
- Design a modular 5-stage pipelined processor  
- Implement a subset of the RV32I instruction set  
- Separate datapath and control logic for scalability  
- Implement hazard handling using forwarding  
- Perform RTL simulation and waveform-based verification  

---

## 🏗️ Architecture Overview

The processor is divided into five pipeline stages:

### 1. Instruction Fetch (IF)
- Maintains Program Counter (PC)  
- Computes next PC (PC + 4)  
- Fetches instruction from instruction memory  

### 2. Instruction Decode (ID)
- Decodes opcode and instruction fields  
- Generates control signals  
- Reads operands from register file  
- Performs sign extension of immediate values  

### 3. Execute (EX)
- Performs arithmetic and logical operations  
- Selects operands using multiplexers  
- Computes branch/jump addresses  

### 4. Memory Access (MEM)
- Performs load and store operations  
- Interfaces with data memory  

### 5. Write Back (WB)
- Selects result (ALU or memory)  
- Writes data back to register file  

---

## 📘 Supported Instructions (RV32I Subset)

### R-Type
- ADD, SUB, AND, OR, SLT  

### I-Type
- ADDI, ANDI, ORI, LW  

### S-Type
- SW  

### J-Type
- JAL  

All instructions follow standard 32-bit RISC-V encoding.

---

## 🛠 Core Components

### 🔹 Program Counter (PC)
- Holds address of current instruction  
- Updated every clock cycle  

### 🔹 Instruction Memory
- Stores program instructions  
- Word-addressable memory  

### 🔹 Register File
- 32 registers (x0–x31), each 32-bit  
- x0 is always zero  
- Two read ports and one write port  

### 🔹 ALU (Arithmetic Logic Unit)
- Supports:
  - Addition, Subtraction  
  - AND, OR  
  - Set Less Than (SLT)  
- Controlled by ALU Control Unit  

### 🔹 Control Unit
- Decodes opcode and generates control signals  
- Separates datapath and control logic  

### 🔹 Data Memory
- Supports LW (read) and SW (write) operations  
- Synchronous write and combinational read  

### 🔹 Pipeline Registers
- Maintain data between pipeline stages  
- Enable parallel execution of instructions  

---

## ⚡ Hazard Handling

### Forwarding-Based Data Hazard Resolution
To avoid pipeline stalls due to data dependencies:

- EX/MEM → EX forwarding  
- MEM/WB → EX forwarding  

This ensures that updated values are directly forwarded to dependent instructions.

**Note:**  
- No stall mechanism implemented  
- Load-use hazard is not handled  

---

## 🧩 Project Structure
```
RISC-V-Microprocessor/
│── src/
│   ├── IF/
│   │   ├── PC.v
│   │   ├── PC_Adder.v
│   │   ├── Instruction_Memory.v
│   │   ├── Fetch_Cycle.v
│   │
│   ├── ID/
│   │   ├── Decode_Cycle.v
│   │   ├── Register_File.v
│   │   ├── Sign_Extend.v
│   │   ├── Main_Decoder.v
│   │   ├── Control_Unit_Top.v
│   │
│   ├── EX/
│   │   ├── Execute_Cycle.v
│   │   ├── ALU.v
│   │   ├── ALU_Decoder.v
│   │   ├── Mux.v
│   │
│   ├── MEM/
│   │   ├── Memory_Cycle.v
│   │   ├── Data_Memory.v
│   │
│   ├── WB/
│   │   ├── Writeback_Cycle.v
│   │
│   ├── Hazard_Unit/
│   │   ├── Hazard_unit.v
│   │
│   ├── Pipeline_Top.v
│
│── testbench/
│   ├── pipeline_tb.v
│
│── README.md
```

---

## 🧪 Simulation & Verification
- Tool Used: **Xilinx Vivado**  
- Testbench: `pipeline_tb.v`  

### Verified Scenarios:
- Arithmetic operations (ADD, SUB, etc.)  
- Logical operations (AND, OR)  
- Memory operations (LW, SW)  
- Data hazard forwarding cases  
- Multi-cycle pipeline execution  

Waveforms were analyzed to verify correct timing and functionality.

---

## 📈 Results
- Correct execution of RV32I instruction subset  
- Improved pipeline efficiency using forwarding  
- Accurate register updates and memory operations  
- Verified using simulation waveforms  

---

## 🎯 Learning Outcomes
- In-depth understanding of RISC-V ISA  
- Practical implementation of pipelined processors  
- Hazard detection and forwarding techniques  
- RTL design using Verilog  
- Debugging using waveform analysis tools  

---

## 🚀 Future Enhancements
- Implement stall mechanism for load-use hazards  
- Add branch handling and prediction  
- Extend support to full RV32I instruction set  
- Integrate cache memory  
- FPGA implementation  

---

## 
**David Kumar**  
B.Tech Electrical Engineering  
IIT Indore  

---
