library ieee;
use ieee.std_logic_1164.all;

entity mux is
  port(
    i0 : in std_logic;
    i1 : in std_logic;
    sel: in std_logic;
    mux_out: out std_logic
    );
end entity;

architecture rtl of mux is
  component nand_gate is
    port(
      i0 : in std_logic;
      i1 : in std_logic;
      nand_out : out std_logic
      );
  end component nand_gate;

  component not_gate is
    port(
      i0 : in std_logic;
      not_out : out std_logic
      );
  end component not_gate;

  signal not_sel, not_a, not_b, output : std_logic;

begin

  not0 : not_gate port map(i0 => sel, not_out => not_sel);
  nanda : nand_gate port map(i0 => i0, i1 => not_sel, nand_out => not_a);
  nandb : nand_gate port map(i0 => i1, i1 => sel, nand_out => not_b);
  nandab: nand_gate port map(i0 => not_a, i1 => not_b, nand_out => output);

  mux_out <= output;

end rtl;
