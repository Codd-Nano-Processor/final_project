library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8_way_4_bit is
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is

component MUX_8_way_4_bit
    Port (
        Selector : in  STD_LOGIC_VECTOR (2 downto 0);
        A0 : in  STD_LOGIC_VECTOR (3 downto 0);
        A1 : in  STD_LOGIC_VECTOR (3 downto 0);
        A2 : in  STD_LOGIC_VECTOR (3 downto 0);
        A3 : in  STD_LOGIC_VECTOR (3 downto 0);
        A4 : in  STD_LOGIC_VECTOR (3 downto 0);
        A5 : in  STD_LOGIC_VECTOR (3 downto 0);
        A6 : in  STD_LOGIC_VECTOR (3 downto 0);
        A7 : in  STD_LOGIC_VECTOR (3 downto 0);
        Y  : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal Selector : STD_LOGIC_VECTOR (2 downto 0);
signal A0, A1, A2, A3, A4, A5, A6, A7, Y : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : MUX_8_way_4_bit
    port map (
        Selector => Selector,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        A4 => A4,
        A5 => A5,
        A6 => A6,
        A7 => A7,
        Y  => Y
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    A0 <= "1010";
    A1 <= "1011";
    A2 <= "1001";
    A3 <= "1100";
    A4 <= "1110";
    A5 <= "1011";
    A6 <= "1100";
    A7 <= "1101";

    Selector <= "000"; wait for 100 ns;
    Selector <= "001"; wait for 100 ns;
    Selector <= "010"; wait for 100 ns;
    Selector <= "011"; wait for 100 ns;
    Selector <= "100"; wait for 100 ns;
    Selector <= "101"; wait for 100 ns;
    Selector <= "110"; wait for 100 ns;
    Selector <= "111"; wait for 100 ns;

    wait;

end process;

end Behavioral;