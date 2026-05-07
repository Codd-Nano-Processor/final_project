## :pushpin: Key Features:

- 12/13- bit instruction set with MOVI, ADD, NEG, and JZR operations

- 4- bit ALU supporting addition, subtraction, and negation

- Register bank with 8 registers

- 2- bit multiplier and 4-bit comparator (extra)

- Real-time output display on Basys3 board LEDs and 7-segment displays
<br>

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
