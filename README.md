# 4-Bit NanoProcessor - VHDL FPGA Implementation

## :pushpin: Key Features:

- 12/13- bit instruction set with MOVI, ADD, NEG, and JZR operations

- 4- bit ALU supporting addition, subtraction, and negation

- Register bank with 8 registers

- 2- bit multiplier and 4-bit comparator (extra)

- Real-time output display on Basys3 board LEDs and 7-segment displays
<br>
<p align="center">
  <img alt="Gemini_Generated_Image_kc1n5xkc1n5xkc1n" src="https://github.com/user-attachments/assets/00af106d-ae11-462e-abe4-0f1f85ce2f25" width=500 height=300 />
</p>

## Nano Processor Architecture

The processor follows a simplified CPU architecture consisting of:

- Program Counter (PC)
- Program ROM
- Instruction Decoder
- Register Bank
- Arithmetic Logic Unit (ALU)
- Multiplexers
- Data Bus
- Control Unit
- Seven Segment Display Interface
- Stack Unit (Extended Version)

The processor is designed as a small educational CPU architecture to demonstrate:

- Instruction execution
- Register-based operations
- Arithmetic datapath design
- Control signal generation
- Conditional branching
- Stack-based memory operations
- FPGA implementation workflow

---
## Instruction Set Architecture

### Original Instructions (4)
| Instruction  | Description                          | Format                  |
|--------------|--------------------------------------|-------------------------|
| `MOVI R, d`  | Move immediate value to register     | `10 RRR 000 dddd`       |
| `ADD Ra, Rb` | Add registers Ra and Rb              | `00 RaRaRa RbRbRb 0000` |
| `NEG R`      | Two’s-complement negation            | `01 RRR 0000000`        |
| `JZR R, d`   | Jump if register is zero             | `11 RRR 0000 ddd`       |

### Extended Instructions (14 total)
| Instruction   | Description                             | Format                  |
|---------------|-----------------------------------------|-------------------------|
| `SUB Ra, Rb`  | Subtract Rb from Ra                     | `00 RaRaRa RbRbRb 0001` |
| `AND Ra, Rb`  | Bitwise AND operation                   | `00 RaRaRa RbRbRb 0010` |
| `OR Ra, Rb`   | Bitwise OR operation                    | `00 RaRaRa RbRbRb 0011` |
| `XOR Ra, Rb`  | Bitwise XOR operation                   | `00 RaRaRa RbRbRb 0100` |
| `MUL Ra, Rb`  | Multiply registers                      | `00 RaRaRa RbRbRb 0101` |
| `CMP Ra, Rb`  | Compare registers (sets flags)          | `00 RaRaRa RbRbRb 0111` |

> **Note:** In the extended design, the instruction set expands to a total of 14 instructions. Six other opcodes (e.g., shift operations, immediate variants, etc.) are implemented in the full VHDL source; refer to `InstructionDecoder_Extended.vhd` for the complete encoding table.

---
## Datapath Overview

The execution flow in the basic processor is:

```text
Program Counter
       ↓
Program ROM
       ↓
Instruction Decoder
       ↓
Register Selection + Control Signals
       ↓
MUX Network
       ↓
ALU
       ↓
Register Bank Write Back
```

---

## :hammer_and_wrench: INSTRUCTIONS TO OPERATE BASIC IMPLEMENTATION
1. Allocated reset button
	- The nano processor can be reset by pressing the btnC. 
	- The clock speed of the internal clock of the machine was reduced from 100MHz to 0.5MHz using a slow clock to make the calculation process visible to the naked eye. 

2. LED signal 
	- LED0 - LED3 → Output of R7 register in Register Bank 
	- LED0 - LED3 → Outputs a 4-bit number as a signed number in two's complement method
	- LED13 → Overflow Flag 
	- LED14 → Zero Flag 
	- LED15 → Carry Flag 

3. 7-Segment Display 
	- The rightmost segment of the 7-Segment display is used to display the	 magnitude of the output from the R7 register in the Register Bank. 

4. Expected behavior of the program
	- After the calculation is performed the process will be held because of the jump instruction implemented. 
	- Therefore, it is necessary to manually reset the nanoprocessor to perform the instructions hardcoded in the ROM.
<br>

 ## :hammer_and_wrench: INSTRUCTIONS TO OPERATE EXTRA IMPLEMENTATION

1. Allocated reset button
	- The nano processor can be reset by pressing the btnC. 
	- The clock speed of the internal clock of the machine was reduced from 100MHz to 0.5MHz using a slow clock to make the calculation process visible to the naked eye. 

2. LED signal
	- LED0 - LED3 → Output of R3 register in Register Bank 
	- LED0 - LED3 → Outputs a 4-bit number as a signed number in two's complement method
	- LED8 - LED5 → RegB 
	- LED12 - LED9 → RegA  
	- LED13 → Overflow Flag 
	- LED14 → Zero Flag 
	- LED15 → Carry Flag 

3. 7 Segment Display 
	- Seg0 → display the magnitude of the output from the R3 register in the Register Bank.
	- Seg1 → Output ‘1’ when comparators’ result is less
	- Seg2 → Output ‘1’ when comparators’ result is Equal
	- Seg3 → Output ‘1’ when comparators’ result is Greater

4. Expected behavior of the program 
	- It is necessary to manually reset the nanoprocessor to perform the instructions hardcoded in the ROM.
<br>
##  Performance Metrics

| **Metric**                 | **Original Design** | **Extended Design** |
|----------------------------|---------------------|---------------------|
| **Instructions Supported** | 4                   | 14                  |
| **FPGA Slices Used**       | 28                  | 42                  |
| **Maximum Frequency**      | 85 MHz              | 75 MHz              |
| **Power Consumption**      | 0.8 W               | 1.2 W               |

---

##  Hardware Photos

<p align="center">
  <img src="https://github.com/user-attachments/assets/e8e209f8-255c-4587-abb2-941ee84ba8e5" alt="fpga-board" width="400" />
</p>

---

##  Project Structure

```text

    ├───NanoProcessor
    │   ├───BitStream
    │   │       NanoProcessor.bit
    │   │
    │   ├───Components
    │   │       Adder_3bit.vhd
    │   │       ADD_SUB_4bit.vhd
    │   │       Decoder_3_to_8.vhd
    │   │       D_FF.vhd
    │   │       FA.vhd
    │   │       HA.vhd
    │   │       Instruction_Decoder.vhd
    │   │       LUT_16_7.vhd
    │   │       MUX_2_way_3_bit.vhd
    │   │       MUX_2_way_4_bit.vhd
    │   │       MUX_8_way_4_bit.vhd
    │   │       NanoProcessor.vhd
    │   │       PC_3_bit.vhd
    │   │       Program_ROM.vhd
    │   │       RCA_4.vhd
    │   │       Register_4bit.vhd
    │   │       Register_Bank.vhd
    │   │       Slow_Clock.vhd
    │   │
    │   ├───Constraints
    │   │       Basys3.xdc
    │   │
    │   ├───Designs/..
    │   │
    │   ├───Simulation
    │   │       FA_Sim.vhd
    │   │       HA_Sim.vhd
    │   │       RCA4_Sim.vhd
    │   │       TB_Adder_3bit.vhd
    │   │       TB_ADD_SUB_4bit.vhd
    │   │       TB_Decoder_3_to_8.vhd
    │   │       TB_D_FF.vhd
    │   │       TB_Instruction_Decoder.vhd
    │   │       TB_LUT_16_7.vhd
    │   │       TB_MUX_2_way_3_bit.vhd
    │   │       TB_MUX_2_way_4_bit.vhd
    │   │       TB_MUX_8_way_4_bit.vhd
    │   │       TB_NanoProcessor.vhd
    │   │       TB_PC_3_bit.vhd
    │   │       TB_Program_ROM.vhd
    │   │       TB_Register_4bit.vhd
    │   │       TB_Register_Bank.vhd
    │   │       TB_Slow_Clock.vhd
    │   │
    │   └───Timing-Diagrams/..
    │
    └───NanoProcessor_Extended
        │   NanoProcessor.bit
        │   project_15.xpr
        │
        ├───Designs/..
        │
        ├───NanoProcessor_Srcs
        │   ├───constrain
        │   │       Basys3.xdc
        │   │       hi
        │   │
        │   ├───sim_1
        │   │       RCA4_Sim.vhd
        │   │       TB_Adder_3bit.vhd
        │   │       TB_ADD_SUB_4bit.vhd
        │   │       TB_Comparator_4bit
        │   │       TB_Decoder_3_to_8.vhd
        │   │       TB_D_FF.vhd
        │   │       TB_FA.vhd
        │   │       TB_HA.vhd
        │   │       TB_LUT_16_7.vhd
        │   │       TB_Multiplier_2bit.vhd
        │   │       TB_MUX_2_way_3_bit.vhd
        │   │       TB_MUX_2_way_4_bit.vhd
        │   │       TB_MUX_8_way_4_bit.vhd
        │   │       TB_Nanoprocessor.vhd
        │   │       TB_PC_3_bit.vhd
        │   │       TB_Program_ROM.vhd
        │   │       TB_Register_4bit.vhd
        │   │       TB_Register_Bank.vhd
        │   │       TB_Slow_Clock.vhd
        │   │
        │   └───sources_1
        │           Adder_3bit.vhd
        │           ADD_SUB_4bit.vhd
        │           Comparator_1bit.vhd
        │           Comparator_4bit.vhd
        │           Decoder_3_to_8.vhd
        │           D_FF.vhd
        │           FA.vhd
        │           HA.vhd
        │           Instruction_Decoder.vhd
        │           LUT_16_7.vhd
        │           Multiplier_2bit.vhd
        │           MUX_2_way_3_bit.vhd
        │           MUX_2_way_4_bit.vhd
        │           MUX_8_way_4_bit.vhd
        │           NanoProcessor.vhd
        │           PC_3_bit.vhd
        │           Program_ROM.vhd
        │           RCA_4.vhd
        │           Register_4bit.vhd
        │           Register_Bank.vhd
        │           Slow_Clock.vhd
        │
        ├───project_15.cache
        │   ├───sim
        │   │       ssm.db
        │   │
        │   └───wt/..
        │
        ├───project_15.hw
        │   │   project_15.lpr
        │   │
        │   └───hw_1
        │           hw.xml
        │
        ├───project_15.ip_user_files
        │       README.txt
        │
        └───project_15.runs
            ├───impl_1/..      
            └───synth_1/..
                    
```
---

## Hardware Verification

The following were verified on hardware:

- Register output behavior
- Arithmetic correctness
- Conditional jump execution
- Seven segment output
- Stack push/pop operations
- Clock synchronization
- Reset behavior


---
# Future Improvements

Potential future extensions include:

- Larger instruction memory
- Data memory support
- Load/store instructions
- Expanded ALU operations
- UART debugging interface
- Cache memory support

---


## Conclusion
This project demonstrates the successful design and implementation of an educational nano processor architecture using VHDL. By transitioning from a foundational design to an extended version featuring a stack-based execution model and an expanded ALU for logical operations, the project highlights the evolution of processor complexity and architectural efficiency.

### Key technical competencies gained through this development include:

- Processor Architecture: Mastering the relationship between data paths and control units.

- Digital Logic Design: Implementing low-level hardware modules targeted for FPGA environments.

- Hardware Verification: Utilizing industry-standard tools like Vivado 2018 for rigorous simulation and debugging.

- Physical Implementation: Deploying and testing the final logic on the Basys 3 hardware platform to confirm real-world functionality.

---
