library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA_sim is
--  Port ( );
end FA_sim;

architecture Behavioral of FA_sim is
    COMPONENT FA
        port(A,B,C_in:in std_logic;
            S,C_out:out std_logic);
    END COMPONENT;
    SIGNAL a,b,cin,s,cout:std_logic;

begin
UUT:FA PORT MAP(
    A=>a,
    B=>b,
    C_in=>cin,
    S=>s,
    C_out=>cout);
 process
 begin
    a<='0';
    b<='0';
    cin<='0';
    wait for 100ns;
    cin<='1';
    wait for 100ns;
    b<='1';
    cin<='0';
    wait for 100ns;
    cin<='1';
    wait for 100ns;
    a<='1';
    b<='0';
    cin<='0';
    wait for 100ns;
    cin<='1';
    wait for 100ns;
    b<='1';
    cin<='0';
    wait for 100ns;
    cin<='1';
    wait for 100ns;
 end process;

end Behavioral;