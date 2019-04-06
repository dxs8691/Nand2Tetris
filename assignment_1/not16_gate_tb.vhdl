library ieee;
use ieee.std_logic_1164.all;

entity not16_gate_tb is
end not16_gate_tb;

architecture behav of not16_gate_tb is

  component not16_gate is
    port(
      i0_16 : in std_logic_vector(15 downto 0);
      out0_16 : out std_logic_vector(15 downto 0)
      );
  end component not16_gate;

  signal in0, out0 : std_logic_vector(15 downto 0);

  for not16_0 : not16_gate use entity work.not16_gate;

begin

  not16_0 : not16_gate
    port map(
      i0_16 => in0,
      out0_16 => out0
      );

  process

    type pattern_arr is array (natural range <>) of std_logic_vector(15 downto 0);

    constant input_patterns_0 : pattern_arr :=
      (('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('1','0','1','0','1','0','1','0','1','0','1','0','1','0','1','0'));

    constant output_patterns : pattern_arr :=
      (('0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'),
       ('1','1','1','1','1','1','1','1','1','1','1','1','1','1','1','1'),
       ('0','1','0','1','0','1','0','1','0','1','0','1','0','1','0','1'));

  begin
    for i in input_patterns_0'range loop

      in0 <= input_patterns_0(i);
        
      wait for 1 ns;

      assert out0 = output_patterns(i)
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
  

