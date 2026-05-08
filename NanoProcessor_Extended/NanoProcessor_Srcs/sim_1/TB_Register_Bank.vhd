library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Register_Bank is
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
    component Register_Bank
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (3 downto 0);
               R0, R1, R2, R3, R4, R5, R6, R7 : out STD_LOGIC_VECTOR (3 downto 0);
               I : in STD_LOGIC_VECTOR (2 downto 0));
    end component;

    signal Clk, Reset : std_logic := '0';
    signal D : std_logic_vector(3 downto 0);
    signal R0, R1, R2, R3, R4, R5, R6, R7 : std_logic_vector(3 downto 0);
    signal I : std_logic_vector(2 downto 0);

begin
    UUT: Register_Bank port map (Clk, Reset, D, R0, R1, R2, R3, R4, R5, R6, R7, I);

    Clk <= not Clk after 50 ns;

    process
    begin
        Reset <= '1'; wait for 100 ns;
        Reset <= '0';
        -- Store 5 in R1
        I <= "001"; D <= "0101"; wait for 100 ns;
        -- Store 7 in R2
        I <= "010"; D <= "0111"; wait for 100 ns;
        wait;
    end process;
end Behavioral;
