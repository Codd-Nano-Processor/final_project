library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_NanoProcessor is
end TB_NanoProcessor;

architecture Behavioral of TB_NanoProcessor is
    component NanoProcessor
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               reg : out STD_LOGIC_VECTOR (3 downto 0);
               zero : out STD_LOGIC;
               overflow : out STD_LOGIC;
               display : out STD_LOGIC_VECTOR (6 downto 0);
               anode : out STD_LOGIC_VECTOR (3 downto 0);
               carry : out STD_LOGIC;
               var0, var1 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal clk, reset, zero, overflow, carry : std_logic := '0';
    signal reg, anode, var0, var1 : std_logic_vector(3 downto 0);
    signal display : std_logic_vector(6 downto 0);

begin
    UUT: NanoProcessor port map (clk, reset, reg, zero, overflow, display, anode, carry, var0, var1);

    clk <= not clk after 50 ns;

    process
    begin
        reset <= '1'; wait for 100 ns;
        reset <= '0';
        -- Let the processor run for several clock cycles to execute ROM instructions
        wait for 2000 ns;
        wait;
    end process;
end Behavioral;
