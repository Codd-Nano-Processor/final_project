library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC_3_bit is
end TB_PC_3_bit;

architecture Behavioral of TB_PC_3_bit is

component PC_3_bit
    Port (
        D   : in  STD_LOGIC_VECTOR (2 downto 0);
        Res : in  STD_LOGIC;
        Clk : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal D, Q : STD_LOGIC_VECTOR (2 downto 0);
signal Res, Clk : STD_LOGIC;

begin

UUT : PC_3_bit
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
    D <= "000";
    wait for 100 ns;

    -- Reset OFF
    Res <= '0';

    -- Index number based values
    D <= "101";
    wait for 100 ns;

    D <= "011";
    wait for 100 ns;

    D <= "100";
    wait for 100 ns;

    D <= "010";
    wait for 100 ns;

    D <= "111";
    wait for 100 ns;

    D <= "110";
    wait for 100 ns;

    D <= "101";
    wait for 100 ns;

    -- Reset again
    Res <= '1';
    wait for 100 ns;

    Res <= '0';
    D <= "001";
    wait for 100 ns;

    wait;

end process;

end Behavioral;