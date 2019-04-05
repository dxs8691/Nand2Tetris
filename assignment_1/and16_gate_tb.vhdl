library ieee;
use ieee.std_logic_1164.all;

entity and16_gate_tb is
end and16_gate_tb;

architecture behav of and16_gate_tb is

  component and16_gate is
    port(
      i0 : in std_logic_vector(15 downto 0);
      i1 : in std_logic_vector(15 downto 0);
      and16_out : out std_logic_vector(15 downto 0)
      );
  end component and16_gate;

  signal IN_0,IN_1,OUT_0 : std_logic_vector(15 downto 0);

  for and16_0 : and16_gate use entity work.and16_gate;

begin

  and16_0 : and16_gate
    port map(
      i0 => IN_0,
      i1 => IN_1,
      and16_out => OUT_0
      );

  process

    type pattern_arr is array (natural range <>) of std_logic_vector(15 downto 0);

    constant input_patterns_0 : pattern_arr :=
      (('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0'));

    constant input_patterns_1 : pattern_arr :=
      (('1','1','1','1','1','0','1','0','1','1','0','1','0','1','1','0'),
       ('0','0','0','0','1','1','1','1','0','0','0','0','1','1','1','1'),
       ('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'));

    constant output_patterns : pattern_arr :=
      (('1','1','1','1','1','0','1','0','1','1','0','1','0','1','1','0'),
       ('0','0','0','0','1','1','1','1','0','0','0','0','1','1','1','1'),
       ('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('1','0','1','0','1','0','1','0','1','0','0','0','0','0','1','0'),
       ('0','0','0','0','1','0','1','0','0','0','0','0','1','0','1','0'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'));

  begin
    for i in input_patterns_0'range loop
      for j in input_patterns_1'range loop

        IN_0 <= input_patterns_0(i);
        IN_1 <= input_patterns_1(j);

        wait for 1 ns;

        assert OUT_0 = output_patterns(i*(input_patterns_0'high+1)+j)
          report "incorrect output" severity error;

      end loop;
      
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
  

