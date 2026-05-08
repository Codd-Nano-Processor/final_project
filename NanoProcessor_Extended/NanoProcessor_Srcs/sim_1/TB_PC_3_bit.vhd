library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC_3_bit is
end TB_PC_3_bit;

architecture Behavioral of TB_PC_3_bit is
    component PC_3_bit
        Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal D, Q : std_logic_vector(2 downto 0);
    signal Res, Clk : std_logic := '0';

begin
    UUT: PC_3_bit port map (D => D, Res => Res, Clk => Clk, Q => Q);

    Clk <= not Clk after 50 ns; -- 100ns period clock

    process
    begin
        Res <= '1'; D <= "000"; wait for 100 ns;
        Res <= '0'; D <= "001"; wait for 100 ns;
        D <= "010"; wait for 100 ns;
        D <= "011"; wait for 100 ns;
        wait;
    end process;
end Behavioral;
