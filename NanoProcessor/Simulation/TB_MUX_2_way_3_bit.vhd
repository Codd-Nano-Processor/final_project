library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_way_3_bit is
end TB_MUX_2_way_3_bit;

architecture Behavioral of TB_MUX_2_way_3_bit is

component MUX_2_way_3_bit
    Port (
        Selector : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal Selector : STD_LOGIC;
signal A, B, Y : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : MUX_2_way_3_bit
    port map(
        Selector => Selector,
        A => A,
        B => B,
        Y => Y
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- Selector = 0 ? Y = A
    Selector <= '0';

    A <= "101"; B <= "011";
    wait for 100 ns;

    A <= "100"; B <= "010";
    wait for 100 ns;

    A <= "111"; B <= "110";
    wait for 100 ns;


    -- Selector = 1 ? Y = B
    Selector <= '1';

    A <= "101"; B <= "011";
    wait for 100 ns;

    A <= "100"; B <= "010";
    wait for 100 ns;

    A <= "111"; B <= "110";
    wait for 100 ns;

    wait;

end process;

end Behavioral;