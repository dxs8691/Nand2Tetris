library ieee;
use ieee.std_logic_1164.all;

entity or16_gate_tb is
end or16_gate_tb;

architecture behav of or16_gate_tb is

  component or16_gate is
    port(
      i0_16 : in std_logic_vector(15 downto 0);
      i1_16 : in std_logic_vector(15 downto 0);
      out0_16 : out std_logic_vector(15 downto 0)
      );
  end component or16_gate;

  signal in0,in1,out0 : std_logic_vector(15 downto 0);

  for or16_0 : or16_gate use entity work.or16_gate;

begin

  or16_0 : or16_gate
    port map(
      i0_16 => in0,
      i1_16 => in1,
      out0_16 => out0
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
      (('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('1','1','1','1','1','0','1','0','1','1','0','1','0','1','1','0'),
       ('0','0','0','0','1','1','1','1','0','0','0','0','1','1','1','1'),
       ('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'),
       ('1','1','1','1','1','0','1','0','1','1','1','1','1','1','1','0'),
       ('1','0','1','0','1','1','1','1','1','0','1','0','1','1','1','1'),
       ('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'));

  begin
    for i in input_patterns_0'range loop
      for j in input_patterns_1'range loop

        in0 <= input_patterns_0(i);
        in1 <= input_patterns_1(j);

        wait for 1 ns;

        assert out0 = output_patterns(i*(input_patterns_0'high+1)+j)
          report "incorrect output" severity error;

      end loop;
      
    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
  

