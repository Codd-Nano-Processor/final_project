library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
    component Instruction_Decoder
        Port ( I : in STD_LOGIC_VECTOR (12 downto 0); Reg_Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
               Load_Select, Add_Sub, Jump_Flag : out STD_LOGIC;
               Operation_En, Imm_Value : out STD_LOGIC_VECTOR (3 downto 0);
               Reg_Enable, Reg_Select_1, Reg_Select_2, Address : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    signal I : std_logic_vector(12 downto 0);
    signal RCJ, Imm, OpEn : std_logic_vector(3 downto 0);
begin
    UUT: Instruction_Decoder port map (I => I, Reg_Check_Jump => RCJ, Imm_Value => Imm, Operation_En => OpEn, others => open);
    process
    begin
        -- MOVI: OpCode 010, Reg 001, Imm 1100 (540U)
        I <= "010" & "001" & "000" & "1100"; RCJ <= "0000"; wait for 100 ns;
        -- ADD: OpCode 000, RegA 101, RegB 110 (558G bits)
        I <= "000" & "101" & "110" & "0000"; wait for 100 ns;
        wait;
    end process;
end Behavioral;
