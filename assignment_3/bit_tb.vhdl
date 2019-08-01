library ieee;
use ieee.std_logic_1164.all;

entity bit_tb is
end entity;


architecture behav of bit_tb is

  component bit is
    port(
      i0  : in std_logic;
      load: in std_logic;
      clk : in std_logic;
      q   : out std_logic;
      qbar: out std_logic
      );
  end component bit;

  
  signal clk0, in0, load0, Q, Qbar : std_logic;

begin

  bit0 : bit port map(i0 => in0, load => load0, clk => clk0,
                      q => Q, qbar => Qbar);

  clk0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns,
          '0' after 20 ns, '1' after 25 ns;
  
  in0 <= '1', '0' after 10 ns, '1' after 16 ns;
  load0 <= '1', '0' after 16 ns;

  process

  begin
    
    wait for 10 ns;

    assert Q='1' and Qbar='0'
      report "incorrect output" severity error;

    wait for 10 ns;

    assert Q='0' and Qbar='1'
      report "incorrect output" severity error;

    wait for 10 ns;

    assert Q='0' and Qbar='1'
      report "incorrect output" severity error;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
