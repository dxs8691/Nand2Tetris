library ieee;
use ieee.std_logic_1164.all;

entity ram8_tb is
end entity;


architecture behav of ram8_tb is

  component ram8 is
    port(
      i0  : in std_logic_vector(15 downto 0);
      addr: in std_logic_vector(2 downto 0);
      load: in std_logic;
      clk : in std_logic;
      out16: out std_logic_vector(15 downto 0)
      );
  end component ram8;



  signal in0, out0 : std_logic_vector(15 downto 0);
  signal addr0 : std_logic_vector(2 downto 0);
  signal load0, clk0 : std_logic;

begin

  ram0 : ram8 port map(i0 => in0, addr => addr0, load => load0, clk => clk0,
                       out16 => out0);
  
  in0 <= "0000000000000000", "1111111111111111" after 50 ns;
  addr0 <= "000", "001" after 2 ns, "010" after 4 ns, "011" after 6 ns,
           "100" after 8 ns, "101" after 10 ns, "110" after 12 ns,
           "111" after 14 ns, "000" after 16 ns, "001" after 18 ns,
           "010" after 20 ns, "011" after 22 ns, "100" after 24 ns,
           "101" after 26 ns, "110" after 28 ns, "111" after 30 ns,
           "100" after 52 ns, "001" after 55 ns, "100" after 60 ns;
  load0 <= '1', '0' after 54 ns;
  clk0 <= '1', '0' after 2 ns, '1' after 3 ns, '0' after 4 ns, '1' after 5 ns,
          '0' after 6 ns, '1' after 7 ns, '0' after 8 ns, '1' after 9 ns,
          '0' after 10 ns, '1' after 11 ns, '0' after 12 ns, '1' after 13 ns,
          '0' after 14 ns, '1' after 15 ns, '0' after 16 ns, '1' after 17 ns,
          '0' after 18 ns, '1' after 19 ns, '0' after 20 ns, '1' after 21 ns,
          '0' after 22 ns, '1' after 23 ns, '0' after 24 ns, '1' after 25 ns,
          '0' after 26 ns, '1' after 27 ns, '0' after 28 ns, '1' after 29 ns,
          '0' after 30 ns, '1' after 31 ns, '0' after 40 ns, '1' after 53 ns;

  process
  begin

    wait for 17 ns;

    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;

    wait for 2 ns;
    assert out0="0000000000000000"
      report "incorrect output" severity error;


    wait for 25 ns;
    assert out0="1111111111111111"
      report "incorrect output" severity error;
    
    assert false report "end of test" severity note;
    
    wait;

  end process;
end behav;



