library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_D_FF is
end TB_D_FF;

architecture Behavioral of TB_D_FF is
    component D_FF
        Port ( D, Res, Clk : in STD_LOGIC; Q : out STD_LOGIC);
    end component;
    signal D, Res, Clk, Q : std_logic := '0';
begin
    UUT: D_FF port map (D, Res, Clk, Q);
    Clk <= not Clk after 50 ns;
    process
    begin
        Res <= '1'; wait for 100 ns;
        Res <= '0'; D <= '1'; wait for 100 ns;
        D <= '0'; wait for 100 ns;
        wait;
    end process;
end Behavioral;
