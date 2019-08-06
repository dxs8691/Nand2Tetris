library ieee;
use ieee.std_logic_1164.all;

entity ram64_tb is
end entity;


architecture behav of ram64_tb is

  component ram64 is
    port(
      i0  : in std_logic_vector(15 downto 0);
      addr: in std_logic_vector(5 downto 0);
      load: in std_logic;
      clk : in std_logic;
      out16: out std_logic_vector(15 downto 0)
      );
  end component ram64;


  signal in0, out0 : std_logic_vector(15 downto 0);
  signal addr0 : std_logic_vector(5 downto 0);
  signal load0, clk0 : std_logic;

begin

  ram : ram64 port map(i0 => in0, addr => addr0, load => load0,
                       clk => clk0, out16 => out0);

  in0 <= "0000000000000000", "1111111111111111" after 44 ns;
  addr0 <= "010000", "010001" after 2 ns, "010010" after 4 ns, "010011" after 6 ns,
           "010100" after 8 ns, "010101" after 10 ns, "010110" after 12 ns,
           "010111" after 14 ns, "010000" after 20 ns, "010010" after 35 ns,
           "010100" after 41 ns, "100001" after 48 ns, "010100" after 55 ns,
           "100001" after 60 ns;
  load0 <= '1';
  clk0 <= '0','1' after 1 ns, '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5 ns,
          '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns,
          '0' after 10 ns, '1' after 11 ns, '0' after 12 ns, '1' after 13 ns,
          '0' after 14 ns, '1' after 15 ns, '0' after 16 ns, '1' after 45 ns,
          '0' after 47 ns, '1' after 49 ns, '0' after 51 ns;




  process
  begin

    wait for 30 ns;

    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 10 ns;
    
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 26 ns;

    assert out0="1111111111111111"
      report "incorrect output" severity error;

    wait for 10 ns;

    assert out0="1111111111111111"
      report "incorrect output" severity error;

    assert false report "end of test" severity note;

    wait;

  end process;
end behav;


