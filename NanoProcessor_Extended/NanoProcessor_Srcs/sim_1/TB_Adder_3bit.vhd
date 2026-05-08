library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Adder_3bit is
end TB_Adder_3bit;

architecture Behavioral of TB_Adder_3bit is
    component Adder_3bit
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0); S : out STD_LOGIC_VECTOR (2 downto 0); C_out : out STD_LOGIC);
    end component;
    signal A, S : std_logic_vector(2 downto 0);
    signal Cout : std_logic;
begin
    UUT: Adder_3bit port map (A, S, Cout);
    process
    begin
        A <= "100"; wait for 100 ns; -- From 540U (1100)
        A <= "110"; wait for 100 ns; -- From 558G (1110)
        A <= "101"; wait for 100 ns; -- From 589C (1101)
        wait;
    end process;
end Behavioral;
