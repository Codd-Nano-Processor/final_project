library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Program_ROM is
end TB_Program_ROM;

architecture Behavioral of TB_Program_ROM is
    component Program_ROM
        Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
               instruction_code : out STD_LOGIC_VECTOR (12 downto 0));
    end component;

    signal address : std_logic_vector(2 downto 0);
    signal instruction_code : std_logic_vector(12 downto 0);

begin
    UUT: Program_ROM port map (address => address, instruction_code => instruction_code);

    process
    begin
        address <= "000"; wait for 100 ns;
        address <= "001"; wait for 100 ns;
        address <= "010"; wait for 100 ns;
        address <= "111"; wait for 100 ns;
        wait;
    end process;
end Behavioral;
