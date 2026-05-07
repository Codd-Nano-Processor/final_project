library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_ROM is
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is

component Program_ROM
    Port (
        address          : in  STD_LOGIC_VECTOR (2 downto 0);
        instruction_code : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;

signal address          : STD_LOGIC_VECTOR (2 downto 0);
signal instruction_code : STD_LOGIC_VECTOR (11 downto 0);

begin

UUT : Program_ROM
    port map(
        address => address,
        instruction_code => instruction_code
    );

process
begin

    address <= "000";   -- ROM address 0
    wait for 100 ns;

    address <= "001";   -- ROM address 1
    wait for 100 ns;

    address <= "010";   -- ROM address 2
    wait for 100 ns;

    address <= "011";   -- ROM address 3
    wait for 100 ns;

    address <= "100";   -- ROM address 4
    wait for 100 ns;

    address <= "101";   -- ROM address 5
    wait for 100 ns;

    address <= "110";   -- ROM address 6
    wait for 100 ns;

    address <= "111";   -- ROM address 7
    wait for 100 ns;

    wait;

end process;

end Behavioral;