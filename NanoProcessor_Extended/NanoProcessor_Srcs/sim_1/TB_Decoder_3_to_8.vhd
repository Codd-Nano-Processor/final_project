library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
    component Decoder_3_to_8
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0); EN : in STD_LOGIC; Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    signal I : std_logic_vector(2 downto 0);
    signal EN : std_logic;
    signal Y : std_logic_vector(7 downto 0);
begin
    UUT: Decoder_3_to_8 port map (I, EN, Y);
    process
    begin
        EN <= '1';
        I <= "001"; wait for 100 ns; -- Select Reg 1
        I <= "101"; wait for 100 ns; -- Select Reg 5 (from 540U/558G bits)
        I <= "111"; wait for 100 ns; -- Select Reg 7
        wait;
    end process;
end Behavioral;
