library ieee;
use ieee.std_logic_1164.all;

entity or_gate_tb is
end or_gate_tb;

architecture behav of or_gate_tb is

  component or_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      or_out : out std_logic
      );
  end component or_gate;

  signal in0, in1, out0 : std_logic;

  for or0 : or_gate use entity work.or_gate;

begin

  or0 : or_gate
    port map(
      i0 => in0,
      i1 => in1,
      or_out => out0
      );

  process
    type pattern_type is record
      in0, in1 : std_logic;
      or_out : std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0'),
       ('1','0','1'),
       ('0','1','1'),
       ('1','1','1'));

  begin
    for i in patterns'range loop

      in0 <= patterns(i).in0;
      in1 <= patterns(i).in1;

      wait for 1 ns;

      assert out0 = patterns(i).or_out
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;
