library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_MUX_2_way_4_bit is
end TB_MUX_2_way_4_bit;

architecture Behavioral of TB_MUX_2_way_4_bit is
    component MUX_2_way_4_bit
        Port ( Selector : in STD_LOGIC;
               A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal Selector : std_logic;
    signal A, B, Y : std_logic_vector(3 downto 0);

begin
    UUT: MUX_2_way_4_bit port map (Selector => Selector, A => A, B => B, Y => Y);

    process
    begin
        A <= "1010"; B <= "1100";
        Selector <= '0'; wait for 100 ns; -- Y should be A
        Selector <= '1'; wait for 100 ns; -- Y should be B
        wait;
    end process;
end Behavioral;
