library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port(
    i0      : in std_logic;
    i1      : in std_logic;
    cin     : in std_logic;
    car_out : out std_logic;
    sum_out : out std_logic
    );
end entity full_adder;


architecture rtl of full_adder is

  component half_adder is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      car_out : out std_logic;
      sum_out : out std_logic
      );
  end component half_adder;

  component xor_gate is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      xor_out : out std_logic
      );
  end component xor_gate;

  signal in0, in1, inC, s0, c0, s1, c1  : std_logic;

begin

  hAdd1 : half_adder port map(i0 => i0, i1 => i1, car_out => c0, sum_out => s0);
  hAdd2 : half_adder port map(i0 => s0, i1 => cin, car_out => c1, sum_out => s1);
  xor1  : xor_gate   port map(i0 => c0, i1 => c1, xor_out => car_out);

  sum_out <= s1;

end rtl;
