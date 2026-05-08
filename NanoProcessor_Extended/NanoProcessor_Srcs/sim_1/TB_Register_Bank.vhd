library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is

component Register_Bank
    Port (
        Clk   : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR (3 downto 0);
        R0    : out STD_LOGIC_VECTOR (3 downto 0);
        R1    : out STD_LOGIC_VECTOR (3 downto 0);
        R2    : out STD_LOGIC_VECTOR (3 downto 0);
        R3    : out STD_LOGIC_VECTOR (3 downto 0);
        R4    : out STD_LOGIC_VECTOR (3 downto 0);
        R5    : out STD_LOGIC_VECTOR (3 downto 0);
        R6    : out STD_LOGIC_VECTOR (3 downto 0);
        R7    : out STD_LOGIC_VECTOR (3 downto 0);
        I     : in  STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal Clk, Reset : STD_LOGIC;
signal D : STD_LOGIC_VECTOR (3 downto 0);
signal I : STD_LOGIC_VECTOR (2 downto 0);
signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Register_Bank
    port map(
        Clk   => Clk,
        Reset => Reset,
        D     => D,
        R0    => R0,
        R1    => R1,
        R2    => R2,
        R3    => R3,
        R4    => R4,
        R5    => R5,
        R6    => R6,
        R7    => R7,
        I     => I
    );

-- Clock generation
process
begin
    while true loop
        Clk <= '0';
        wait for 50 ns;
        Clk <= '1';
        wait for 50 ns;
    end loop;
end process;

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- Reset all registers
    Reset <= '1';
    D <= "0000";
    I <= "000";
    wait for 100 ns;

    Reset <= '0';

    -- Store 1010 into R5
    I <= "101";
    D <= "1010";
    wait for 100 ns;

    -- Store 1011 into R3
    I <= "011";
    D <= "1011";
    wait for 100 ns;

    -- Store 1001 into R4
    I <= "100";
    D <= "1001";
    wait for 100 ns;

    -- Store 1100 into R2
    I <= "010";
    D <= "1100";
    wait for 100 ns;

    -- Store 1110 into R7
    I <= "111";
    D <= "1110";
    wait for 100 ns;

    -- Store 1101 into R6
    I <= "110";
    D <= "1101";
    wait for 100 ns;

    -- Try R0: R0 always gets 0000 in your design
    I <= "000";
    D <= "1111";
    wait for 100 ns;

    -- Reset again
    Reset <= '1';
    wait for 100 ns;

    wait;

end process;

end Behavioral;