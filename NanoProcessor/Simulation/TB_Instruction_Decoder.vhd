library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Instruction_Decoder is
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is

component Instruction_Decoder
    Port (
        I              : in  STD_LOGIC_VECTOR (11 downto 0);
        Reg_Check_Jump : in  STD_LOGIC_VECTOR (3 downto 0);
        Load_Select    : out STD_LOGIC;
        Imm_Value      : out STD_LOGIC_VECTOR (3 downto 0);
        Reg_Enable     : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_Select_1   : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_Select_2   : out STD_LOGIC_VECTOR (2 downto 0);
        Add_Sub        : out STD_LOGIC;
        Jump_Flag      : out STD_LOGIC;
        Address        : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal I              : STD_LOGIC_VECTOR (11 downto 0);
signal Reg_Check_Jump : STD_LOGIC_VECTOR (3 downto 0);
signal Load_Select    : STD_LOGIC;
signal Imm_Value      : STD_LOGIC_VECTOR (3 downto 0);
signal Reg_Enable     : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Select_1   : STD_LOGIC_VECTOR (2 downto 0);
signal Reg_Select_2   : STD_LOGIC_VECTOR (2 downto 0);
signal Add_Sub        : STD_LOGIC;
signal Jump_Flag      : STD_LOGIC;
signal Address        : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : Instruction_Decoder
    port map (
        I              => I,
        Reg_Check_Jump => Reg_Check_Jump,
        Load_Select    => Load_Select,
        Imm_Value      => Imm_Value,
        Reg_Enable     => Reg_Enable,
        Reg_Select_1   => Reg_Select_1,
        Reg_Select_2   => Reg_Select_2,
        Add_Sub        => Add_Sub,
        Jump_Flag      => Jump_Flag,
        Address        => Address
    );

-- Instruction format:
-- I(11 downto 10) = OpCode
-- I(9 downto 7)   = RegA
-- I(6 downto 4)   = RegB
-- I(3 downto 0)   = Imm / Address bits

process
begin

    -- MOV / normal instruction, OpCode = 00
    I <= "001010111001";     -- Op=00, RegA=101, RegB=011, Imm=1001
    Reg_Check_Jump <= "0101";
    wait for 100 ns;

    -- SUB instruction, OpCode = 01
    I <= "011010111100";     -- Op=01, RegA=101, RegB=011, Imm=1100
    Reg_Check_Jump <= "0010";
    wait for 100 ns;

    -- LOAD immediate, OpCode = 10
    I <= "101010101110";     -- Op=10, RegA=101, RegB=010, Imm=1110
    Reg_Check_Jump <= "1001";
    wait for 100 ns;

    -- JUMP instruction, OpCode = 11, but Reg_Check_Jump not zero
    I <= "111011011110";     -- Op=11, Address=110
    Reg_Check_Jump <= "0011";
    wait for 100 ns;

    -- JUMP instruction, OpCode = 11, Reg_Check_Jump zero
    I <= "111011011110";
    Reg_Check_Jump <= "0000";
    wait for 100 ns;

    -- Extra index-number based pattern
    I <= "101011001101";     -- from 240589C chunks
    Reg_Check_Jump <= "0000";
    wait for 100 ns;

    wait;

end process;

end Behavioral;