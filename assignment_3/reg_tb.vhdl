library ieee;
use ieee.std_logic_1164.all;

entity reg_tb is
end entity;


architecture behav of reg_tb is

  component reg is
    port(
      i0  : in std_logic_vector(15 downto 0);
      clk : in std_logic;
      load: in std_logic;
      out16: out std_logic_vector(15 downto 0)
      );
  end component reg;

  signal in0, out0 : std_logic_vector(15 downto 0);
  signal clk0, load0 : std_logic;


begin

  reg0 : reg port map(i0 => in0, clk => clk0, load => load0, out16 => out0);

  in0 <= "0000000000000000", "1111111111111111" after 10 ns,
         "0000000000000000" after 20 ns, "1111111111111111" after 30 ns;

  clk0 <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns,
          '0' after 20 ns, '1' after 25 ns, '0' after 30 ns,
          '1' after 35 ns;
  load0 <= '1', '0' after 30 ns;

  process
  begin

    wait for 6 ns;

    assert out0 = "0000000000000000"
      report "incorrect output" severity error;

    wait for 10 ns;

    assert out0 = "1111111111111111"
      report "incorrect output" severity error;

    wait for 10 ns;

    assert out0 = "0000000000000000"
      report "incorrect output" severity error;

    wait for 10 ns;

    assert out0 = "0000000000000000"
      report "incorrect output" severity error;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;

