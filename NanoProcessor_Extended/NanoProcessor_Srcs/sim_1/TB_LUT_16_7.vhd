library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_LUT_16_7 is
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is

component LUT_16_7
    Port (
        address : in  STD_LOGIC_VECTOR (3 downto 0);
        data    : out STD_LOGIC_VECTOR (6 downto 0)
    );
end component;

signal address : STD_LOGIC_VECTOR (3 downto 0);
signal data    : STD_LOGIC_VECTOR (6 downto 0);

begin

UUT : LUT_16_7
    port map(
        address => address,
        data => data
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- Index number based values
    address <= "1010";  -- A
    wait for 100 ns;

    address <= "1011";  -- B
    wait for 100 ns;

    address <= "1001";  -- 9
    wait for 100 ns;

    address <= "1100";  -- C
    wait for 100 ns;

    address <= "1110";  -- E
    wait for 100 ns;

    address <= "1101";  -- D
    wait for 100 ns;

    -- Extra checking
    address <= "0000";  -- 0
    wait for 100 ns;

    address <= "1111";  -- F
    wait for 100 ns;

    wait;

end process;

end Behavioral;