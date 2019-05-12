library ieee;
use ieee.std_logic_1164.all;

entity adder16_tb is
end entity;

architecture behav of adder16_tb is

  component adder16 is
    port(
      i0      : in std_logic_vector(15 downto 0);
      i1      : in std_logic_vector(15 downto 0);
      sum_out : out std_logic_vector(15 downto 0)
      );
  end component adder16;

  signal in0, in1, out16 : std_logic_vector(15 downto 0);

  for add1 : adder16 use entity work.adder16;

begin

  add1 : adder16 port map(i0 => in0, i1 => in1, sum_out => out16);

  process

    type in_pattern0 is array(natural range <>) of std_logic_vector(15 downto 0);
    constant in_patterns0 : in_pattern0 :=
      ("0000000000000000",
       "1000000000000000",
       "0000000000000001",
       "0000111100000000");

    type in_pattern1 is array(natural range <>) of std_logic_vector(15 downto 0);
    constant in_patterns1 : in_pattern1 :=
      ("1111111111111111",
       "0000000011110000",
       "0000000000001111");

    type out_pattern is array(natural range <>) of std_logic_vector(15 downto 0);
    constant out_patterns : out_pattern :=
      ("1111111111111111",
       "0000000011110000",
       "0000000000001111",
       "0111111111111111",
       "1000000011110000",
       "1000000000001111",
       "0000000000000000",
       "0000000011110001",
       "0000000000010000",
       "0000111011111111",
       "0000111111110000",
       "0000111100001111");

  begin

    for i in in_patterns0'range loop

      for j in in_patterns1'range loop

        in0 <= in_patterns0(i);
        in1 <= in_patterns1(j);

        wait for 1 ns;
          
        assert out16 = out_patterns(i*3+j)
          report "Incorrect output" severity error;

      end loop;
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;

        
