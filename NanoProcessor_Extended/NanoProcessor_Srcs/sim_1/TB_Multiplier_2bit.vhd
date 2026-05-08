library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Multiplier_2bit is
end TB_Multiplier_2bit;

architecture Behavioral of TB_Multiplier_2bit is
    component Multiplier_2bit
        Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
               B4 : in STD_LOGIC_VECTOR (3 downto 0);
               Enable : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal A4, B4, Y : std_logic_vector(3 downto 0);
    signal Enable : std_logic;

begin
    UUT: Multiplier_2bit port map (A4 => A4, B4 => B4, Enable => Enable, Y => Y);

    process
    begin
        Enable <= '1';
        -- 0 x 0
        A4 <= "0000"; B4 <= "0000"; wait for 100 ns;
        -- 1 x 1
        A4 <= "0001"; B4 <= "0001"; wait for 100 ns;
        -- 2 x 1
        A4 <= "0010"; B4 <= "0001"; wait for 100 ns;
        -- 3 x 2
        A4 <= "0011"; B4 <= "0010"; wait for 100 ns;
        -- 3 x 3
        A4 <= "0011"; B4 <= "0011"; wait for 100 ns;
        
        Enable <= '0'; -- Check enable functionality
        wait for 100 ns;
        wait;
    end process;
end Behavioral;
