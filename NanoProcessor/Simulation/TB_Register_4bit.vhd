library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Register_4bit is
end TB_Register_4bit;

architecture Behavioral of TB_Register_4bit is

component Register_4bit
    Port (
        D     : in  STD_LOGIC_VECTOR (3 downto 0);
        En    : in  STD_LOGIC;
        Clk   : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal D, Q : STD_LOGIC_VECTOR (3 downto 0);
signal En, Clk, Reset : STD_LOGIC;

begin

UUT : Register_4bit
    port map(
        D     => D,
        En    => En,
        Clk   => Clk,
        Reset => Reset,
        Q     => Q
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
    Reset <= '1';
    En <= '0';
    D <= "0000";
    wait for 100 ns;

    -- Reset OFF
    Reset <= '0';
    En <= '1';

    -- Index number based values
    D <= "1010";
    wait for 100 ns;

    D <= "1011";
    wait for 100 ns;

    D <= "1001";
    wait for 100 ns;

    D <= "1100";
    wait for 100 ns;

    D <= "1110";
    wait for 100 ns;

    D <= "1101";
    wait for 100 ns;

    -- Enable OFF ? Q should hold value
    En <= '0';
    D <= "0001";
    wait for 100 ns;

    -- Enable ON again
    En <= '1';
    D <= "0010";
    wait for 100 ns;

    -- Reset again
    Reset <= '1';
    wait for 100 ns;

    wait;

end process;

end Behavioral;