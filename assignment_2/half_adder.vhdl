library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port(
    i0      : in std_logic;
    i1      : in std_logic;
    car_out : out std_logic;
    sum_out : out std_logic
    );
end half_adder;


architecture rtl of half_adder is

  component xor_gate is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      xor_out : out std_logic
      );
  end component xor_gate;

  component and_gate is
    port(
      i0      : in std_logic;
      i1      : in std_logic;
      and_out : out std_logic
      );
  end component and_gate;

begin

  xor1 : xor_gate port map(i0 => i0, i1 => i1, xor_out => sum_out);
  and1 : and_gate port map(i0 => i0, i1 => i1, and_out => car_out);

end rtl;

