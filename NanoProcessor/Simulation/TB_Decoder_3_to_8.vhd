library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is

component Decoder_3_to_8
    Port ( 
        I  : in  STD_LOGIC_VECTOR (2 downto 0);
        EN : in  STD_LOGIC;
        Y  : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;

signal I  : STD_LOGIC_VECTOR (2 downto 0);
signal EN : STD_LOGIC;
signal Y  : STD_LOGIC_VECTOR (7 downto 0);

begin

UUT : Decoder_3_to_8
    port map(
        I  => I,
        EN => EN,
        Y  => Y
    );

-- 240540U = 11 1010 1011 1001 1100
-- 240558G = 11 1010 1011 1010 1110
-- 240574C = 11 1010 1011 1011 1110
-- 240589C = 11 1010 1011 1100 1101

process
begin

    -- Enable OFF
    EN <= '0';
    I <= "101";
    wait for 100 ns;

    -- Enable ON
    EN <= '1';

    I <= "101";   -- from 240540U
    wait for 100 ns;

    I <= "011";   -- from 240540U
    wait for 100 ns;

    I <= "100";   -- from 240540U
    wait for 100 ns;

    I <= "010";   -- from 240558G
    wait for 100 ns;

    I <= "111";   -- from 240558G
    wait for 100 ns;

    I <= "110";   -- extra check
    wait for 100 ns;

    I <= "000";   -- extra check
    wait for 100 ns;

    wait;

end process;

end Behavioral;