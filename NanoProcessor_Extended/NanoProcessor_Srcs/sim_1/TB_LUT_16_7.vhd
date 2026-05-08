library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_LUT_16_7 is
end TB_LUT_16_7;

architecture Behavioral of TB_LUT_16_7 is
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR (3 downto 0); data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    signal addr : std_logic_vector(3 downto 0);
    signal data : std_logic_vector(6 downto 0);
begin
    UUT: LUT_16_7 port map (addr, data);
    process
    begin
        addr <= "1001"; wait for 100 ns; -- Display '9' (from 540U)
        addr <= "1110"; wait for 100 ns; -- Display 'E' (from 558G)
        addr <= "1101"; wait for 100 ns; -- Display 'd' (from 589C)
        wait;
    end process;
end Behavioral;
