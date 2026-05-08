library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA4_Sim is
end RCA4_Sim;

architecture Behavioral of RCA4_Sim is

component RCA_4
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        C_in  : in  STD_LOGIC;
        S     : out STD_LOGIC_VECTOR(3 downto 0);
        C_out : out STD_LOGIC
    );
end component;

signal A, B, S : STD_LOGIC_VECTOR(3 downto 0);
signal C_in, C_out : STD_LOGIC;

begin

UUT: RCA_4
    port map (
        A     => A,
        B     => B,
        C_in  => C_in,
        S     => S,
        C_out => C_out
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin
    C_in <= '0';

    A <= "1010"; B <= "1011"; wait for 100 ns;
    A <= "1001"; B <= "1100"; wait for 100 ns;

    A <= "1010"; B <= "1011"; wait for 100 ns;
    A <= "1010"; B <= "1110"; wait for 100 ns;

    A <= "1010"; B <= "1011"; wait for 100 ns;
    A <= "1011"; B <= "1110"; wait for 100 ns;

    A <= "1010"; B <= "1011"; wait for 100 ns;
    A <= "1100"; B <= "1101"; wait for 100 ns;

    C_in <= '1';

    A <= "1010"; B <= "1011"; wait for 100 ns;
    A <= "1001"; B <= "1100"; wait for 100 ns;

    wait;
end process;

end Behavioral;