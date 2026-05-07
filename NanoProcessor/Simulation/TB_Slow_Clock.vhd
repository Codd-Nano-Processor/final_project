library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Slow_Clock is
end TB_Slow_Clock;

architecture Behavioral of TB_Slow_Clock is

component Slow_Clock
    Port (
        Clk_in  : in  STD_LOGIC;
        Clk_out : out STD_LOGIC
    );
end component;

signal Clk_in  : STD_LOGIC := '0';
signal Clk_out : STD_LOGIC;

begin

UUT : Slow_Clock
    port map(
        Clk_in  => Clk_in,
        Clk_out => Clk_out
    );

-- Fast clock generation
process
begin
    while true loop
        Clk_in <= '0';
        wait for 5 ns;

        Clk_in <= '1';
        wait for 5 ns;
    end loop;
end process;

end Behavioral;