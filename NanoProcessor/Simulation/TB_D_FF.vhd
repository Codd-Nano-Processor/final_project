library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_D_FF is
end TB_D_FF;

architecture Behavioral of TB_D_FF is

component D_FF
    Port (
        D   : in STD_LOGIC;
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q   : out STD_LOGIC
    );
end component;

signal D, Res, Clk, Q : STD_LOGIC;

begin

UUT : D_FF
    port map(
        D   => D,
        Res => Res,
        Clk => Clk,
        Q   => Q
    );

-- Clock generation
process
begin
    while true loop
        Clk <= '0';
        wait for 50 ns;

        Clk <= '1';
        wait for 50 ns;
    end loop;
end process;

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- Reset ON
    Res <= '1';
    D <= '0';
    wait for 100 ns;

    -- Reset OFF
    Res <= '0';

    D <= '1';
    wait for 100 ns;

    D <= '0';
    wait for 100 ns;

    D <= '1';
    wait for 100 ns;

    D <= '1';
    wait for 100 ns;

    D <= '0';
    wait for 100 ns;

    wait;

end process;

end Behavioral;