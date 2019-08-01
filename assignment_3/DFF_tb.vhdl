library ieee;
use ieee.std_logic_1164.all;

entity DFF_tb is
end entity;

architecture behav of DFF_tb is

  component DFF is
    port(
      i0  : in std_logic;
      clk : in std_logic;
      q   : out std_logic;
      qbar: out std_logic
      );
  end component DFF;

  signal in0, clk0, Q, Qbar : std_logic;

  for DFF0 : DFF use entity work.DFF;

begin

  DFF0 : DFF port map(i0 => in0, clk => clk0, q => Q, qbar => Qbar);

  clk0 <= '0', '1' after 3 ns, '0' after 6 ns, '1' after 9 ns, '0' after 12 ns, '1' after 15 ns;
  in0 <= '0', '1' after 8 ns, '0' after 12 ns;
  
  process  
  begin

    wait for 5 ns;
    
    assert Q = '0' and Qbar = '1'
      report "incorrect output" severity error;

    wait for 5 ns;
    
    assert Q = '1' and Qbar = '0'
      report "incorrect output" severity error;

    wait for 6 ns;

    assert Q = '0' and Qbar = '1'
      report "incorrect output" severity error;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;

   
