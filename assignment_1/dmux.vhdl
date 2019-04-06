library ieee;
use ieee.std_logic_1164.all;

entity dmux is
  port(
    i0 : in std_logic;
    sel: in std_logic;
    out0: out std_logic;
    out1: out std_logic
    );
end entity;

architecture rtl of dmux is
  component and_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      and_out : out std_logic
      );
  end component and_gate;

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  signal not_sel, a, b : std_logic;

begin

  not0 : not_gate port map(i0 => sel, not_out => not_sel);
  anda : and_gate port map(i0 => i0, i1 => not_sel, and_out => a);
  andb : and_gate port map(i0 => i0, i1 => sel, and_out => b);

  out0 <= a;
  out1 <= b;

end rtl;
