library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end entity;

architecture behav of full_adder_tb is

  component full_adder is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      cin: in std_logic;
      car_out : out std_logic;
      sum_out : out std_logic
      );
  end component full_adder;

  signal in0, in1, inC, outCar, outSum : std_logic;

  for fAdd : full_adder use entity work.full_adder;

begin

  fAdd : full_adder
    port map(
      i0      => in0,
      i1      => in1,
      cin     => inC,
      car_out => outCar,
      sum_out => outSum
      );

  process

    type pattern_type is record
      i0, i1, cin : std_logic;
      car_out, sum_out : std_logic;
    end record;

    type pattern_arr is array(natural range <>) of pattern_type;

    constant patterns : pattern_arr :=
      (('0','0','0','0','0'),
       ('0','0','1','0','1'),
       ('0','1','0','0','1'),
       ('0','1','1','1','0'),
       ('1','0','0','0','1'),
       ('1','0','1','1','0'),
       ('1','1','0','1','0'),
       ('1','1','1','1','1'));

  begin

    for i in patterns'range loop

      in0 <= patterns(i).i0;
      in1 <= patterns(i).i1;
      inC <= patterns(i).cin;

      wait for 1 ns;

      assert outCar = patterns(i).car_out
        report "Incorrect carry output" severity error;

      assert outSum = patterns(i).sum_out
        report "Incorrect sum output" severity error;

    end loop;

    assert false report "end of test" severity note;

    wait;

  end process;

end behav;


  
