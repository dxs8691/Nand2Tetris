library ieee;
use ieee.std_logic_1164.all;

entity incrementer_tb is
end entity;


architecture behav of incrementer_tb is

  component incrementer16 is
    port(
      i0      : in std_logic_vector(15 downto 0);
      sum_out : out std_logic_vector(15 downto 0)
      );
  end component incrementer16;

  signal in0, outSum : std_logic_vector(15 downto 0);

begin

  inc0 : incrementer16 port map(i0 => in0, sum_out => outSum);

  process

    type in_pattern is array(natural range <>)
      of std_logic_vector(15 downto 0);

    constant in_patterns : in_pattern :=
      ("1111111111111111",
       "0000000000000001",
       "1000000000000000",
       "0000000000000000",
       "0000000000001111");

    type out_pattern is array(natural range <>)
      of std_logic_vector(15 downto 0);

    constant out_patterns : out_pattern :=
      ("0000000000000000",
       "0000000000000010",
       "1000000000000001",
       "0000000000000001",
       "0000000000010000");

  begin

    for i in in_patterns'range loop


      in0 <= in_patterns(i);

      wait for 1 ns;

      assert outSum = out_patterns(i) report
        "Incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;

