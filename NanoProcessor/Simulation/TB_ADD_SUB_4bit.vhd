library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ADD_SUB_4bit is
end TB_ADD_SUB_4bit;

architecture Behavioral of TB_ADD_SUB_4bit is

component ADD_SUB_4bit
    Port (
        A         : in  STD_LOGIC_VECTOR (3 downto 0);
        B         : in  STD_LOGIC_VECTOR (3 downto 0);
        Operation : in  STD_LOGIC;
        C_out     : out STD_LOGIC;
        S         : out STD_LOGIC_VECTOR (3 downto 0);
        Overflow  : out STD_LOGIC;
        Zero      : out STD_LOGIC
    );
end component;

signal A, B, S : STD_LOGIC_VECTOR (3 downto 0);
signal Operation, C_out, Overflow, Zero : STD_LOGIC;

begin

UUT : ADD_SUB_4bit
    port map (
        A         => A,
        B         => B,
        Operation => Operation,
        C_out     => C_out,
        S         => S,
        Overflow  => Overflow,
        Zero      => Zero
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- ADD operation
    Operation <= '0';

    A <= "1010"; B <= "1011";
    wait for 100 ns;

    A <= "1001"; B <= "1100";
    wait for 100 ns;

    A <= "1010"; B <= "1110";
    wait for 100 ns;

    A <= "1011"; B <= "1110";
    wait for 100 ns;

    A <= "1100"; B <= "1101";
    wait for 100 ns;


    -- SUB operation
    Operation <= '1';

    A <= "1010"; B <= "1011";
    wait for 100 ns;

    A <= "1001"; B <= "1100";
    wait for 100 ns;

    A <= "1010"; B <= "1110";
    wait for 100 ns;

    A <= "1011"; B <= "1110";
    wait for 100 ns;

    A <= "1100"; B <= "1101";
    wait for 100 ns;

    -- Zero checking example
    A <= "1010"; B <= "1010";
    Operation <= '1';
    wait for 100 ns;

    wait;

end process;

end Behavioral;