library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_8_way_4_bit is
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is
    component MUX_8_way_4_bit
        Port ( Selector : in STD_LOGIC_VECTOR (2 downto 0);
               A0, A1, A2, A3, A4, A5, A6, A7 : in STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal Selector : std_logic_vector(2 downto 0);
    signal Y : std_logic_vector(3 downto 0);

begin
    UUT: MUX_8_way_4_bit port map (
        Selector => Selector, 
        A0 => "0000", A1 => "0001", A2 => "0010", A3 => "0011",
        A4 => "0100", A5 => "0101", A6 => "0110", A7 => "0111",
        Y => Y
    );

    process
    begin
        Selector <= "000"; wait for 50 ns;
        Selector <= "001"; wait for 50 ns;
        Selector <= "010"; wait for 50 ns;
        Selector <= "111"; wait for 50 ns;
        wait;
    end process;
end Behavioral;
