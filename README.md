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
    │   ├───Designs
    │   │       Adder_3bit.png
    │   │       ADD_SUB_4bit.png
    │   │       Decoder_3_to_8.png
    │   │       D_FF.png
    │   │       FA.png
    │   │       HA.png
    │   │       Instruction_Decoder.png
    │   │       LUT_16_7.png
    │   │       MUX_2_way_3_bit.png
    │   │       MUX_2_way_4_bit.png
    │   │       MUX_8_way_4_bit.png
    │   │       NanoProcessor.png
    │   │       PC_3_bit.png
    │   │       Program_Rom.png
    │   │       RCA4.png
    │   │       Register_4bit.png
    │   │       Register_Bank.png
    │   │       SlowClock.png
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
    │   └───Timing-Diagrams
    │           Adder_3bit.png
    │           ADD_SUB_4bit.png
    │           Decoder_3_to_8bit.png
    │           D_FF.png
    │           FA.png
    │           HA.png
    │           Instruction_Decoder.png
    │           LUT_16_7.png
    │           MUX_2_way_3_bit.png
    │           MUX_2_way_4_bit.png
    │           MUX_8_way_4_bit.png
    │           NanoProcessor.png
    │           PC_3_bit.png
    │           Program_ROM.png
    │           RCA4.png
    │           Register_4bit.png
    │           Register_Bank.png
    │           SlowClock.png
    │
    └───NanoProcessor_Extended
        │   NanoProcessor.bit
        │   project_15.xpr
        │
        ├───Designs
        │       Adder_3bit.png
        │       ADD_SUB_4bit.png
        │       Decoder_3_to_8.png
        │       D_FF.png
        │       Instruction_Decoder.png
        │       LUT_16_7.png
        │       MUX_2_way_3_bit.png
        │       MUX_2_way_4_bit.png
        │       NanoProcessor.png
        │       PC_3_bit.png
        │       Program_Rom.png
        │       RCA4.png
        │       Register_4bit.png
        │       Register_Bank.png
        │       SlowClock.png
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
        │   └───wt
        │           project.wpc
        │           synthesis.wdf
        │           synthesis_details.wdf
        │           webtalk_pa.xml
        │           xsim.wdf
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
            ├───impl_1
            │       clockInfo.txt
            │       dfx_runtime.txt
            │       gen_run.xml
            │       htr.txt
            │       init_design.pb
            │       ISEWrap.js
            │       ISEWrap.sh
            │       NanoProcessor.bit
            │       NanoProcessor.tcl
            │       NanoProcessor.vdi
            │       NanoProcessor_12756.backup.vdi
            │       NanoProcessor_bus_skew_routed.pb
            │       NanoProcessor_bus_skew_routed.rpt
            │       NanoProcessor_bus_skew_routed.rpx
            │       NanoProcessor_clock_utilization_routed.rpt
            │       NanoProcessor_control_sets_placed.rpt
            │       NanoProcessor_drc_opted.pb
            │       NanoProcessor_drc_opted.rpt
            │       NanoProcessor_drc_opted.rpx
            │       NanoProcessor_drc_routed.pb
            │       NanoProcessor_drc_routed.rpt
            │       NanoProcessor_drc_routed.rpx
            │       NanoProcessor_io_placed.rpt
            │       NanoProcessor_methodology_drc_routed.pb
            │       NanoProcessor_methodology_drc_routed.rpt
            │       NanoProcessor_methodology_drc_routed.rpx
            │       NanoProcessor_opt.dcp
            │       NanoProcessor_physopt.dcp
            │       NanoProcessor_placed.dcp
            │       NanoProcessor_power_routed.rpt
            │       NanoProcessor_power_routed.rpx
            │       NanoProcessor_power_summary_routed.pb
            │       NanoProcessor_routed.dcp
            │       NanoProcessor_route_status.pb
            │       NanoProcessor_route_status.rpt
            │       NanoProcessor_timing_summary_routed.pb
            │       NanoProcessor_timing_summary_routed.rpt
            │       NanoProcessor_timing_summary_routed.rpx
            │       NanoProcessor_utilization_placed.pb
            │       NanoProcessor_utilization_placed.rpt
            │       opt_design.pb
            │       phys_opt_design.pb
            │       place_design.pb
            │       project.wdf
            │       route_design.pb
            │       rundef.js
            │       runme.bat
            │       runme.log
            │       runme.sh
            │       vivado.jou
            │       vivado.pb
            │       vivado_12756.backup.jou
            │       write_bitstream.pb
            │
            └───synth_1
                    dfx_runtime.txt
                    gen_run.xml
                    htr.txt
                    ISEWrap.js
                    ISEWrap.sh
                    NanoProcessor.dcp
                    NanoProcessor.tcl
                    NanoProcessor.vds
                    NanoProcessor_utilization_synth.pb
                    NanoProcessor_utilization_synth.rpt
                    project.wdf
                    rundef.js
                    runme.bat
                    runme.log
                    runme.sh
                    vivado.jou
                    vivado.pb
                    __synthesis_is_complete__
```
---
