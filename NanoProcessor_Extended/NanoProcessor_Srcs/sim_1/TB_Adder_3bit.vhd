library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Adder_3bit is
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is

component Adder_3bit
    Port (
        A     : in  STD_LOGIC_VECTOR (2 downto 0);
        S     : out STD_LOGIC_VECTOR (2 downto 0);
        C_out : out STD_LOGIC
    );
end component;

signal A, S : STD_LOGIC_VECTOR (2 downto 0);
signal C_out : STD_LOGIC;

begin

UUT : Adder_3bit
    port map(
        A => A,
        S => S,
        C_out => C_out
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- 240540U
    A <= "101";  
    wait for 100 ns;

    A <= "011";  
    wait for 100 ns;

    A <= "100";  
    wait for 100 ns;

    -- 240558G
    A <= "101";  
    wait for 100 ns;

    A <= "010";  
    wait for 100 ns;

    A <= "111";  
    wait for 100 ns;

    -- 240574C
    A <= "101";  
    wait for 100 ns;

    A <= "011";  
    wait for 100 ns;

    A <= "111";  
    wait for 100 ns;

    -- 240589C
    A <= "101";  
    wait for 100 ns;

    A <= "100";  
    wait for 100 ns;

    A <= "101";  
    wait for 100 ns;

    wait;

end process;

end Behavioral;