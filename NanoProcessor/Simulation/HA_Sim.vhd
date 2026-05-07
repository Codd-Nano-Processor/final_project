library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA_Sim is
--  Port ( );
end HA_Sim;

architecture Behavioral of HA_Sim is
COMPONENT HA
    port(A,B:in std_logic;
        S,C:out std_logic);
END COMPONENT;
signal a,b,c,s :std_logic;
begin
UUT: HA PORT MAP(
    A=>a,
    B=>b,
    C=>c,
    S=>s);
 process
 begin
    a<='0';
    b<='0';
    wait for 100ns;
    b<='1';
    wait for 100ns;
    a<='1';
    b<='0';
    wait for 100ns;
    b<='1';
    wait;
 end process;

end Behavioral;