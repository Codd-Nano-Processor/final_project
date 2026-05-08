library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_ADD_SUB_4bit is
end TB_ADD_SUB_4bit;

architecture Behavioral of TB_ADD_SUB_4bit is
    component ADD_SUB_4bit
        Port ( A, B : in STD_LOGIC_VECTOR (3 downto 0); Enable, Operation : in STD_LOGIC;
               C_out, Overflow, Zero : out STD_LOGIC; S : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    signal A, B, S : std_logic_vector(3 downto 0);
    signal En, Op, Cout, Ovf, Z : std_logic;
begin
    UUT: ADD_SUB_4bit port map (A, B, En, Op, Cout, S, Ovf, Z);
    process
    begin
        En <= '1';
        -- Add: 1001 (540U) + 1110 (558G)
        Op <= '0'; A <= "1001"; B <= "1110"; wait for 100 ns;
        -- Sub: 1101 (589C) - 1011 (574C)
        Op <= '1'; A <= "1101"; B <= "1011"; wait for 100 ns;
        wait;
    end process;
end Behavioral;
