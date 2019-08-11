library ieee;
use ieee.std_logic_1164.all;


entity PC_tb is
end entity;


architecture behav of PC_tb is

  component  PC is
    port(
      PCin : in std_logic_vector(15 downto 0);
      inc  : in std_logic;
      load : in std_logic;
      rst  : in std_logic;
      clk  : in std_logic;
      PCout: out std_logic_vector(15 downto 0)
    );
  end component PC;


  signal input, output : std_logic_vector(15 downto 0) := "1111111111111111";
  signal increment, load, reset : std_logic;

  signal clock : std_logic := '0';

begin

  input <= "0000000010000000";

  reset <= '0', '1' after 10 ns, '0' after 40 ns;
  increment <= '0', '1' after 15 ns, '0' after 100 ns, '1' after 155 ns;
  load <= '0', '1' after 75 ns, '0' after 120 ns, '1' after 175 ns;

  testPC : PC port map(PCin => input, inc => increment, load => load,
                       rst => reset, clk => clock, PCout => output);
  
  clk_process: process
  begin
    wait for 5 ns;
    clock <= not clock;
    if now > 200 ns then
      assert false report "stopping clock" severity note;
      wait;
    end if;
  end process clk_process;

  process
  begin
    wait for 200 ns;
    assert false report "end of test" severity note;
    wait;
  end process;


end behav;



  

  
  
