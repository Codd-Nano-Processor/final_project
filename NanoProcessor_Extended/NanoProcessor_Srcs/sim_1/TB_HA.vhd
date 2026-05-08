library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_HA is
end TB_HA;

architecture Behavioral of TB_HA is
    component HA
        Port ( A, B : in STD_LOGIC; S, C : out STD_LOGIC);
    end component;
    signal A, B, S, C : std_logic;
begin
    UUT: HA port map (A => A, B => B, S => S, C => C);
    process
    begin
        -- Testing with bits from index 240540U (last 2 bits: 00)
        A <= '0'; B <= '0'; wait for 100 ns;
        -- Testing with bits from index 240589C (last 2 bits: 01)
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;
        wait;
    end process;
end Behavioral;
