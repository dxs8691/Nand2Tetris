library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;


architecture behav of half_adder_tb is

  component half_adder is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      car_out : out std_logic;
      sum_out : out std_logic
      );
  end component half_adder;
  
  signal in0, in1, outCar, outSum : std_logic;

  for hAdd : half_adder use entity work.half_adder;

begin

  hAdd : half_adder
    port map(
      i0      => in0,
      i1      => in1,
      car_out => outCar,
      sum_out => outSum
      );

  process

    type pattern_type is record
      i0,i1 : std_logic;
      car_out,sum_out : std_logic;
    end record;

    type pattern_arr is array (natural range <>) of pattern_type;
    constant patterns : pattern_arr :=
      (('0','0','0','0'),
       ('0','1','0','1'),
       ('1','0','0','1'),
       ('1','1','1','0'));

  begin

    for i in patterns'range loop

      in0 <= patterns(i).i0;
      in1 <= patterns(i).i1;

      wait for 1 ns;

      assert outCar = patterns(i).car_out
        report "incorrect output" severity error;

      assert outSum = patterns(i).sum_out
        report "incorrect output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;

