library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_FA is
end TB_FA;

architecture Behavioral of TB_FA is
    component FA
        Port ( A, B, C_in : in STD_LOGIC; S, C_out : out STD_LOGIC);
    end component;
    signal A, B, Cin, S, Cout : std_logic;
begin
    UUT: FA port map (A, B, Cin, S, Cout);
    process
    begin
        A <= '1'; B <= '0'; Cin <= '1'; wait for 100 ns; -- Pattern from 540U
        A <= '1'; B <= '1'; Cin <= '0'; wait for 100 ns; -- Pattern from 558G
        A <= '1'; B <= '1'; Cin <= '1'; wait for 100 ns; -- Pattern from 589C
        wait;
    end process;
end Behavioral;
